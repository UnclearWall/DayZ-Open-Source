private["_dialog","_magazineArray","_control","_item","_val","_max"];
diag_log ("REQUESTING GEAR SYNC");
disableSerialization;
//if (!dayzGearSave) exitWith {};

diag_log ("CONDUCTING GEAR SYNC");
_dialog = 			_this select 0;
_magazineArray = 	[];

//Primary Mags
for "_i" from 109 to 120 do 
{
	_control = 	_dialog displayCtrl _i;
	_item = 	gearSlotData _control;
	_val =		gearSlotAmmoCount _control;
	_max = 		getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if (_val != _max) then {
			_magazineArray set [count _magazineArray,[_item,_val]];
		} else {
			_magazineArray set [count _magazineArray,_item];
		};
	};
};

//Secondary Mags
for "_i" from 122 to 129 do 
{
	_control = 	_dialog displayCtrl _i;
	_item = 	gearSlotData _control;
	_val =		gearSlotAmmoCount _control;
	_max = 		getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if (_val != _max) then {
			_magazineArray set [count _magazineArray,[_item,_val]];
		} else {
			_magazineArray set [count _magazineArray,_item];
		};
	};
};
dayz_unsaved = true;
dayz_Magazines = _magazineArray;	
