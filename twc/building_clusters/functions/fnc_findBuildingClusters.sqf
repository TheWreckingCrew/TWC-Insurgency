params ["_position", "_range"];

local _buildings = nearestObjects [_position, ["HouseBase"], _range];

if (_buildings isEqualTo []) exitWith {[]};

local _clusters = [];

while {!(_buildings isEqualTo [])} do {
     local _calculatedCluster = [_buildings select 0, _buildings] call FUNC(findClusteredObjects);
    _clusters pushBack _calculatedCluster;
    _buildings = _buildings - _clusters;
};

_clusters
