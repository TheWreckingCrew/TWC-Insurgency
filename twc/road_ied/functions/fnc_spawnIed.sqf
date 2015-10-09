/*
 * Author: MikeMatrix
 * Create an IED of given type at given position in specified spawn radius.
 *
 * Arguments:
 * 0: IED Type <STRING>
 * 1: Position <ARRAY>
 * 2: Spawn Radius <NUMBER>
 * 3: Trigger Radius <NUMBER>
 *
 * Return Value:
 * IED <OBJECT>
 *
 * Example:
 * ["IEDLandBig_F", getPos player, 3] call TWC_road_ied_fnc_spawnIed
 */
#include "..\script_component.hpp"

params ["_iedType", "_position", ["_spawnRadius", 0], ["_triggerRadius", 12]];

// Create visible explosive object
local _ied = createVehicle [_iedType, _position, [], _spawnRadius, "NONE"];

// Handle creating explosion and cleaning up on object being destroyed
_ied addEventHandler ["Killed", {
    params ["_unit", "_killer"];
    _iedExplosive = createMine [typeOf _unit, getPos _unit, [], 0];
    _iedExplosive setDamage 1;
    [QGVAR(exploded), [typeOf _unit, getPos _unit]] call ACE_common_fnc_globalEvent;
    deleteVehicle (_unit getVariable [QGVAR(trigger), objNull]);
    deleteVehicle _unit;
}];

// Create trigger for setting off the explosive
local _trigger = createTrigger ["EmptyDetector", _position, true];
_trigger setTriggerArea [_triggerRadius, _triggerRadius, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [
    "{
        if (abs (speed _x) >= 2.76 && (getPosATL _x select 2) < 4) exitWith {true};
        false
    } forEach thisList;",
    '(thisTrigger getVariable [QGVAR(ied), objNull]) setDamage 1;',
    ""
];

// Make trigger and object known to each other
_trigger setVariable [QGVAR(ied), _ied, true];
_ied setVariable [QGVAR(trigger), _trigger, true];

_ied
