private["_array","_type","_classname","_holder","_config","_isOk","_muzzles"];
_array = _this select 3;
_type = _array select 0;
_classname = _array select 1;
_holder = _array select 2;
player playActionNow "PutDown";
if (_classname == "MeleeCrowbar") then {
	player addMagazine 'crowbar_swing';
} else {
	if (_classname == "MeleeHatchet") then {
		player addMagazine 'hatchet_swing';
	};
};
_config = (configFile >> _type >> _classname);
_isOk = [player,_config] call BIS_fnc_invAdd;
if (_isOk) then {
	deleteVehicle _holder;
	if (_classname in ["MeleeHatchet","MeleeCrowbar"]) then {

		if (_type == "cfgWeapons") then {
			_muzzles = getArray(configFile >> "cfgWeapons" >> _classname >> "muzzles");
			_wtype = ((weapons player) select 0);
			if (count _muzzles > 1) then {
				player selectWeapon (_muzzles select 0);
			} else {
				player selectWeapon _wtype;
			};
		};
	};
} else {
	cutText [localize "STR_DAYZ_CODE_2", "PLAIN DOWN"];
	if (_classname == "MeleeCrowbar") then {
		player removeMagazine 'crowbar_swing';
	} else {
		if (_classname == "MeleeHatchet") then {
			player removeMagazine 'hatchet_swing';
		};
	};
};

