/*
Written by WiredTiger 28/04/2015
////////////////////////////////
1.List markers in an array to spawn ai.
2.Markers to move to.
3.Trigger name to delete when done.
////////////////////////////////
Examples:
example1 = [["marker1", "marker2"], ["attackLocaiton", "secondLocation"], trigger name] spawn InsP_fnc_spawnAI;
example2 = [["m"], ["Location"], trigger name] spawn InsP_fnc_spawnAI;
*/

_spawnLocations = _this select 0;
_attackLocations = _this select 1;
_triggerName = _this select 2;
_spawnDelay = 30;
_amountWaves = 1;
_spawnedWaves = 0;

sleep 15;

while {(_amountWaves - _spawnedWaves) > 0} do {
	_spawnedWaves = _spawnedWaves + 1;
	_selectSpawn = _spawnLocations call BIS_fnc_selectRandom;
	_selectAttack = _attackLocations call BIS_fnc_selectRandom;
	_spawnGroup = [getmarkerpos _selectSpawn, opfor, (configfile >> "CfgGroups" >> "Indep" >> "rhs_faction_insurgents" >> "Infantry" >> "IRG_InfTeam")] call BIS_fnc_spawnGroup;
	[_spawnGroup, (getmarkerpos _selectAttack), 40] call CBA_fnc_taskAttack;

	waitUntil{triggerActivated _triggerName};
	sleep _spawnDelay;
	
	if (floor InsP_enemyMorale <= -3) then {_spawnDelay = 60; _amountWaves = 32;};
	if (floor InsP_enemyMorale == -2) then {_spawnDelay = 75; _amountWaves = 27;};
	if (floor InsP_enemyMorale == -1) then {_spawnDelay = 90; _amountWaves = 21;};
	if (floor InsP_enemyMorale == 0) then {_spawnDelay = 105; _amountWaves = 16;};
	if (floor InsP_enemyMorale == 1) then {_spawnDelay = 125; _amountWaves = 14;};
	if (floor InsP_enemyMorale == 2) then {_spawnDelay = 145; _amountWaves = 12;};
	if (floor InsP_enemyMorale >= 3) then {_spawnDelay = 165; _amountWaves = 10;};
};

deleteVehicle _triggerName;