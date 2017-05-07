_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
    ["applyService called without a valid vehicle", "Error", true] spawn
        BIS_fnc_guiMessage;
};
