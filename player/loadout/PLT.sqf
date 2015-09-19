comment "Exported from Arsenal by FakeMatty";

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "rhs_uniform_cu_ocp_1stcav";
for "_i" from 1 to 8 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 4 do {player addItemToUniform "ACE_morphine";};
player addItemToUniform "Chemlight_blue";
for "_i" from 1 to 2 do {player addItemToUniform "rhsusf_mag_7x45acp_MHP";};
player addVest "rhsusf_iotv_ocp";
for "_i" from 1 to 2 do {player addItemToVest "ACE_fieldDressing";};
player addItemToVest "ACE_morphine";
player addItemToVest "rhsusf_mag_7x45acp_MHP";
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addBackpack "tf_rt1523g_sage";
player addItemToBackpack "ACE_DAGR";
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "Chemlight_green";};
player addHeadgear "H_PilotHelmetHeli_B";
player addGoggles "rhs_googles_black";

comment "Add weapons";
player addWeapon "rhsusf_weap_m1911a1";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_anprc152";

comment "Set identity";
player setFace "GreekHead_A3_07";
player setSpeaker "Male02GRE";
