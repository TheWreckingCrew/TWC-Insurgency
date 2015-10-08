#include "script_component.hpp"

// IED defuse action
local _defuseAction = [
    QGVAR(disarm_action),
    localize "STR_TWC_road_ied_defuse_action_name",
    "",
    {
        params ["_args"];
        _args params ["_ied"];
        [
            5,
            [_ied],
            {
                params ["_args"];
                _args params ["_ied"];
                local _trigger = _ied getVariable [GVAR(trigger), objNull];
                [QGVAR(disarmed), [typeOf _ied, getPos _ied]] call ACE_common_fnc_globalEvent;
                deleteVehicle _trigger;
                deleteVehicle _ied;
            },
            {},
            localize "STR_TWC_road_ied_defuse_in_progress"
        ] call ACE_common_fnc_progressBar;
        [GVAR(beginDisarming), [_ied]] call ACE_common_fnc_globalEvent;
    },
    {true},
    nil,
    [_ied]
] call ACE_interact_menu_fnc_createAction;

["IEDLandBig_F", 0, ["ACE_MainActions"], _defuseAction] call ace_interact_menu_fnc_addActionToClass;
["IEDLandSmall_F", 0, ["ACE_MainActions"], _defuseAction] call ace_interact_menu_fnc_addActionToClass;
