
_spawnMarker = _this select 0;
_spawnRadius = _this select 1;
_amountToSpawn = _this select 2;

_roadList = (getMarkerPos _spawnMarker) nearRoads _spawnRadius;
_vehicle = 0;
_vehicleList = ["C_Offroad_01_F", "rhs_uaz_open_chdkz", "C_SUV_01_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Van_01_transport_F"];

while {_vehicle < _amountToSpawn} do {
	_roadPos = _roadList call BIS_fnc_selectRandom;
	_selectVehicle = _vehicleList select (floor(random(count _vehicleList)));
	_newVehicle = _selectVehicle createVehicle (position _roadPos);
	
	while {isOnRoad _newVehicle} do {
		_xAxis = 3;
		_yAxis = 3;
		
		if ((random 100) > 50) then {
			_xAxis = -3;
		};
		
		if ((random 100) > 50) then {
			_yAxis = -3;
		};
		
		_newVehicle setPosATL [(getPosATL _newVehicle select 0) + _xAxis,
			(getPosATL _newVehicle select 1) + _yAxis, 0];
		_newVehicle setDir (random 360);
	};
	
	_vehicle = _vehicle + 1;
};