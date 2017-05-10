_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_loadout", [], [[]]]
];

if(isNull _vehicle) exitWith {
    ["applyVanillaLoadout called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if((count _loadout) == 0) exitWith {
    ["applyVanillaLoadout called without a valid loadout", "Error", true] spawn
        BIS_fnc_guiMessage;
};

if(_loadout select 1) then {
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
};

for "_i" from 2 to ((count _data) - 1) do {
    // ToDo:
};
