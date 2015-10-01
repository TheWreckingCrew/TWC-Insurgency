
private["_origin", "_counter", "_amountToPlace", "_distance", "_side", "_iedArray","_paramArray", "_paramCounter", "_debug"];

iedObjects = ["IEDLandBig_F","IEDLandSmall_F"];
_paramCounter = 0;
_paramArray = _this;
IedList = [];
iedAction = ["DisarmIed","Disarm IED","",{[1, [nearestObjects [player, iedObjects, 3]], {[_args] call InsP_fnc_deleteIed;}, {}, 'Disarming...'] call ace_common_fnc_progressBar;},{true}] call ace_interact_menu_fnc_createAction;

while {_paramCounter < (count _paramArray)} do  {
	_arr = _paramArray select _paramCounter;
	_paramCounter = _paramCounter + 1;
	
	_origin = getmarkerpos (_arr select 0);
	_counter = 0;
	_amountToPlace = _arr select 1;
	_distance = _arr select 2;
	_side = _arr select 3;

	while{_counter < _amountToPlace} do {
		_rdist1 = 5;
		_offSetDirection = 1;
		if((random 100) > 50) then { _offSetDirection = -1;};
		
		_roads = _origin nearRoads _distance;
		
		if(count _roads == 0) exitwith {};
		
		_iedType = iedObjects select(floor random(count iedObjects));
		_road = _roads select(round random(count _roads));
		while{isnil("_road")} do {_road = _roads select(round random(count _roads));};
		_dir  = getDir _road;
		_position = getpos _road;
		_positionX = _position select 0;
		_positionY = _position select 1;
		_tx = (_positionX + (_rdist1 * sin(_dir)));
		_ty = (_positionY + (_rdist1 * cos(_dir)));
		
		while{isOnRoad [_tx,_ty,0]} do{
			_rdist1 = _rdist1 + _offSetDirection;
			_tx = (_positionX + (_rdist1 * sin(_dir)));
			_ty = (_positionY + (_rdist1 * cos(_dir)));
		};	
		
		_tx = (_positionX + ((_rdist1 + 1 *_offSetDirection) * sin(_dir)));
		_ty = (_positionY + ((_rdist1 + 1 *_offSetDirection) * cos(_dir)));
		
		_iedPos = [_tx,_ty,-0.05];

		_physicalIed = createVehicle [_iedType, _iedPos, [], 0, "CAN_COLLIDE"];
		[_physicalIed, 0, ["ACE_MainActions"],iedAction] call ace_interact_menu_fnc_addActionToObject;
		
		IedList pushBack _physicalIed;
		publicVariable "IedList";
		
		_iedTrigger = [_physicalIed] spawn InsP_fnc_setIedTrigger;
		
		_counter = _counter + 1;
	};
};