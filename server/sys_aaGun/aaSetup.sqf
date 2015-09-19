#define AA_POSITION_LIST_A ["AAGUNA1", "AAGUNA2", "AAGUNA3", "AAGUNA4", "AAGUNA5", "AAGUNA6", "AAGUNA7", "AAGUNA8"]
#define AA_POSITION_LIST_B ["AAGUNB1", "AAGUNB2", "AAGUNB3", "AAGUNB4", "AAGUNB5", "AAGUNB6", "AAGUNB7", "AAGUNB8"]
#define AA_VEHICLE_TYPE "RDS_ZU23_AAF"

private ["_aaGunAPosition", "_aaGunBPosition", "_aaGunA", "_aaGunB"];

if (isNil "InsP_aaGroup") then {
    _aaGunAPosition = AA_POSITION_LIST_A call BIS_fnc_selectRandom;
    _aaGunBPosition = AA_POSITION_LIST_B call BIS_fnc_selectRandom;

    _aaGunA = AA_VEHICLE_TYPE createVehicle getMarkerPos _aaGunAPosition;
    _aaGunA setDir (random 360);
    _aaGunA addMPEventHandler ["MPKilled", {[_this select 0] call InsP_fnc_deadAAGun}];
    createVehicleCrew _aaGunA;

    _aaGunB = AA_VEHICLE_TYPE createVehicle getMarkerPos _aaGunBPosition;
    _aaGunB setDir (random 360);
    _aaGunB addMPEventHandler ["MPKilled", {[_this select 0] call InsP_fnc_deadAAGun}];
    createVehicleCrew _aaGunB;

    InsP_aaGroup = [_aaGunA, _aaGunB];
    publicVariable "InsP_aaGroup";
};
