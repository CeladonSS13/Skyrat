#define ORIGINAL_WALKDELAY 1.5
#define CURRENT_WALKDELAY 1.8 // not using CONFIG_GET for better perfomance, considering how much it's gonna be used
#define VEHICLE_MOVEDELAY_MULTIPLIER 1 + 1 - (ORIGINAL_WALKDELAY/CURRENT_WALKDELAY) // 1.16666666667

/obj/vehicle/proc/get_movedelay()
	return movedelay * VEHICLE_MOVEDELAY_MULTIPLIER

#undef ORIGINAL_WALKDELAY
#undef VEHICLE_MOVEDELAY_MULTIPLIER
