params ["_rootObject", "_objectPool"];

local _cluster = [_rootObject];
local _identifiedObjects = [];

local _i = 0;
while {_i < count _cluster} do {
    local _currentElement = _cluster select _i;
    if (!(_currentElement in _identifiedObjects)) then {
        _cluster append ([_currentElement, _objectPool] call FUNC(findNearbyObjects));
        _identifiedObjects pushBack _currentElement;
    };
    _i = _i + 1;
};

_cluster arrayIntersect _cluster
