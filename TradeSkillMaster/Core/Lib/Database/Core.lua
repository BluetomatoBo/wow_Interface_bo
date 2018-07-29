-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- Database TSMAPI_FOUR Functions.
-- @module Database

TSMAPI_FOUR.Database = {}
local _, TSM = ...
local Database = TSM:NewPackage("Database")
Database.classes = {}
local private = {
	-- make the initial UUID a very big negative number so it doesn't conflict with other numbers
	lastUUID = -1000000,
	databaseQueries = nil,
	databaseQueryClauses = nil,
	databaseQueryResultRows = nil,
	dbByNameLookup = {},
	infoNameDB = nil,
	infoFieldDB = nil,
}
local INFO_NAME_DB_SCHEMA = {
	fields = {
		name = "string",
	},
	fieldAttributes = {
		name = { "unique", "index" },
	},
}
local INFO_FIELD_DB_SCHEMA = {
	fields = {
		dbName = "string",
		field = "string",
		type = "string",
		attributes = "string",
		order = "number",
	},
	fieldAttributes = {
		dbName = { "index" },
	},
}



-- ============================================================================
-- TSMAPI Functions
-- ============================================================================

--- Create a new database.
-- @tparam table schema The database schema
-- @tparam string name The name of the database for debug use
-- @treturn Database The database object
function TSMAPI_FOUR.Database.New(schema, name)
	name = name or tostring(schema)
	private.infoNameDB:NewRow()
		:SetField("name", name)
		:Create()
	local nextOrder = 1
	for field, type in pairs(schema.fields) do
		private.infoFieldDB:NewRow()
			:SetField("dbName", name)
			:SetField("field", field)
			:SetField("type", type)
			:SetField("attributes", schema.fieldAttributes and schema.fieldAttributes[field] and table.concat(schema.fieldAttributes[field], ",") or "")
			:SetField("order", schema.fieldOrder and TSMAPI_FOUR.Util.TableKeyByValue(schema.fieldOrder, field) or nextOrder)
			:Create()
		nextOrder = nextOrder + 1
	end
	if schema.fieldAttributes then
		for field in pairs(schema.fieldAttributes) do
			if not schema.fields[field] then
				-- multi-field index
				private.infoFieldDB:NewRow()
					:SetField("dbName", name)
					:SetField("field", field)
					:SetField("type", "-")
					:SetField("attributes", "multi-field index")
					:SetField("order", -1)
					:Create()
			end
		end
	end
	local db = Database.classes.Database(schema)
	private.dbByNameLookup[name] = db
	return db
end



-- ============================================================================
-- Module Functions (Internal)
-- ============================================================================

function Database.OnInitialize()
	private.databaseQueries = TSMAPI_FOUR.ObjectPool.New("DATABASE_QUERIES", Database.classes.DatabaseQuery, 1)
	private.databaseQueryClauses = TSMAPI_FOUR.ObjectPool.New("DATABASE_QUERY_CLAUSES", Database.classes.DatabaseQueryClause, 3)
	private.databaseQueryResultRows = TSMAPI_FOUR.ObjectPool.New("DATABASE_QUERY_RESULT_ROWS", Database.DatabaseQueryResultRow.New)

	-- Create the information databases
	private.infoNameDB = Database.classes.Database(INFO_NAME_DB_SCHEMA)
	private.infoFieldDB = Database.classes.Database(INFO_FIELD_DB_SCHEMA)
end

function Database.GetNextUUID()
	private.lastUUID = private.lastUUID - 1
	return private.lastUUID
end

function Database.GetDatabaseQuery()
	return private.databaseQueries:Get()
end

function Database.RecycleDatabaseQuery(query)
	private.databaseQueries:Recycle(query)
end

function Database.GetDatabaseQueryClause()
	return private.databaseQueryClauses:Get()
end

function Database.RecycleDatabaseQueryClause(queryClause)
	private.databaseQueryClauses:Recycle(queryClause)
end

function Database.GetDatabaseQueryResultRow()
	return private.databaseQueryResultRows:Get()
end

function Database.RecycleDatabaseQueryResultRow(row)
	private.databaseQueryResultRows:Recycle(row)
end



-- ============================================================================
-- Debug Functions
-- ============================================================================

function Database.InfoNameIterator()
	return private.infoNameDB:NewQuery()
		:Select("name")
		:OrderBy("name", true)
		:IteratorAndRelease()
end

function Database.CreateInfoFieldQuery(dbName)
	return private.infoFieldDB:NewQuery()
		:Equal("dbName", dbName)
end

function Database.GetNumRows(dbName)
	return private.dbByNameLookup[dbName]:GetNumRows()
end

function Database.GetNumActiveQueries(dbName)
	return #private.dbByNameLookup[dbName]._queries
end

function Database.CreateDBQuery(dbName)
	return private.dbByNameLookup[dbName]:NewQuery()
end
