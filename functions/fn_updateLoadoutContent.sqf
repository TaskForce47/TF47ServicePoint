_result = _this params [
    ["_index", -1, [-1]]
];

if(_index == -1) exitWith {
    ["updateLoadoutContent callled with invalid number", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_data = lbData [1500, _index];
_data = call compile _data;

lbClear 1501;

if(_data select 1) then {
    ctrlSetText [1003, "Ja"];
} else {
    ctrlSetText [1003, "Nein"];
};

for "_i" from 2 to ((count _data) - 1) do {
    lbAdd [1501, format["%1 x %2", (_data select _i) select 1,
        (_data select _i) select 3]];
};
