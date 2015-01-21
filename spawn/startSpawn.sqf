_halo = uiNamespace getVariable "haloChoice";
deleteVehicle _holder;
_finalSpawnPos = _debug;
if (!isNil "_grid") then {_finalSpawnPos = _grid;};

if (_halo > 0) then {
	if (isNil "_haloType") then {	
		player setPosATL [(_finalSpawnPos select 0),(_finalSpawnPos select 1),_haloHeight];
		[player,_haloHeight] spawn BIS_fnc_halo;
	} else {
		_finalSpawnPos call _haloDrop;
	};
} else {
	player setPosATL _finalSpawnPos;
};

player hideObject false;
enableEnvironment true;
cutText ["","BLACK IN"];

if (!isNil "_haloDrop") then {
	_myalt = (getPos player) select 2;
	while {_myalt > 400} do {
		player allowDamage false;
		if !((vehicle player) isKindOf _haloType) then {
			_myalt = (getPos player) select 2;
			_myalt = round(_myalt);
			titleText [("                                      ALTITUDE: " + str _myalt + "\n\n                                      Scroll 'mouse' select Open Chute"),"PLAIN DOWN",.1];
		};
		uiSleep .2;
	};
	player allowDamage true;
	DZE_HaloJump = _haloJump;
};