/**
* Generated by LEA for Arma 2 Combined Operation & ACE 2
* Version: 1.3.60
* Tue Jun 26 20:25:46 CEST 2012
* Mission file name: z-laser.utes
* Mission name: z-laser.utes
* Required mods:
* + ACE
* 
* Call the script: _dummy = [] execvm "lea\loadout-solo.sqf";
* 
*/

/**
* Loadout for Vehicles
*/


 clearweaponcargo h1;
 clearmagazinecargo h1;
 h1 addweaponcargo ["Javelin",2];
 h1 addweaponcargo ["Stinger",2];
 h1 addweaponcargo ["ACE_M72A2",3];
 h1 addweaponcargo ["ACE_M72",3];
 h1 addweaponcargo ["SMAW",2];
 h1 addweaponcargo ["ACE_M220Proxy",1];
 h1 addweaponcargo ["ACE_M220TripodProxy",1];
 h1 addmagazinecargo ["Javelin",10];
 h1 addmagazinecargo ["Stinger",6];
 h1 addmagazinecargo ["ACE_SMAW_NE",5];
 h1 addmagazinecargo ["SMAW_HEAA",3];
 h1 addmagazinecargo ["SMAW_HEDP",3];
 h1 addmagazinecargo ["ACE_SMAW_Spotting",2];


/**
* Loadout for ai units
*/

//No named AI units in this mission.

/**
* Loadout for playable units
*/


  removeallweapons u1;
  removeallitems u1;
  removeBackpack u1;

  [u1,0,0,0,true] call ACE_fnc_PackIFAK;
  _u1playerweap = [
	 ];

  _u1playerammo = [
	 ];

  _u1playerweapback = "";

  _u1playerweapruck = [];
  _u1playerammoruck = [];
  u1 setvariable ["ACE_weapononback", _u1playerweapback];
  {u1 addmagazine _x} foreach _u1playerammo;
  {u1 addWeapon _x} foreach _u1playerweap;

  if (count weapons u1 > 0) then {
    private['_type', '_muzzles'];
    _type = ((weapons u1) select 0);
    _muzzles = getArray(configFile >>"cfgWeapons">> _type >>"muzzles");
    if (count _muzzles > 1) then {
       u1 selectWeapon + (_muzzles select 0);
    }
    else {
       u1 selectWeapon _type;
    };
  };

  hintSilent "Loadout - done";
  sleep 10;
  hintSilent "";