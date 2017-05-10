_vehicle = vehicle player;

if(_vehicle == player) exitWith {
    hint "not in a veh";
};

waitUntil {(ctrlText 1001) != ""},

disableSerialization;
_control = uiNamespace getVariable ['tf47_modules_sp_main_dialog_var',nil];

if(_vehicle getVariable ["tf47_modules_sp_inService", false]) then {
    ctrlSetText [1024, "In Service"];
} else {
    ctrlSetText [1024, "       Bereit"];
};

ctrlSetText [1200, getText(configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "picture")];

ctrlSetText [1002, getText(configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "displayName")];

_ammo = [_vehicle] call tf47_modules_servicepoint_fnc_getAmmo;
if(_ammo == -1) then {
    _ammo = "n/a";
} else {
    _ammo = format["%1%2", floor (_ammo * 100), "%"];
};

_usedLoad = [_vehicle] call
    tf47_modules_servicepoint_fnc_getFreeVanillaInventory;
_maxLoad = getNumber (configfile >> "CfgVehicles" >> typeOf _vehicle >>
    "maximumLoad");

_aceCargo = [_vehicle] call tf47_modules_servicepoint_fnc_getAceCargo;

if(_aceCargo == -1) then {
    _aceCargo = "n/a";
    ctrlEnable [2804, false];
    (_control displayCtrl 1021) ctrlSetTextColor [0.3,0.3,0.3,1];
} else {
    _aceCargo = format["%1%2", floor (_aceCargo * 100), "%"];
};

ctrlSetText [1007, format["%1%2", floor (([_vehicle] call
    tf47_modules_servicepoint_fnc_getDamage) * 100), "%"]];
ctrlSetText [1008, format["%1%2", floor ((fuel _vehicle) * 100), "%"]];
ctrlSetText [1010, _ammo];
ctrlSetText [1011, format["%1%2", floor ((_usedLoad / _maxLoad) * -100 + 100),
    "%"]];
ctrlSetText [1016, _aceCargo];
