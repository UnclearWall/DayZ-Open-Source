/***********************************************************
ASSIGN DAMAGE HANDLER TO A UNIT
- Function
- [unit] call fnc_usec_damageHandle;
************************************************************/
private["_object","_eh1","_eh2","_dir","_location"];
_object = _this select 0;
_location = getPosATL _this;

diag_log ("vehicle_init");
diag_log (_unit);

//Assign event handlers
_eh1 = _object addeventhandler ["HandleDamage",{if (local (_this select 0)) then {_this call fnc_usec_damageVehicle}}];
_eh2 = _object addeventhandler ["Killed",{if (local (_this select 0)) then {_this call object_vehicleKilled}}];

//Publish to database/item management
if (!isServer) then {
	_eh3 = _object addEventHandler ["GetOut", {[(_this select 0),"position"] call server_updateObject;}];
};