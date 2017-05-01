_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
    // TODO
    hint "no vehicle";
};

_weaponCargo = weaponCargo _vehicle;
_magazineCargo = magazineCargo _vehicle;
_itemCargo = itemCargo _vehicle;
_backpackCargo = backpackCargo _vehicle;


_weaponMass = 0;
{
    _weaponMass = _weaponMass +
        getNumber (configFile >>
            "CfgWeapons" >> _x >> "WeaponSlotsInfo" >> "mass");
} forEach _weaponCargo;

_magazineMass = 0;
{
    _magazineMass = _magazineMass +
        getNumber (configFile >> "CfgMagazines" >> _x >> "mass");
} forEach _magazineCargo;

_itemMass = 0;
{
    _itemMass = _itemMass +
        getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
} forEach _itemCargo;

_backpackMass = 0;
{
    _backpackMass = _backpackMass +
        getNumber (configFile >> "CfgVehicles" >> _x >> "mass");
} forEach _backpackCargo;
