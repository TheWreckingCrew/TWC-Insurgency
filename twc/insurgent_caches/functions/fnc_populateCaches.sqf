#include "..\script_component.hpp"

params ["_amount", ["_exclusionMarkers", [], [[]]]];

local _buildingClusters = [[[worldSize / 2, worldSize / 2], worldSize / 2], EFUNC(building_clusters,findBuildingClusters), missionNamespace, QEGVAR(building_clusters,allBuildings), 1E11] call ACE_common_fnc_cachedCall;

local _fnc_filterBuildingPositions = {
    if (([_x] call BIS_fnc_buildingPositions) isEqualTo []) exitWith {nil};
    if (_exclusionMarkers isEqualTo []) exitWith {_x};

    local _value = _x;
    local _position = getPos _x;
    {
        // Oriented Bounding Box check
        local _min = getMarkerPos _x vectorAdd ((getMarkerSize _x + [0]) vectorMultiply -1);
        local _max = getMarkerPos _x vectorAdd (getMarkerSize _x + [0]);
        local _relativePosition = [getMarkerPos _x, _position, markerDir _x] call CBA_fnc_vectRotate2D;
        _relativePosition params ["_posX", "_posY"];
        _min params ["_minX", "_minY"];
        _max params ["_maxX", "_maxY"];

        // Make value nil if inbounds
        if (_posX >= _minX && _posX <= _maxX && _posY >= _minY && _posY <= _maxY) exitWith {nil};
        _value
    } forEach _exclusionMarkers
};

{
    _x = [_x, _fnc_filterBuildingPositions] call CBA_fnc_filter;
    _x = _x arrayIntersect _x;
    if (_x isEqualTo []) then {
        _x = nil;
    };
    _buildingClusters set [_forEachIndex, _x];
} forEach _buildingClusters;

_buildingClusters = _buildingClusters arrayIntersect _buildingClusters;

// Spawn Caches
for "_i" from 0 to _amount step 1 do {
    if (count _buildingClusters <= 0) exitWith {};

    local _cluster = _buildingClusters call BIS_fnc_selectRandom;
    local _building = _cluster call BIS_fnc_selectRandom;
    [_building, "Box_FIA_Wps_F"] call FUNC(spawnCache);
    _buildingClusters = _buildingClusters - [_cluster];
};
