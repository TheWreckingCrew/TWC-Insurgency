
InsP_fnc_explosionTest = compile preprocessFileLineNumbers "server\sys_ied\fn_explosionTest.sqf";
InsP_fnc_setIedTrigger = compile preprocessFileLineNumbers "server\sys_ied\fn_setIedTrigger.sqf";

if(isNil "IEDSpawned") then
{
	[["ied1", 6, 1500],
	["ied2", 6, 1500],
	["ied3", 6, 1500],
	["ied4", 6, 1500],
	["ied5", 6, 1500]] execVM "server\sys_ied\iedSetup.sqf";
	IEDSpawned = true;
};