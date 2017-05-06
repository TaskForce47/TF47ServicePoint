_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
    // TODO
    hint "no vehicle";
};


_allMagazines = magazinesAllTurrets _vehicle;

_magazineCount = count _allMagazines;

_ammoPercentSum = 0;

{
    _vehicle removeMagazinesTurret [_x select 0, _x select 1];
} forEach _allMagazines;

{
    _vehicle addMagazineTurret [_x select 0, _x select 1];
} forEach _allMagazines;
