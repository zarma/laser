/***********************************************************
UPDATE 
- Function
-  [_table,_values,_where] call z_fnc_sql_upd;
************************************************************/
player sidechat "update start";
private [
	"_nbparameters",
	"_parameters",
	"_indexparameters",
	"_table",
	"_values",
	"_where",
	"_SQL",
	"_dbHandle",
	"_ret"
	];
_parameters = [
	"_table",
	"_values",
	"_where"
	];

_indexparameters = 0;
_nbparameters = count _this;
{
	if (_indexparameters <= _nbparameters) then {
	call compile format["%1 = _this select %2;", _x, _indexparameters];
	};
	_indexparameters = _indexparameters + 1;
}foreach _parameters;

_SQL = format[ "UPDATE %1 SET msg = %2  WHERE code = %3;",_table,_values,_where];
//player sidechat _SQL;
_dbHandle = ["message.sqlite"] call jayarma2lib_fnc_openSql;
//player sidechat _dbHandle;
_ret = [_dbHandle, _SQL] call jayarma2lib_fnc_execSql;

//player sidechat format["ret %1", _ret];

_ret = [_dbHandle] call jayarma2lib_fnc_closeSql;


