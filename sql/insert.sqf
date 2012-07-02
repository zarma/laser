/***********************************************************
UPDATE 
- Function
- result = [_table,_values] call z_fnc_sql_ins;
************************************************************/

private [
	"_nbparameters",
	"_parameters",
	"_indexparameters",
	"_table",
	"_values",
	"_SQL",
	"_dbHandle",
	"_ret"
	];
_parameters = [
	"_table",
	"_values"
	];

_indexparameters = 0;
_nbparameters = count _this;
{
	if (_indexparameters <= _nbparameters) then {
	call compile format["%1 = _this select %2;", _x, _indexparameters];
	};
	_indexparameters = _indexparameters + 1;
}foreach _parameters;


//player sidechat "insert début";
_table = "message";
_values = "'code','test'";
_SQL = format[ "INSERT INTO %1 VALUES (%2)",_table,_values];
//player sidechat _SQL;
_dbHandle = ["message.sqlite"] call jayarma2lib_fnc_openSql;
//player sidechat _dbHandle;
_ret = [_dbHandle, "INSERT INTO message VALUES ('code','toto')"] call jayarma2lib_fnc_execSql;

//player sidechat format["ret %1", _ret];

_ret = [_dbHandle] call jayarma2lib_fnc_closeSql;
 