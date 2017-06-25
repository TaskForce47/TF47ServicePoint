/**
 *  @author Willard
 *  @description
 *  Inits the loadout dialog
 *  @params none
 *  @return nothing
 */
ctrlEnable [1604, false];
[] call tf47_modules_servicepoint_fnc_initVanillaLoadouts;

_aceCargo = [vehicle player] call tf47_modules_servicepoint_fnc_getAceCargo;

if(_aceCargo == -1) then {
	ctrlShow [1604, false];
	ctrlShow [1605, false];
};