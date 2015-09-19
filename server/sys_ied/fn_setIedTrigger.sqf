
_iedToActivate = _this select 0;
_positionForTrigger = getPosATL _iedToActivate;
_areaForTrigger = [12,12,0,false];
_activationForTrigger = ["ANY", "PRESENT", false];
_stateForTrigger = ["[thisList] call InsP_fnc_explosionTest && (alive (thisTrigger getVariable ['ied', objNull]))", "(thisTrigger getVariable ['ied', objNull]) setDamage 1; deleteVehicle thisTrigger", ""];

_iedTriggerArea = ([_positionForTrigger, "AREA:", _areaForTrigger, "ACT:", _activationForTrigger, "STATE:", _stateForTrigger] call CBA_fnc_createTrigger) select 0;
_iedTriggerArea setVariable ["ied", _iedToActivate];