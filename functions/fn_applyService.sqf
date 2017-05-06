_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
    // TODO
    hint "no vehicle";
};

disableSerialization;

_dialog = uiNamespace getVariable ["tf47_modules_sp_main_dialog_var", objNull];

if(isNull _dialog) exitWith {
    hint "no dialog";
    ["Dialog not found in applyService.sqf", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_respawn = cbChecked (_dialog displayCtrl 2805);
_repair = cbChecked (_dialog displayCtrl 2800);
_refuel = cbChecked (_dialog displayCtrl 2801);
_rearm = cbChecked (_dialog displayCtrl 2802);
_clearInv = cbChecked (_dialog displayCtrl 2803);
_clearAceInv = cbChecked (_dialog displayCtrl 2804);

_anyService = _respawn || _repair || _refuel || _rearm || _clearInv ||
    _clearAceInv;

if(!_anyService || (_vehicle getVariable ["tf47_modules_sp_inService", false]))
    exitWith {};

_vehicle setVariable ["tf47_modules_sp_inService", true, true];
ctrlSetText [1024, "In Service"];

if(_respawn) exitWith {
    closeDialog 0;
    ["tf47_modules_sp_respawn",
        ["Dieses Fahrzeug wird in 10 Sekunden respawnen"]] call
        BIS_fnc_showNotification;
    _vehicle setFuel 0;
    {
        _x action ["GetOut", _vehicle];
    } forEach crew _vehicle;

    waitUntil {count (crew _vehicle) == 0};
    _vehicle lock true;

    sleep 10;

    //ToDO Custom Code

    _vehicle setPos [0,0,0];
    _vehicle setDamage 1;

};

_damage = 0;
_fuel = 0;

_tickTime = 1;

_time = 0;

if(_repair) then {
    _damage = (damage _vehicle);
    _time = _tickTime * _damage;
    for "_i" from 0 to 100 do {
        if((_i mod 25) == 0) then {
            systemChat format["TF47 Service Point | Schaden: %1%2 fertig", _i,
                "%"];
        };
        sleep _time;
    };
    _vehicle setDamage 0;
    ctrlSetText [1007, format["%1%2", floor (([_vehicle] call
        tf47_modules_servicepoint_fnc_getDamage) * 100), "%"]];
};

if(_refuel) then {
    _fuel = ((fuel _vehicle) - 1)* -1;
    _time =  _tickTime * _fuel;
    for "_i" from 0 to 100 do {
        if((_i mod 25) == 0) then {
            systemChat format["TF47 Service Point | Treibstoff: %1%2 fertig",
                _i, "%"];
        };
        sleep _time;
    };
    _vehicle setFuel 1;
    ctrlSetText [1008, format["%1%2", floor ((fuel _vehicle) * 100), "%"]];
};

if(_rearm) then {
    _ammo = [_vehicle] call tf47_modules_servicepoint_fnc_getAmmo;
    _time = _tickTime * _ammo;
    for "_i" from 0 to 100 do {
        if((_i mod 25) == 0) then {
            systemChat format["TF47 Service Point | Munition: %1%2 fertig",
                _i, "%"];
        };
        sleep _time;
    };
    [_vehicle] call tf47_modules_servicepoint_fnc_rearmVehicle;

    _ammo = [_vehicle] call tf47_modules_servicepoint_fnc_getAmmo;
    _ammo = format["%1%2", floor (_ammo * 100), "%"];
    ctrlSetText [1010, _ammo];
};

if(_clearInv) then {
    clearBackpackCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    systemChat format["TF47 Service Point | Inventar geleert"];
};

if(_clearAceInv) then {
    _vehicle setVariable ["ace_cargo_loaded", [], true];
    _vehicle setVariable ["ace_cargo_space", getNumber (configFile >>
        "CfgVehicles" >> typeOf _vehicle >> "ace_cargo_space"), true];
    systemChat format["TF47 Service Point | ACE Inventar geleert"];
};

_vehicle setVariable ["tf47_modules_sp_inService", false, true];
ctrlSetText [1024, "       Bereit"];
