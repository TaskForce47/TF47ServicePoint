/**
 *  @author Willard
 *  @description
 *  Inits the tank ammo dialog
 *  @params none
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];
if(_vehicle == player || isNull _vehicle) exitWith {
    ["You are not in a valid vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};


// Clear the listboxes
lbClear 2100;
lbClear 2101;
lbClear 2102;

// reset the current selection index
lbSetCurSel [2100, -1];
lbSetCurSel [2101, -1];
lbSetCurSel [2102, -1];

_ammo = [];
if(_vehicle isKindOf "rhsusf_m1a1tank_base") then {
	_ammo = ["rhs_mag_M1069", "rhs_mag_M829A3", "rhs_mag_M829A2", 
		"rhs_mag_M829A1", "rhs_mag_M829", "rhs_mag_M830", "rhs_mag_M830A1",
		"rhs_mag_M1028"];
} else {
	if(_vehicle isKindOf "BWA3_Leopard_base") then {
		_ammo = ["BWA3_1Rnd_KE_shells", "BWA3_1Rnd_HE_shells", 
			"BWA3_1Rnd_MZ_shells", "BWA3_1Rnd_Canister_shells",
			"BWA3_1Rnd_LAHAT"];
	};
};

for "_i" from 0 to 2 do 
{
	_id = 2100 + _i;	
	{
		_index = lbAdd [_id, 
			getText(configfile >> "CfgMagazines" >> _x >> "displayName")];
		lbSetData [_id, _index, _x];
	} forEach _ammo;
};