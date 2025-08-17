/// Associative list of all jobs and their department color classes
GLOBAL_LIST_INIT(nttc_jobs, list(
	//No department
	JOB_ASSISTANT = "radio",
	JOB_PRISONER = "monkey",
	//Command
	JOB_CAPTAIN = "comradio",
	JOB_HEAD_OF_PERSONNEL = "comradio",
	JOB_HEAD_OF_SECURITY = "secradio",
	JOB_RESEARCH_DIRECTOR = "sciradio",
	JOB_CHIEF_ENGINEER = "engradio",
	JOB_CHIEF_MEDICAL_OFFICER = "medradio",
	JOB_BRIDGE_ASSISTANT = "comradio",
	JOB_BRIDGE_ASSISTANT_1984 = "comradio",
	JOB_VETERAN_ADVISOR = "comradio",
	//Silicon
	JOB_AI = "aiprivradio",
	JOB_CYBORG = "aiprivradio",
	JOB_PERSONAL_AI = "aiprivradio",
	JOB_HUMAN_AI = "aiprivradio",
	//Security
	JOB_WARDEN = "secradio",
	JOB_DETECTIVE = "secradio",
	JOB_SECURITY_OFFICER = "secradio",
	JOB_SECURITY_OFFICER_MEDICAL = "secradio",
	JOB_SECURITY_OFFICER_ENGINEERING = "secradio",
	JOB_SECURITY_OFFICER_SCIENCE = "secradio",
	JOB_SECURITY_OFFICER_SUPPLY = "secradio",
	JOB_CORRECTIONS_OFFICER = "secradio", // NOVA EDIT ADDITION
	//Engineering
	JOB_STATION_ENGINEER = "engradio",
	JOB_ATMOSPHERIC_TECHNICIAN = "engradio",
	JOB_TELECOMMS_SPECIALIST = "engradio", // NOVA EDIT ADDITION
	JOB_ENGINEERING_GUARD = "secradio", // NOVA EDIT ADDITION
	//Medical
	JOB_CORONER = "medradio",
	JOB_MEDICAL_DOCTOR = "medradio",
	JOB_PARAMEDIC = "medradio",
	JOB_CHEMIST = "medradio",
	JOB_VIROLOGIST = "medradio", // NOVA EDIT ADDITION
	JOB_ORDERLY = "medradio", // NOVA EDIT ADDITION
	//Science
	JOB_SCIENTIST = "sciradio",
	JOB_ROBOTICIST = "sciradio",
	JOB_GENETICIST = "sciradio",
	JOB_SCIENCE_GUARD = "secradio", // NOVA EDIT ADDITION
	//Supply
	JOB_QUARTERMASTER = "suppradio",
	JOB_CARGO_TECHNICIAN = "suppradio",
	JOB_CARGO_GORILLA = "suppradio",
	JOB_SHAFT_MINER = "suppradio",
	JOB_BITRUNNER = "suppradio",
	JOB_CUSTOMS_AGENT = "suppradio", // NOVA EDIT ADDITION
	//Service
	JOB_BARTENDER = "servradio",
	JOB_BOTANIST = "servradio",
	JOB_COOK = "servradio",
	JOB_CHEF = "servradio", // Alternate cook title.
	JOB_JANITOR = "servradio",
	JOB_CLOWN = "servradio",
	JOB_MIME = "servradio",
	JOB_CURATOR = "servradio",
	JOB_LAWYER = "servradio",
	JOB_CHAPLAIN = "servradio",
	JOB_PSYCHOLOGIST = "servradio",
	JOB_PUN_PUN = "servradio",
	JOB_BARBER = "servradio", // NOVA EDIT ADDITION
	JOB_BOUNCER = "secradio", // NOVA EDIT ADDITION
	//ERTs
	JOB_ERT_DEATHSQUAD = "centcomradio",
	JOB_ERT_COMMANDER = "centcomradio",
	JOB_ERT_OFFICER = "centcomradio",
	JOB_ERT_ENGINEER = "centcomradio",
	JOB_ERT_MEDICAL_DOCTOR = "centcomradio",
	JOB_ERT_CHAPLAIN = "centcomradio",
	JOB_ERT_JANITOR = "centcomradio",
	JOB_ERT_CLOWN = "centcomradio",
	//CentCom
	JOB_CENTCOM = "centcomradio",
	JOB_CENTCOM_OFFICIAL = "centcomradio",
	JOB_CENTCOM_ADMIRAL = "centcomradio",
	JOB_CENTCOM_COMMANDER = "centcomradio",
	JOB_CENTCOM_VIP = "centcomradio",
	JOB_CENTCOM_BARTENDER = "centcomradio",
	JOB_CENTCOM_CUSTODIAN = "centcomradio",
	JOB_CENTCOM_THUNDERDOME_OVERSEER = "centcomradio",
	JOB_CENTCOM_MEDICAL_DOCTOR = "centcomradio",
	JOB_CENTCOM_RESEARCH_OFFICER = "centcomradio",
	JOB_CENTCOM_SPECIAL_OFFICER = "centcomradio",
	JOB_CENTCOM_PRIVATE_SECURITY = "centcomradio",
	// NOVA EDIT ADDITION START
	JOB_BLUESHIELD = "comradio",
	JOB_NT_REP = "comradio",
	// Nanotrasen Naval Command jobs
	JOB_NAVAL_ENSIGN = "centcomradio",
	JOB_NAVAL_LIEUTENANT = "centcomradio",
	JOB_NAVAL_LTCR = "centcomradio",
	JOB_NAVAL_COMMANDER = "centcomradio",
	// ITS DEFINED AS "CAPTAIN"!!! JOB_NAVAL_CAPTAIN = "centcomradio",
	JOB_NAVAL_REAR_ADMIRAL = "centcomradio",
	JOB_NAVAL_ADMIRAL = "centcomradio",
	JOB_NAVAL_FLEET_ADMIRAL = "centcomradio",
	// Off-Station
	JOB_SPACE_POLICE = "secradio",
	JOB_SOLFED = "centcomradio",
	JOB_SOLFED_LIASON = "centcomradio",
	// NOVA EDIT ADDITION END
))
/// List of highlight jobs (command, centcom, ert)
GLOBAL_LIST_INIT(nttc_highlight_jobs, list(
	// COMMAND
	JOB_CAPTAIN,
	JOB_HEAD_OF_PERSONNEL,
	JOB_RESEARCH_DIRECTOR,
	JOB_CHIEF_ENGINEER,
	JOB_CHIEF_MEDICAL_OFFICER,
	JOB_HEAD_OF_SECURITY,
	JOB_QUARTERMASTER,
	// CENTCOM
	JOB_CENTCOM,
	JOB_CENTCOM_OFFICIAL,
	JOB_CENTCOM_ADMIRAL,
	JOB_CENTCOM_COMMANDER,
	JOB_CENTCOM_VIP,
	JOB_CENTCOM_BARTENDER,
	JOB_CENTCOM_CUSTODIAN,
	JOB_CENTCOM_THUNDERDOME_OVERSEER,
	JOB_CENTCOM_MEDICAL_DOCTOR,
	JOB_CENTCOM_RESEARCH_OFFICER,
	JOB_CENTCOM_SPECIAL_OFFICER,
	JOB_CENTCOM_PRIVATE_SECURITY,
	// ERT
	JOB_ERT_DEATHSQUAD,
	JOB_ERT_COMMANDER,
	JOB_ERT_OFFICER,
	JOB_ERT_ENGINEER,
	JOB_ERT_MEDICAL_DOCTOR,
	JOB_ERT_CHAPLAIN,
	JOB_ERT_JANITOR,
	JOB_ERT_CLOWN,
	// AI
	JOB_AI,
	// NOVA CENTCOM ADDITION
	JOB_NAVAL_ENSIGN,
	JOB_NAVAL_LIEUTENANT,
	JOB_NAVAL_LTCR,
	JOB_NAVAL_COMMANDER,
	JOB_NAVAL_CAPTAIN,
	JOB_NAVAL_REAR_ADMIRAL,
	JOB_NAVAL_ADMIRAL,
	JOB_NAVAL_FLEET_ADMIRAL,
	//ss1984 command-centcom addiction
	JOB_NT_REP,
))
