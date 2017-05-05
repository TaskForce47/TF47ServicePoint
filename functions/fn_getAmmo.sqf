_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
    // TODO
    hint "no vehicle";
};


_allMagazines = magazinesAmmoFull _vehicle;

_magazineCount = count magazinesAllTurrets _vehicle;

_ammoPercentSum = 0;

{
    _ammoPercentSum = _ammoPercentSum + ((_x select 1) / getNumber
        (configFile >> "CfgMagazines" >> (_x select 0) >> "count"));
} forEach _allMagazines;

if(_magazineCount == 0) exitWith {
    _ammoPercentSum = -1;
    _ammoPercentSum
};
_ammoPercentSum = _ammoPercentSum / _magazineCount;

_ammoPercentSum
