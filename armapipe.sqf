private["_ret","_pipe",,"_data"];
player sidechat "TEST jayarma2lib_fnc_writePipe";
//_armaPipe = ["\\.\pipe\armaPipe"] call jayarma2lib_fnc_openPipe;
//_armaPipe = ["\\.\pipe\testpipe"] call jayarma2lib_fnc_openPipe;
 
player sidechat "Trying to open pipes";

_pipe = "\\.\pipe\testpipe";
_data = "OK";
while {true} do {
	//Wait until not in use
	scopeName "usePipe";
	while {true} do {
		scopeName "pipeWaiting5";
		_pipe = [dayZ_hivePipe1] call jayarma2lib_fnc_openpipe;
		if ((_pipe != "_JERR_PIPE_INVALID")) then {breakOut "pipeWaiting5";};
	};
	//Send data
	_ret = [_pipe, _data] call jayarma2lib_fnc_writepipe;    	
	player sidechat "write armapipe.sqf";
};
sleep 10;
[_pipe] call jayarma2lib_fnc_closepipe;
player sidechat "end armapipe.sqf";