_vehicle = vehicle player;

if(_vehicle == player) exitWith {
    hint "not in a veh";
};

waitUntil {(ctrlText 1001) != ""},

hint str _vehicle;

ctrlSetText [1007, format[" %1%2", floor ((damage _vehicle) * 100), "%"]];
ctrlSetText [1008, format[" %1%2", floor ((fuel _vehicle) * 100), "%"]];
//ctrlSetText [1010, format[" %1%2", floor ((ammo _vehicle) * 100), "%"]];
