lbClear 1500;
lbClear 1501;
lbSetCurSel [1500, -1];
lbSetCurSel [1501, -1];
{
    _index = lbAdd [1500, _x select 0];
    lbSetData [1500, _index, str _x];
} forEach tf47_modules_sp_loadouts_aceConfig;
