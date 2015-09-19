while{true} do {
	waitUntil{(count playableUnits) != 0};
	sleep 720;

	_allUnits = call CBA_fnc_players;
	_findingTarget = true;
	_bluforUnits = [];
  
	{
		if((side _x) == west) then {
		_bluforUnits pushBack _x;
		};
	}forEach _allUnits;
	
	sleep .05;
	
	if((count _bluforUnits) != 0) then {
		while{_findingTarget} do {
			_bluforTarget = _bluforUnits call BIS_fnc_selectRandom;
			sleep .05;
			
			if((getPosATL _bluforTarget select 2) < 10) then {
				if((_bluforTarget distance (getMarkerPos "mainBase")) > 1000) then {
					_spawnPos = [_bluforTarget, 200] call CBA_fnc_randPos;
					_attackSquad = [_spawnPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "rhs_faction_insurgents" >> "Infantry" >> "IRG_InfTeam")] call BIS_fnc_spawnGroup;
					[_attackSquad, (position _bluforTarget), 20] call CBA_fnc_taskAttack;

					_findingTarget = false;
				};
			};
		};
	};
};