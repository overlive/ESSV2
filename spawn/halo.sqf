_haloDrop = {
	#include "spawnConfig.sqf"
	private ["_dir","_id","_plane","_pos","_unit"];
	DZE_HaloJump = false;
	_pos = [(_this select 0)+1000,(_this select 1)+1000,_haloHeight];
	_id = str(ceil(random 999999));
	_plane = _haloType createVehicleLocal _pos;
	_plane setPosATL _pos;
	_plane setVariable ["ObjectID",_id,true];
	_plane setVariable ["ObjectUID",_id,true];
	_plane setVehicleLock "UNLOCKED";
	_plane engineOn true;
	_plane flyInHeight _haloHeight;
	_dir = [_pos,_this] call BIS_fnc_dirTo;
    _plane setDir (90 -_dir); 
    _plane setVelocity [50 * (sin _dir), 50 * (cos _dir), -10];
	_unit = createAgent ["Survivor2_DZ",_this,[],0,"CAN_COLLIDE"];
	_unit assignAsDriver _plane;
	_unit moveInDriver _plane;
	player reveal _plane;
	player moveInCargo [_plane,2];
	player action ["getInCargo",_plane,2];
	_plane setVehicleLock "LOCKED";
	_pos = (group player) addWaypoint [_this,0];
	[_this,_plane,_unit,_pos,_haloType,_haloHeight] spawn {
		private "_plane";
		_plane = _this select 1;
		_plane setDamage .8;
		waitUntil {uiSleep .2;(_plane distance (_this select 0) < ((_this select 5)+100))};
		if ((vehicle player) isKindOf (_this select 4)) then {player spawn BIS_fnc_halo;};
		player action ["eject",_plane];
		uiSleep 30;
		deleteVehicle _plane;
		deleteVehicle (_this select 2);
		deleteWayPoint (_this select 3);
	};
};

if !(_isPZombie) then {
	while {uiNamespace getVariable "haloChoice" == -1} do {
		_nearNow = call _inDebug;
		_nearFinal = _nearFinal + _nearNow;
		if (!dialog) then {cutText ["","BLACK OUT",0];_i="createDialog";createDialog "HaloDialog";};
		uiSleep 1;
	};
	closeDialog 0;
};