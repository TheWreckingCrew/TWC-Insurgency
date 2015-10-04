
InsP_fnc_questionDisplay = compile preProcessFileLineNumbers "client\sys_intel\fnc_questionDisplay.sqf";
InsP_fnc_deadCache = compile preProcessFileLineNumbers "server\sys_cache\fnc_deadCache.sqf";
InsP_fnc_deadAAGun = compile preProcessFileLineNumbers "server\sys_aaGun\fnc_deadAAGun.sqf";

#include "sys_ai\init.sqf";

if (isNil "InsP_iedDestroyed") then {
	InsP_iedDestroyed = 0;
	publicVariable "InsP_iedDestroyed";
};

if (isNil "InsP_ammoCaches") then {
	InsP_ammoCaches = 0;
	publicVariable "InsP_ammoCaches";
};

if (isNil "InsP_aagDestroyed") then {
	InsP_aagDestroyed = 0;
	publicVariable "InsP_aagDestroyed";
};

if (isNil "InsP_enemyMorale") then {
	InsP_enemyMorale = 0;
	publicVariable "InsP_enemyMorale";
};

if (isNil "InsP_bluDeath") then {
	InsP_bluDeath = 0;
	publicVariable "InsP_bluDeath";
};

if (isNil "DeadInsurgents") then {
	DeadInsurgents = [];
	publicVariable "DeadInsurgents";
};

if (isNil "IedList") then {
	IedList = [];
	publicVariable "IedList";
};

if (isNil "cacheAMarkers") then {
	cacheAMarkers = [];
	publicVariable "cacheAMarkers";
	cacheBMarkers = [];
	publicVariable "cacheBMarkers";
	cacheCMarkers = [];
	publicVariable "cacheCMarkers";
	cacheDMarkers = [];
	publicVariable "cacheDMarkers";
	cacheEMarkers = [];
	publicVariable "cacheEMarkers";
};

#include "sys_cache\init.sqf";
#include "sys_aaGun\init.sqf";
#include "sys_bluDeath\init.sqf";
#include "sys_ied\init.sqf";
#include "sys_iedAttack\init.sqf";

_townSetup1 = execVM "server\sys_townSetup\centerMarkers.sqf";
_townSetup2 = execVM "server\sys_townSetup\agiaMarinaArea.sqf";
_townSetup3 = execVM "server\sys_townSetup\baseArea.sqf";

waitUntil{scriptDone _townSetup1 && scriptDone _townSetup2 && scriptDone _townSetup3};

#include "sys_vehicles\init.sqf";

campFirePerson4 setPosATL [2115.54, 5709.9, 0];

#include "sys_townSetup\init.sqf";