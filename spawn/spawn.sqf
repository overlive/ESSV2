#define EXIT1 ,"PLAIN DOWN"];titleFadeOut 4;_go=0;};

moveMap = {
	#include "spawnConfig.sqf"
	private ["_ctrl","_pos","_spawn","_text"];
	disableSerialization;
	_ctrl = (findDisplay 88890) displayCtrl 8890;
	_text = lbText [8888,(lbCurSel 8888)];
	{if (_text == (_x select 0)) then {_spawn = _x;};} forEach _spawnPoints+_vipBases;
	if (isNil "_spawn") then {_spawn = _spawnPoints select 0;};
	_pos = _spawn select 1;
	if (count _spawn > 4) then {_pos = _pos select 0;};
	_ctrl ctrlMapAnimAdd [1,.35,_pos]; //1,.1 (org) //2,.35 ok
	ctrlMapAnimCommit _ctrl;
};

spawnFill = {
	#include "spawnConfig.sqf"
	private ["_block","_bodies","_body","_index","_lb","_pos","_uid"];
	disableSerialization;
	_uid = getPlayerUID player;
	lbClear 8888;
	{
		_index = lbAdd [8888,_x select 0];
		_level = _x select 2;
		_hlevel = _x select 3;
		if (count _x > 4) then {lbSetColor [8888,_index,[.97,.87,.35,1]];};
		if (_hlevel > 0) then {lbSetColor [8888,_index,[.38,.7,.9,1]];};
		if (_hlevel < 0) then {lbSetColor [8888,_index,[1,0,0,.8]];};
		if (_level > 0) then {lbSetColor [8888,_index,[0,1,0,.8]];};
	} forEach _spawnPoints;
	if (_uid in _vipBase) then {
		{if (_uid == _x) then {_index = _forEachIndex;};} forEach _vipBase;
		_base = _vipBases select _index;
		_index = lbAdd [8888,_base select 0];
		lbSetColor [8888,_index,[0,1,0,.8]];
	};
	_bodies = [];
	{if (!isNull _x) then {if (getPlayerUID _x == _uid) then {_body = getPosATL _x;_bodies set [count _bodies,_body];};};} count allDead;
	if (count _bodies > 0) then {
		_block = 0;
		{
			_body = _x;
			{
				if (count _x < 5) then {
					_pos = (_spawnPoints select _forEachIndex) select 1;
					if ((_body distance _pos) < _bodyCheck) then {lbDelete [8888,_forEachIndex];_block = 1;};
				};
			} forEach _spawnPoints;
		} count _bodies;
		if (_block == 1) then {systemChat format ["Note: some spawns are blocked due to a body of yours within %1m",_bodyCheck];};
	};
	_lb = (findDisplay 88890) displayCtrl 8888;lbSort _lb;
};

spawnPick = {
	private ["_go","_humanity","_level","_spawn","_text","_uid"];
	#include "spawnConfig.sqf"
	disableSerialization;
	_go = 1;
	_text = lbText [8888,(lbCurSel 8888)];
	{if (_text == (_x select 0)) then {_spawn = _x;};} forEach _spawnPoints+_vipBases;
	if (isNil "_spawn") exitWith {titleText ["\n\nSelect a spawn!" EXIT1
	if (count _spawn > 2) then {
		_level = _spawn select 2;
		_hlevel = _spawn select 3;
		_humanity = player getVariable ["humanity",0];
		_uid = getPlayerUID player;
		if ((_hlevel < 0) && {_humanity >= _hlevel}) exitWith {titleText [format["\n\nYour humanity must be less than %1 for this spawn.",_hlevel] EXIT1
		if ((_hlevel > 0) && {_humanity <= _hlevel}) exitWith {titleText [format["\n\nYour humanity must be greater than %1 for this spawn.",_hlevel] EXIT1
		if (_level == 1) then {if !(_uid in _spawnLevel1) exitWith {titleText ["\n\nThis spawn is level 1 VIP only." EXIT1};
		if (_level == 2) then {if !(_uid in _spawnLevel2) exitWith {titleText ["\n\nThis spawn is level 2 VIP only." EXIT1};
		if (_level == 3) then {if !(_uid in _spawnLevel3) exitWith {titleText ["\n\nThis spawn is level 3 VIP only." EXIT1};
	};
	if (_go == 1) then {uiNamespace setVariable ["spawnChoice",_spawn];};
};

private ["_count","_find","_good","_pos","_spawn","_spot","_uid"];
#include "spawnConfig.sqf"
uiNamespace setVariable ["haloChoice",-1];
uiNamespace setVariable ["spawnChoice",[]];
while {count (uiNamespace getVariable "spawnChoice") == 0} do {
	_nearNow = call _inDebug;
	_nearFinal = _nearFinal + _nearNow;
	if (!dialog) then {cutText ["","BLACK OUT",0];_i="createDialog";createDialog "SpawnDialog";call spawnFill;call moveMap;};
	uiSleep 1;
};
closeDialog 0;
moveMap=nil;spawnFill=nil;spawnPick=nil;

#include "halo.sqf"

_halo = uiNamespace getVariable "haloChoice";
_spawn = uiNamespace getVariable "spawnChoice";
_pos = _spawn select 1;
if (count _spawn > 4) then {_pos = _pos call BIS_fnc_selectRandom;};
deleteVehicle _holder;
if (count _spawn > 3) then {
	_count = 0;
	_find = true;
	while {_find && {_count < 99}} do {
		_spot = [_pos,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
		_good = (_spot distance _pos) < _spawnRadius;
		_spot set [2,0];
		if ((((ATLtoASL _spot) select 2) > 2.5) &&
			{({isPlayer _x} count (_spot nearEntities ["Man",100])) < 1} && 
			{count (nearestObjects [_spot,["Plastic_Pole_EP1_DZ"],45]) < 1} && {_good}) then {_find = false;};
		_count = _count + 1;
	};
	_pos = _spot;
};

if (_halo == 1) then {
	if (isNil "_haloType") then {
		player setPosATL [(_pos select 0),(_pos select 1),_haloHeight];
		[player,_haloHeight] spawn BIS_fnc_halo;
	} else {
		_pos call _haloDrop;
	};
} else {
	player setPosATL _pos;
};