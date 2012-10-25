private["_obj","_dir","_pos"];
_obj = _this select 3;
_dir = direction _obj;
_pos = getposATL _obj;

player playActionNow "Medic";
sleep 1;
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
sleep 5;
	
dayzDeleteObj = [_dir,_pos];
publicVariable "dayzDeleteObj";
if (isServer) then {
	dayzDeleteObj call local_deleteObj;
};

deleteVehicle _obj;