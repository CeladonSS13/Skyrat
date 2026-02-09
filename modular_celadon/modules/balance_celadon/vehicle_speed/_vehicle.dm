#define ORIGINAL_WALKDELAY 1.5
#define CURRENT_WALKDELAY 1.5 // not using CONFIG_GET for better perfomance, considering how much it's gonna be used
#define VEHICLE_MOVEDELAY_INCREASE CURRENT_WALKDELAY - ORIGINAL_WALKDELAY // no clamping and all that stuff, considering we already know numbers

/obj/vehicle/proc/get_movedelay()
	return movedelay + VEHICLE_MOVEDELAY_INCREASE

#undef ORIGINAL_WALKDELAY
#undef CURRENT_WALKDELAY
#undef VEHICLE_MOVEDELAY_INCREASE
