_dissarmedIed = ((_this select 0) select 0) select 0;
//hint format ["%1", _dissarmedIed];
deleteVehicle _dissarmedIed;

InsP_iedDestroyed = InsP_iedDestroyed +1;
publicVariable "InsP_iedDestroyed";

InsP_enemyMorale = InsP_enemyMorale + .1;
publicVariable "InsP_enemyMorale";