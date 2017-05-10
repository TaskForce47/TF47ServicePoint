_result = _this params [
    ["_item", "", [""]]
];

if(_item == "") exitWith {
    ["getDisplayName called with empty string", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_displayName = "";

switch (true) do {
    case (isClass (configFile >> "CfgMagazines" >> _item)) : {
        _displayName = getText (configFile >> "CfgMagazines" >> _item >>
            "displayName");
    };
    case (isClass (configFile >> "CfgWeapons" >> _item)): {
        _displayName = getText (configFile >> "CfgWeapons" >> _item >>
            "displayName");
    };
    case (isClass (configFile >> "CfgVehicles" >> _item)): {
        _displayName = getText (configFile >> "CfgVehicles" >> _item >>
            "displayName");
    };
    case (isClass (configFile >> "CfgGlasses" >> _item)): {
        _displayName = getText (configFile >> "CfgGlasses" >> _item >>
            "displayName");
    };
};

_displayName
