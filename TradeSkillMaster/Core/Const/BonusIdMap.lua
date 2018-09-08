-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...

TSM.CONST.IMPORTANT_BONUS_ID_MAP = {
	[40] = 40,
	[41] = 41,
	[42] = 42,
	[43] = 43,
	[1457] = 1457,
	[1462] = 1462,
	[1467] = 1467,
	[1472] = 1472,
	[1477] = 1477,
	[1482] = 1482,
	[1487] = 1487,
	[1492] = 1492,
	[1497] = 1497,
	[1502] = 1502,
	[1507] = 1507,
	[1512] = 1512,
	[1517] = 1517,
	[1522] = 1522,
	[1527] = 1527,
	[1676] = 1676,
	[1677] = 1676,
	[1678] = 1676,
	[1679] = 1676,
	[1680] = 1676,
	[1681] = 1676,
	[1682] = 1676,
	[1683] = 1683,
	[1684] = 1683,
	[1685] = 1683,
	[1686] = 1683,
	[1687] = 1683,
	[1688] = 1683,
	[1689] = 1683,
	[1690] = 1690,
	[1691] = 1690,
	[1692] = 1690,
	[1693] = 1690,
	[1694] = 1690,
	[1695] = 1690,
	[1696] = 1690,
	[1697] = 1697,
	[1698] = 1697,
	[1699] = 1697,
	[1700] = 1697,
	[1701] = 1697,
	[1702] = 1697,
	[1703] = 1697,
	[1704] = 1704,
	[1705] = 1704,
	[1706] = 1704,
	[1707] = 1704,
	[1708] = 1704,
	[1709] = 1704,
	[1710] = 1704,
	[1711] = 1711,
	[1712] = 1711,
	[1713] = 1711,
	[1714] = 1711,
	[1715] = 1711,
	[1716] = 1711,
	[1717] = 1711,
	[1742] = 1676,
	[1743] = 1676,
	[1744] = 1676,
	[1745] = 1676,
	[1746] = 1676,
	[1747] = 1676,
	[1748] = 1676,
	[1749] = 1683,
	[1750] = 1683,
	[1751] = 1683,
	[1752] = 1683,
	[1753] = 1683,
	[1754] = 1683,
	[1755] = 1683,
	[1756] = 1690,
	[1757] = 1690,
	[1758] = 1690,
	[1759] = 1690,
	[1760] = 1690,
	[1761] = 1690,
	[1762] = 1690,
	[1763] = 1697,
	[1764] = 1697,
	[1765] = 1697,
	[1766] = 1697,
	[1767] = 1697,
	[1768] = 1697,
	[1769] = 1697,
	[1770] = 1704,
	[1771] = 1704,
	[1772] = 1704,
	[1773] = 1704,
	[1774] = 1704,
	[1775] = 1704,
	[1776] = 1704,
	[1777] = 1711,
	[1778] = 1711,
	[1779] = 1711,
	[1780] = 1711,
	[1781] = 1711,
	[1782] = 1711,
	[1783] = 1711,
	[1808] = 1808,
	[3336] = 3336,
	[3337] = 3337,
	[3343] = 1676,
	[3344] = 1676,
	[3345] = 1676,
	[3346] = 1683,
	[3347] = 1683,
	[3348] = 1683,
	[3349] = 1690,
	[3350] = 1690,
	[3352] = 1683,
	[3353] = 1690,
	[3354] = 1683,
	[3355] = 1697,
	[3356] = 1697,
	[3357] = 1697,
	[3358] = 1711,
	[3359] = 1711,
	[3360] = 1711,
	[3361] = 1676,
	[3362] = 1676,
	[3363] = 1676,
	[3364] = 1704,
	[3365] = 1704,
	[3366] = 1704,
	[3367] = 1711,
	[3368] = 1711,
	[3369] = 1711,
	[3370] = 1690,
	[3371] = 1690,
	[3372] = 1690,
	[3373] = 1697,
	[3374] = 1697,
	[3375] = 1697,
	[3376] = 1704,
	[3377] = 1704,
	[3378] = 1704,
	[3401] = 1676,
	[3402] = 1683,
	[3403] = 1690,
	[3404] = 1697,
	[3405] = 1704,
	[3406] = 1711,
	[3528] = 3528,
	[3610] = 3610,
	[3611] = 3611,
	[3612] = 3612,
	[3613] = 3613,
	[4783] = 4783,
	[4784] = 4784,
	[4786] = 4786,
	[4796] = 4796,
	[4798] = 4798,
	[4799] = 4799,
	[4802] = 4802,
	[4926] = 4926,
	[4927] = 4927,
	[4928] = 4928,
}
