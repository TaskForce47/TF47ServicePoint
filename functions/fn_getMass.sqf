_result = _this params [
    ["_item", "", [""]],
    ["_class", "", [""]]
];

if(_item == "" || _class == "") exitWith {
    ["getMass called with empty string", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_mass = -1;

switch (_class) do {
    case ("CfgMagazines") : {
        _mass = getNumber (configFile >> "CfgMagazines" >> _item >> "mass");
    };
    case ("CfgWeapons"): {
        if(isClass (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo"))
            then {
            _mass = getNumber (configFile >> "CfgWeapons" >> _item >>
                "WeaponSlotsInfo" >> "mass");
        } else {
            _mass = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo"
                >> "mass");
        };
    };
    case ("CfgVehicles"): {
        _mass = getNumber (configFile >> "CfgVehicles" >> _item >> "mass");
    };
    case ("CfgGlasses"): {
        _mass = getNumber (configFile >> "CfgGlasses" >> _item >> "mass");
    };
};
_mass
