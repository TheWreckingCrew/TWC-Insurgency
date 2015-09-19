waitUntil {!isNil "IedList"};

{
	_positionForTrigger = getPosATL _x;
	_areaForTrigger = [3,3,0,false];
	_activationForTrigger = ["WEST", "PRESENT", true];
	_stateForTrigger = ["this",
	"
		{
		_x addAction ['Disarm IED', {
			[90, [], {removeAllActions player; call InsP_fnc_deleteIed;}, {}, 'Disarming...'] call ace_common_fnc_progressBar;
		}];
		}forEach thisList;
	", "deleteVehicle thisTrigger;"];

	_iedTriggerArea = ([_positionForTrigger, "AREA:", _areaForTrigger, "ACT:", _activationForTrigger, "STATE:", _stateForTrigger] call CBA_fnc_createTrigger) select 0;
} forEach IedList;


