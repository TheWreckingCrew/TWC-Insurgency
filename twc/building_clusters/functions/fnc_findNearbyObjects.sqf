params ["_object", "_objectPool", "_maxDistance"];

local _nearbyObjects = [];
local _squaredDistance = _maxDistance * _maxDistance;

{
    if ((_object distanceSqr _x) <= _squaredDistance) then {
        _nearbyObjects pushBack _x;
    };
    nil
} count _objectPool;

_nearbyObjects
