private ["_debug","_go","_holder","_isPZombie","_mod","_platform"];

_debug = getMarkerPos "respawn_west";
_mod = toLower(getText (configFile >> "CfgMods" >> "DayZ" >> "dir"));
if (_mod == "@DayZ_Epoch") then {
	if (surfaceIsWater _debug) then {
		_debug = [_debug select 0,_debug select 1,2];
		_platform = "MetalFloor_DZ" createVehicleLocal _debug;
		_platform setPosASL _debug;
		_platform allowDamage false;
		_platform hideObject true;
		_platform enableSimulation false;
	};
	waitUntil {!isNil "PVDZE_plr_LoginRecord"};
	_isPZombie = player isKindOf "PZombie_VB";
	_go = dayzPlayerLogin2 select 2;
} else {
	waitUntil {!isNil "PVDZ_plr_LoginRecord"};
	_isPZombie = false;
	_go = if (count PVCDZ_plr_Login2 > 3) then {PVCDZ_plr_Login2 select 3} else {PVCDZ_plr_Login2 select 2};
};

if (_go) then {
	enableEnvironment false;
	_holder = "Survivor1_DZ" createVehicleLocal _debug;
	if (surfaceIsWater _debug) then {_holder setPosASL _debug;};
	player attachTo [_holder,[0,0,0]];
	_nearFinal = [];
	_inDebug = {
		private "_ret";_ret=[];
		dayz_temperatur = 36;
		DZE_InRadiationZone = false;
		fnc_usec_damageHandler = {};
		player hideObject true;
		player switchCamera "INTERNAL";
		{if (!local _x) then {_x hideObject true;};_x allowDamage false;_ret set [count _ret,_x];} count (player nearEntities ["Man",100]);
		_ret
	};

	#include "class.sqf"
	#include "spawn.sqf"

	{_x hideObject false;_x allowDamage true;player reveal _x;} count _nearFinal;
	deleteVehicle _holder;
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	enableEnvironment true;
	cutText ["","BLACK IN"];
	
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