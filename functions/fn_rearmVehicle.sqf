/**
 *  @author Willard
 *  @description
 *  Rearms a vehicle
 *  @params 
 *      param 0: The vehicle <OBJECT> (required)
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

// check for null vehicle
if(isNull _vehicle) exitWith {
    ["rearmVehicle called with empty string", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// needs to be executed where the vehicle is local
[_vehicle, {
    _veh = _this;
    _allMagazines = magazinesAllTurrets _veh;
    hint str _allMagazines;
    // remove every magazine, then add every magazine again
    {
        _veh removeMagazinesTurret [_x select 0, _x select 1];
    } forEach _allMagazines;
    {
        _veh addMagazineTurret [_x select 0, _x select 1];
    } forEach _allMagazines;
}] remoteExecCall ["bis_fnc_call", owner _vehicle]; 