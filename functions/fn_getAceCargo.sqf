_result = _this params [
    ["_vehicle", objNull, [objNull]]
];

if(isNull _vehicle) exitWith {
    // TODO
    hint "no vehicle";
};

_currentCargo = _vehicle getVariable ["ace_cargo_space", -1];

_maxCargo = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >>
    "ace_cargo_space");

_result = 0;

if(_currentCargo == -1 && _maxCargo == 0) then {
    _result = -1;
} else {
    _result = (_currentCargo / _maxCargo);
};

_result
