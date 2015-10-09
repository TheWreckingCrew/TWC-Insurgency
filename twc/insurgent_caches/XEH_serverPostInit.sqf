#include "script_component.hpp"

[QGVAR(destroyed), {
    params ["_unit", "_unitType", "_position"];

    local _markerName = format [QGVAR(destroyedCache_%1), [_unit, QGVAR(cache_)] call BIS_fnc_objectVar];
    local _marker = createMarker [_markerName, _position];
    _marker setMarkerType "mil_triangle";
    _marker setMarkerColor "ColorOrange";
    _marker setMarkerText ("Cache Destroyed");
    _marker setMarkerSize [0.75, 0.75];
    [_marker, true] call CBA_fnc_setMarkerPersistent;
}] call ACE_common_fnc_addEventhandler;

["CacheAmount" call BIS_fnc_getParamValue, ["baseRestrictionZone"]] call FUNC(populateCaches);
