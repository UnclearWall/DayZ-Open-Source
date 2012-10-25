private["_obj","_uid","_key"];
//[dayz_characterID,_tent,[_dir,_location],"TentStorage"]
_uid = 	_this call dayz_objectUID2;

if (isServer) then {
//add to database
	if (parseNumber _uid > 0) then {
		//Send request
		_key = format["CHILD:310:%1:",_uid];
		_key call server_hiveWrite;
	};
	diag_log ("DELETE: Deleted " + str(_uid));
};