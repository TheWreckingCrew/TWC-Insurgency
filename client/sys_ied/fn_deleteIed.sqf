{
	_closestIed = nearestObjects [player, [], 4]; 
	if (_x in _closestIed) then {
		deleteVehicle _x;
	};
}forEach IedList;

InsP_iedDestroyed = InsP_iedDestroyed +1;
publicVariable "InsP_iedDestroyed";

InsP_enemyMorale = InsP_enemyMorale + .1;
publicVariable "InsP_enemyMorale";