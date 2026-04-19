#define CUSTOM_DREAMDAEMON_PID_PATH "/tmp/dreamdaemon.pid" // so unless your hosting actually writes to it, nothing happens

// world doesn't allow to declare extra variables to it, so we use GLOB here
GLOBAL_VAR_INIT(IS_WORLD_AUTO_HARD_REBOOT_PENDING, FALSE)
GLOBAL_PROTECT(IS_WORLD_AUTO_HARD_REBOOT_PENDING)

/// EXAMPLE for bash script to handle signals:
///handle_hard_reboot_sighup() {
///    echo "Received HUP signal! Process ID: $$"
///    pkill DreamDaemon
///}
///echo $$ > /tmp/dreamdaemon.pid
///trap 'handle_hard_reboot_hup' HUP
///... and after that, while loop for DreamDaemon goes... (or whatever you use)
/// example: DreamDaemon tgstation.dmb 25575 -trusted &
/// wait


/// THIS WILL NOT WORK UNTIL YOU SET UP EVERYTHING, YOU ALSO CAN COMPLETLY IGNORE IT WITHOUT ANY TROUBLE
/// THE ACTUAL TROUBLE WILL BE IN CASE IT'S ACTUALLY SET UP, BUT THE WRONG WAY
/// By some observations, players not always can connect without hard reboot the hosting service
/// This is intended to send SIGHUP signal which should be captured (by 'trap' likely) and restart DreamMaker
/world/proc/TryAutoHardReboot()
	if(GLOB.IS_WORLD_AUTO_HARD_REBOOT_PENDING || IsAdminAdvancedProcCall())
		return
	if (world.system_type != UNIX)
		return // not supported, write your own if needed
	GLOB.IS_WORLD_AUTO_HARD_REBOOT_PENDING = TRUE
	shell("pkill -HUP DreamDaemon") // linux magic

/world/Reboot(reason = 0, fast_track = FALSE)
	if (GLOB.IS_WORLD_AUTO_HARD_REBOOT_PENDING)
		return
	. = ..()
