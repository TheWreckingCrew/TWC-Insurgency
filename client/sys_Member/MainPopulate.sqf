TWC_fnc_timePlayed = {
    _array = profileNamespace getVariable ["TWCPub_timePlayed", [0, 0]];
    _timePlayed = _array select 0;
    _message = "";
    if (_timePlayed <= 30) then {_message = "You've only just started playing!"};
    if (_timePlayed > 30) then {_message = "30 minutes"};
    if (_timePlayed > 60) then {_message = "1 hour"};
    if (_timePlayed > 90) then {_message = "1.5 hours"};
    if (_timePlayed > 120) then {_message = "2 hours"};
    if (_timePlayed > 150) then {_message = "2.5 hours"};
    if (_timePlayed > 180) then {_message = "3 hours"};
    if (_timePlayed > 210) then {_message = "3.5 hours"};
    if (_timePlayed > 240) then {_message = "4 hours"};
    if (_timePlayed > 270) then {_message = "4.5 hours"};
    if (_timePlayed > 300) then {_message = "5 hours"};
    if (_timePlayed > 330) then {_message = "5.5 hours"};
    if (_timePlayed > 360) then {_message = "A long, long time. You sir, are a true hero of the TWC server."};
    if (_message != "") then {hint _message};
};

