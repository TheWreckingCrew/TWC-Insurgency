#include "..\script_component.hpp"

params ["_rootObject", "_objectPool", "_maxDistance"];

local _cluster = [_rootObject];
local _identifiedObjects = [];

local _i = 0;
while {_i < count _cluster} do {
    local _currentElement = _cluster select _i;
    if (!(_currentElement in _identifiedObjects)) then {
        _cluster append ([_currentElement, _objectPool, _maxDistance] call FUNC(findNearbyObjects));
        _identifiedObjects pushBack _currentElement;
    };
    _i = _i + 1;
};

_cluster arrayIntersect _cluster
