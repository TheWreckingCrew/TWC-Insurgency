#include "..\script_component.hpp"

params ["_building", "_cacheObjectType"];

local _randomBuildingPosition = ([_building] call BIS_fnc_buildingPositions) call BIS_fnc_selectRandom;
local _cache = createVehicle [_cacheObjectType, _randomBuildingPosition, [], 0, "NONE"];
_cache addEventHandler ["Killed", {
    params ["_unit", "_killer"];
    [QGVAR(destroyed), [_unit, typeOf _unit, getPos _unit]] call ACE_common_fnc_globalEvent;
    deleteVehicle _unit;
}];
