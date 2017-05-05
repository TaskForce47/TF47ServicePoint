_result = _this params [
    ["_vehicle", objNull, [objNull]]
];


if(isNull _vehicle) exitWith {
    // TODO
    hint "no vehicle";
};

_allHitpoints = "true" configClasses
    (configfile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints");

_hitPointCount = 0;
_hitPointDamage = 0;

_wheelCount = 0;
_wheelDamage = 0;

{
    _hitPointName = configName _x;
    if(["wheel", _hitPointName] call BIS_fnc_inString) then {
        _wheelCount = _wheelCount + 1;
        _wheelDamage = _wheelDamage +
            (_vehicle getHitPointDamage _hitPointName);
    } else {
        _hitPointCount = _hitPointCount + 1;
        _hitPointDamage = _hitPointDamage +
            (_vehicle getHitPointDamage _hitPointName);
    };
} forEach _allHitpoints;



if(_wheelCount > 0) then {
    _hitPointDamage = _hitPointDamage + (_wheelDamage / _wheelCount);
    _hitPointCount = _hitPointCount + 1;
};
hint str _hitPointDamage;
_hitPointDamage = _hitPointDamage  / _hitPointCount;

hint str _hitPointDamage;
_hitPointDamage
