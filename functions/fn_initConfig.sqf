call compileFinal preprocessFileLineNumbers "TF47ServicePointConfig.sqf";

// forEach loadout

// O(n^2) ist bad but thats why we do it only at the start
{
    // first and second is name and module, last is dummy array
    // (which gets removed)
    for "_i" from 2 to (count _x - 2) do {
        _className = (_x select _i)
            select 0;
        (_x select _i) pushBack ([_className] call
            tf47_modules_servicepoint_fnc_getMass);
    };
    _x deleteAt (count _x - 1);
} forEach tf47_modules_sp_loadouts_config;

tf47_modules_sp_loadouts_config deleteAt (count tf47_modules_sp_loadouts_config
    - 1);

publicVariable "tf47_modules_sp_loadouts_config";
