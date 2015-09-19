
_unitsNearby = _this select 0;

{
	if(speed _x >= 2.76 && (getPosATL _x select 2) < 4) then {
		true;
	}else{
		false;
	};
}forEach _unitsNearby;