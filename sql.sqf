//player sidechat "sql create table debut";
_dbHandle = ["message.sqlite"] call jayarma2lib_fnc_openSql;
retval = [_dbHandle, " 
    CREATE TABLE IF NOT EXISTS 
    message (
		code TEXT,
        msg TEXT
    );
"] call jayarma2lib_fnc_execSql;

_ret = [_dbHandle] call jayarma2lib_fnc_closeSql;