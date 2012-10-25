/***********************************************************
ASSIGN DAMAGE HANDLER TO A UNIT
- Function
- [unit] call fnc_usec_damageHandle;
************************************************************/
private["_unit","_eh1","_eh2","_dir","_location"];
_unit = _this;
_dir = getdir _this;
_location = getPosATL _this;

//Assign event handlers
_eh1 = _unit addeventhandler ["HandleDamage",{if (local (_this select 0)) then {_this call fnc_usec_damageVehicle}}];
_eh2 = _unit addeventhandler ["Killed",{if (local (_this select 0)) then {_this call object_vehicleKilled}}];

//Publish to database/item management
if (isServer) then {
	_eh3 = _unit addEventHandler ["GetOut", {[(_this select 0),"position"] call server_updateObject;}];
};