
// overriding var/allow_ai and var/can_pai_move_suit(remove this of offs make pai app)

/obj/item/mod/control
	allow_ai = TRUE
	can_pai_move_suit = TRUE

//added code
/obj/item/mod/module
	///should this module automatically pin?
	var/auto_pin = FALSE //see autopin.dm
