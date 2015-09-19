/*while {true} do {
{ deleteVehicle _x } forEach allDeadMen; 
{ deleteVehicle _x; } forEach nearestObjects [getpos player,["WeaponHolder","GroundWeaponHolder"],14000];
sleep 10;
};5*/


while {true} do {
    // code goes here

     {  

        _x removemagazineglobal "rhs_30Rnd_762x39mm";
        _x removemagazineglobal "rhs_100Rnd_762x54mmR_green";
        _x removemagazineglobal "rhs_100Rnd_762x54mmR";
		_x removemagazineglobal "rhs_VOG25";
		_x removemagazineglobal "rhs_GRD40_White";
		_x removemagazineglobal "rhs_100Rnd_762x54mmR_green";
		_x removemagazineglobal "rhs_30Rnd_545x39_AK";
		_x removemagazineglobal "rhs_30Rnd_545x39_AK_no_tracers";
		_x removemagazineglobal "rhs_30Rnd_545x39_7N10_AK";
		_x removemagazineglobal "rhs_30Rnd_545x39_7N22_AK";
		_x removemagazineglobal "rhs_30Rnd_545x39_AK_green";
		_x removemagazineglobal "rhs_45Rnd_545X39_AK";
		_x removemagazineglobal "rhs_45Rnd_545X39_7N22_AK";
		_x removemagazineglobal "rhs_45Rnd_545X39_AK_Green";
		_x removemagazineglobal "rhs_10Rnd_762x54mmR_7N1";



	 } forEach allDead;
     
      
    
    sleep 1;
};











