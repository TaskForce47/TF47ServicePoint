_result = _this params [
    ["_index", -1, [-1]]
];

if(_index == -1) exitWith {
    ["updateLoadoutContent callled with invalid number", "Error", true] spawn
        BIS_fnc_guiMessage;
};

_data = lbData [1500, _index];
_data = compile _data;

for "_i" from 2 to (count _data - 1) do {
    lbAdd [1501, format["%1 x %2", (_data select _i) select 1,
        (_data select _i) select 4]];
};
