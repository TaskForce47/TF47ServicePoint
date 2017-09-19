/**
 *  @author Willard
 *  @description
 *  Adds tank ammo to the tank
 *  @params 
 *      param 0: The vehicle <object> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["applyAceLoadout called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(_vehicle == player) exitWith {
    ["You are not in a valid vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_count = [parseNumber ctrlText 1400];
_count pushBack (parseNumber ctrlText 1401);
_count pushBack (parseNumber ctrlText 1402);

_sum = 0;
{
	_sum = _sum + _x; 
} forEach _count;

if(_sum > 32) exitWith {
	hint "Es können nur maximal 32 Schuss mitgeführt werden";
};

_tickTime = 0.1;
_time = _tickTime * (lbSize 1500);
for "_i" from 0 to 100 do {
	if((_i mod 25) == 0) then {
		systemChat format["TF47 Service Point | Bewaffnung: %1%2 fertig", _i, "%"];
	};
	sleep _time;
};

_ammo = [lbData [2100, lbCurSel 2100]];
_ammo pushBack (lbData [2101, lbCurSel 2101]);
_ammo pushBack (lbData [2102, lbCurSel 2102]);

{
	if(_x iskindof ["rhs_mag_M1069", configFile >> "CfgMagazines"]) then {
		_vehicle removeMagazineTurret [_x, [0]];
	};
} foreach (_vehicle magazinesTurret [0]);

{
	if(_x != "" && ((_count select _forEachIndex) >= 0)) then {
		_vehicle addMagazineTurret [_x, [0]];
		_vehicle setMagazineTurretAmmo [_x , (_count select _forEachIndex), [0]];
	};
} forEach _ammo;