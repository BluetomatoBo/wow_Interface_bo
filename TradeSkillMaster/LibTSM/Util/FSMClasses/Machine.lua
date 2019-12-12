-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

--- FSMMachine Class.
-- This class allows implementing event-driving finite state machines.
-- @classmod FSMMachine

local _, TSM = ...
local Machine = TSM.Init("Util.FSMClasses.Machine")
local State = TSM.Include("Util.FSMClasses.State")
local TempTable = TSM.Include("Util.TempTable")
local Log = TSM.Include("Util.Log")
local LibTSMClass = TSM.Include("LibTSMClass")
local FSMMachine = LibTSMClass.DefineClass("FSMMachine")
local private = {
	eventTransitionHandlerCache = {},
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function Machine.Create(name)
	return FSMMachine(name)
end



-- ============================================================================
-- Class Meta Methods
-- ============================================================================

function FSMMachine.__init(self, name)
	self._name = name
	self._currentState = nil
	self._context = nil
	self._loggingDisabledCount = 0
	self._stateObjs = {}
	self._defaultEvents = {}
end



-- ============================================================================
-- Public Class Methods
-- ============================================================================

--- Add an FSM state.
-- @tparam FSM self The FSM object
-- @tparam FSMState stateObj The FSM state object to add
-- @treturn FSM The FSM object
function FSMMachine.AddState(self, stateObj)
	assert(State.IsInstance(stateObj))
	local name = stateObj:_GetName()
	assert(not self._stateObjs[name], "state already exists")
	self._stateObjs[stateObj:_GetName()] = stateObj
	return self
end

--- Add a default event handler.
-- @tparam FSM self The FSM object
-- @tparam string event The event name
-- @tparam function handler The default event handler
-- @treturn FSM The FSM object
function FSMMachine.AddDefaultEvent(self, event, handler)
	assert(not self._defaultEvents[event], "event already exists")
	self._defaultEvents[event] = handler
	return self
end

--- Add a simple default event-based transition.
-- @tparam FSMMachine self The FSMMachine object
-- @tparam string event The event name
-- @tparam string toState The state to transition to
-- @treturn FSMMachine The FSMMachine object
function FSMMachine.AddDefaultEventTransition(self, event, toState)
	if not private.eventTransitionHandlerCache[toState] then
		private.eventTransitionHandlerCache[toState] = function(context, ...)
			return toState, ...
		end
	end
	return self:AddDefaultEvent(event, private.eventTransitionHandlerCache[toState])
end

--- Initialize the FSM.
-- @tparam FSM self The FSM object
-- @tparam string initialState The name of the initial state
-- @param[opt={}] context The FSM context table which gets passed to all state and event handlers
-- @treturn FSM The FSM object
function FSMMachine.Init(self, initialState, context)
	assert(self._stateObjs[initialState], "invalid initial state")
	self._currentState = initialState
	self._context = context or {}
	-- validate all the transitions
	for name, obj in pairs(self._stateObjs) do
		for _, toState in obj:_ToStateIterator() do
			assert(self._stateObjs[toState], format("toState doesn't exist (%s -> %s)", name, toState))
		end
	end
	return self
end

--- Process an event.
-- @tparam FSM self The FSM object
-- @tparam string event The name of the event
-- @tparam[opt] vararg ... Additional arguments to pass to the handler function
-- @treturn FSM The FSM object
function FSMMachine.ProcessEvent(self, event, ...)
	assert(self._currentState, "FSM not initialized")
	if self._handlingEvent then
		Log.Warn("[%s] %s (ignored - handling event)", self._name, event)
		return self
	elseif self._inTransition then
		Log.Warn("[%s] %s (ignored - in transition)", self._name, event)
		return self
	end

	if self._loggingDisabledCount == 0 then
		Log.Info("[%s] %s", self._name, event)
	end
	self._handlingEvent = true
	local currentStateObj = self._stateObjs[self._currentState]
	if currentStateObj:_HasEventHandler(event) then
		self:_Transition(TempTable.Acquire(currentStateObj:_ProcessEvent(event, self._context, ...)))
	elseif self._defaultEvents[event] then
		self:_Transition(TempTable.Acquire(self._defaultEvents[event](self._context, ...)))
	end
	self._handlingEvent = false
	return self
end

--- Enable or disable event and state transition logs (can be called recursively).
-- @tparam FSM self The FSM object
-- @tparam boolean enabled Whether or not logging should be enabled
-- @treturn FSM The FSM object
function FSMMachine.SetLoggingEnabled(self, enabled)
	self._loggingDisabledCount = self._loggingDisabledCount + (enabled and -1 or 1)
	assert(self._loggingDisabledCount >= 0)
	return self
end



-- ============================================================================
-- Private Class Methods
-- ============================================================================

function FSMMachine._Transition(self, eventResult)
	local result = eventResult
	while result[1] do
		-- perform the transition
		local currentStateObj = self._stateObjs[self._currentState]
		local toState = tremove(result, 1)
		local toStateObj = self._stateObjs[toState]
		if self._loggingDisabledCount == 0 then
			Log.Info("[%s] %s -> %s", self._name, self._currentState, toState)
		end
		assert(toStateObj and currentStateObj:_IsTransitionValid(toState), "invalid transition")
		self._inTransition = true
		currentStateObj:_Exit(self._context)
		self._currentState = toState
		result = TempTable.Acquire(toStateObj:_Enter(self._context, TempTable.UnpackAndRelease(result)))
		self._inTransition = false
	end
	TempTable.Release(result)
end
