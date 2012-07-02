#include "script_component.hpp"
private [
	"_handle"
	];
_handle = player execVM "sql\init.sqf"; 
waitUntil {scriptDone _handle}; 
_handle = player execVM "dagr\init.sqf"; 


setViewDistance 6000;
//onMapSingleClick "player setpos _pos";

// ==== intialize actions 
player addAction ["fnc","fnc.sqf"];
//"Arma2Net.Unmanaged" callExtension "Activate";
//player addAction ["MyPlugin","myplugin.sqf"];
player addAction ["sql","sql.sqf"];
player addAction ["sql insert","sql\insert.sqf"];
_param = ['message','"call updt"','"code"'];
player addAction ["sql upd","sql\call.sqf","_param"];
//player addAction ["armapipe","armapipe.sqf"];


// TODO get elevation
_fnc_dagr = {		
	if (! isNull _target) then {
		PARAMS_2(_target,_detected);
		//_pos = getPosASL _target;
		//_mapgridX = _mapgrid select 0;
		//_mapgridY = _mapgrid select 1;
		_pos = getPosASL _target;
		_dist = (getPosASL player) distance _pos;
		_dist = floor (_dist/EMP_RF_ACC)*EMP_RF_ACC;
		_heading = vectorDir _target;	
		_heading	= floor (_heading call CBA_fnc_vectDir);
		_pos = _target  call ace_fnc_mapCoord;
		//hint format["_pos %1 :_dist %2 :_heading %3",_pos,_dist,_heading];	
		_values = format["'%1;%2'",_pos,_heading,_dist];
		_table = "message";
		_where = "'postarget'";
		[_table,_values,_where] call z_fnc_sql_upd;
	};
};

["ace_sys_rangefinder_Lazing", _fnc_dagr] call CBA_fnc_addEventHandler;







