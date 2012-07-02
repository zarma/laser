while {true} do {
	_playerHeading = vectorDir player;	
	_playerHeading	= floor (_playerHeading call CBA_fnc_vectDir);
	_playerpos = player  call ace_fnc_mapCoord;
	_values = format["'%1;%2'",_playerpos,_playerHeading];
	_table = "message";
	_where = "'posplayer'";
	[_table,_values,_where] call z_fnc_sql_upd;
	sleep 3;
};