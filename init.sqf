if(!hasInterface && !isDedicated) then {
   execVM "hc\init.sqf";
};

if(isDedicated || isServer) then{
   execVM "hc\init.sqf";
};

waitUntil {!isNull player};
waitUntil {player == player};

// TFAR Radio settings
tf_no_auto_long_range_radio = true;
tf_same_sw_frequencies_for_side = true;
tf_same_lr_frequencies_for_side = true;
TF_give_microdagr_to_soldier = false;

_settingsSwWest = false call TFAR_fnc_generateSwSettings;
_settingsSwWest set [2, ["200","120","130","140","150"]];
tf_freq_west = _settingsSwWest;

_settingsLrWest = false call TFAR_fnc_generateLrSettings;
_settingsLrWest set [2, ["50"]];
tf_freq_west_lr = _settingsLrWest;

memberIDArray = ["_SP_PLAYER_","76561198078628958", "76561198010598279", "76561198061214513", "76561198051847668","76561198050512686", "76561198050180681", "76561198039562456", "76561198018609662","76561198013509033", "76561198010876571", "76561198007975082", "76561198001649761", "76561197985821395", "76561197981096983", "76561197970591603", "76561198100339755", "76561198084557194","76561198077371253", "76561198076461963", "76561198072105856", "76561198067385164", "76561198062338085", "76561198061797079","76561198054727971","76561198070630639","76561198018806047","76561197981208292", "76561197996044352"];

execVM "tao\restrict\RadioChannels.sqf";
execVM "lib\cleanup.sqf";
execVM "lib\bodyremove.sqf";
execVM "tao\restrict\base.sqf";
execVM "tao\restrict\pilot.sqf";
execVM "tao\restrict\Radio.sqf";

russiancheck = 0;

if(isServer) then
{
	_serverID = str(round((random(100000)) + random 10000));
	profileNameSpace setVariable ["TWC_ServerID",_serverID];
	TWCserverID = profileNameSpace getVariable "TWC_ServerID";
	publicVariable "TWCserverID";
};

waitUntil {!isNull player};
waitUntil {player == player};

null = execVM "client\sys_Member\Timeplayed.sqf";

if ((getplayerUID player) in memberIDArray) then {

_Time = ['TWC_Timeplayed','Time Played','', {[] call TWC_fnc_timePlayed},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _Time] call ace_interact_menu_fnc_addActionToObject;

};

if (InsP_playerCiv) then {
	execVM "client\sys_humanCiv\Markers.sqf";
	call InsP_fnc_spawnSelect;
};

if (isNil "nonQuestionableList") then {
	nonQuestionableList = [];
	publicVariable "nonQuestionableList";
};

QuestionPersonAction = ["QuestionPerson","Question Person","",{call InsP_fnc_questionDisplay},{alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
["C_man_1", 0, ["ACE_MainActions"], QuestionPersonAction] call ace_interact_menu_fnc_addActionToClass;

_pilots = ["p21", "p22"];
_apachepilots = ["p23", "p24"];
_humanCivs = ["humanCiv1", "humanCiv2", "humanCiv3"];
_specialUnits = _pilots + _humanCivs + _apachepilots;
_playerString = str player;
_playerID = getPlayerUID player;
_totalPlayers = count playableUnits;

cutText ["Receiving...", "BLACK", .001];

titleText ["The Wrecking Crew","PLAIN DOWN"];
titleFadeOut 7;
sleep 5;

titleText ["Insurgency Plus","PLAIN DOWN"];
titleFadeOut 7;
sleep 5;

if (_playerString in _specialUnits) then {

	if (_playerString in _pilots) then {
		if (_totalPlayers < 5) then {
			["end4", false, 0] call BIS_fnc_endMission;
		};
	};

	if (_playerString in _apachepilots) then {
	    if (_playerID in memberIDArray) then {
		     if (_totalPlayers < 14) then {
			 ["end7", false, 0] call BIS_fnc_endMission;
		     };
	     }else{
		     ["end7", false, 0] call BIS_fnc_endMission;
	     };
	};

	if (_playerString in _humanCivs) then {
		if (_playerID in memberIDArray) then {
			if (_totalPlayers >= 0) then {
				if (_playerID in DeadInsurgents) then {
                    diag_log "Dead";
					["end6", false, 0] call BIS_fnc_endMission;
				};
			}else{
                diag_log "too little players";
				["end6", false, 0] call BIS_fnc_endMission;
			};
		}else{
            diag_log "not a human civ";
			["end6", false, 0] call BIS_fnc_endMission;
		};
	};

};

cutText ["", "BLACK IN", 2];

titleText ["Enjoy your stay", "PLAIN"];
titleFadeOut 4;

if (isDedicated) then {
	[["patrol1", "patrol2", "patrol3", "patrol4", "patrol5", "patrol6"]] call InsP_fnc_patrolGroup;
};

execVM "client\sys_ambient\ambientCiv.sqf";
