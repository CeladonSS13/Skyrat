#define CUSTOM_DREAMDAEMON_PID_PATH "/tmp/dreamdaemon.pid" // so unless your hosting actually writes to it, nothing happens

/// EXAMPLE for bash script to handle signals:
///handle_hard_reboot_sigusr1() {
///    echo "Received SIGUSR1 signal! Process ID: $$"
///    pkill DreamDaemon
///}
///echo $$ > /tmp/dreamdaemon.pid
///trap 'handle_hard_reboot_sigusr1' SIGUSR1
///... and after that, while loop for DreamDaemon goes... (or whatever you use)
/// example: DreamDaemon tgstation.dmb 25575 -trusted &
/// wait


/// THIS WILL NOT WORK UNTIL YOU SET UP EVERYTHING, YOU ALSO CAN COMPLETLY IGNORE IT WITHOUT ANY TROUBLE
/// THE ACTUAL TROUBLE WILL BE IN CASE IT'S ACTUALLY SET UP, BUT THE WRONG WAY
/// By some observations, players not always can connect without hard reboot the hosting service
/// This is intended to send SIGUSR1 signal which should be captured (by 'trap' likely) and restart DreamMaker
/proc/TryAutoHardReboot()
	if (world.system_type != UNIX)
		return // not supported, write your own if needed
	shell("pkill -USR1 DreamDaemon") // linux magic
