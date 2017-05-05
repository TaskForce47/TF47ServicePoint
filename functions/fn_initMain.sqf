_vehicle = vehicle player;

if(_vehicle == player) exitWith {
    hint "not in a veh";
};

waitUntil {(ctrlText 1001) != ""},

hint str _vehicle;

ctrlSetText [1200, getText(configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "picture")];

ctrlSetText [1002, getText(configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "displayName")];

_ammo = [_vehicle] call
    tf47_modules_servicepoint_fnc_getAmmo;
if(_ammo == -1) then {
    _ammo = "n/a";
} else {
    _ammo = format["%1%2", floor (_ammo * 100), "%"];
};

_usedLoad = [_vehicle] call
    tf47_modules_servicepoint_fnc_getFreeVanillaInventory;

_maxLoad = getNumber (configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "maximumLoad");



ctrlSetText [1007, format["%1%2", floor (([_vehicle] call
    tf47_modules_servicepoint_fnc_getDamage) * 100), "%"]];
ctrlSetText [1008, format["%1%2", floor ((fuel _vehicle) * 100), "%"]];
ctrlSetText [1010, _ammo];
ctrlSetText [1011, format["%1%2", floor ((_usedLoad / _maxLoad) * -100 + 100),
    "%"]];
