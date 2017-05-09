_result = _this params [
    ["_item", "", [""]]
];

if(_item == "") exitWith {
    ["getMass called with empty string", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_mass = -1;

switch (true) do {
    case (isClass (configFile >> "CfgMagazines" >> _item)) : {
        _mass = getNumber (configFile >> "CfgMagazines" >> _item >> "mass");
    };
    case (isClass (configFile >> "CfgWeapons" >> _item)): {
        if(isClass (configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo"))
            then {
            _mass = getNumber (configFile >> "CfgWeapons" >> _item >>
                "WeaponSlotsInfo" >> "mass");
        } else {
            _mass = getNumber (configFile >> "CfgWeapons" >> _item >> "ItemInfo"
                >> "mass");
        };
    };
    case (isClass (configFile >> "CfgVehicles" >> _item)): {
        _mass = getNumber (configFile >> "CfgVehicles" >> _item >> "mass");
    };
    case (isClass (configFile >> "CfgGlasses" >> _item)): {
        _mass = getNumber (configFile >> "CfgGlasses" >> _item >> "mass");
    };
};


_mass
