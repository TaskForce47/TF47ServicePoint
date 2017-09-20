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


_maxAmmo = 0;
if(_vehicle isKindOf "rhsusf_m1a1tank_base") then {
	_maxAmmo = 32;
} else {
	if(_vehicle isKindOf "BWA3_Leopard_base") then {
		_maxAmmo = 37;
	};
};


if(_sum > _maxAmmo) exitWith {
	hint format["Es können nur maximal %1 Schuss mitgeführt werden", _maxAmmo];
};

_tickTime = 0.01;
_time = _tickTime * _maxAmmo;
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
	if(_x iskindof ["rhs_mag_M1069", configFile >> "CfgMagazines"] || 
		_x isKindOf ["30Rnd_120mm_HE_shells", configFile >> "CfgMagazines"]) 
		then {
		_vehicle removeMagazineTurret [_x, [0]];
	};
} foreach (_vehicle magazinesTurret [0]);

if(_vehicle isKindOf "BWA3_Leopard_base") then {
	{
		if(_x != "" && ((_count select _forEachIndex) >= 0)) then {
			for "_i" from 1 to (_count select _forEachIndex) do {
				_vehicle addMagazineTurret [_x, [0], 1];
			};
			
			//_vehicle setMagazineTurretAmmo [_x , (_count select _forEachIndex), [0]];
		};
	} forEach _ammo;
} else {
	{
		if(_x != "" && ((_count select _forEachIndex) >= 0)) then {
			_vehicle addMagazineTurret [_x, [0]];
			_vehicle setMagazineTurretAmmo [_x , (_count select _forEachIndex), [0]];
		};
	} forEach _ammo;
};