
//CentCom Accesses
/// CentCom Naval Admirals access
#define ACCESS_CENT_ADMIRAL "cent_admiral"
/// CentCom Naval Fleet Admiral access
#define ACCESS_CENT_FLEET_ADMIRAL "cent_fleet_admiral"
/// Special Blackops+ Access
#define ACCESS_CENT_BLACKOPS "cent_blackops"
/// Special Operations officer Access
#define ACCESS_CENT_SECURITY "cent_security"
/// Special Ops Commander / blackops access(WIP)
#define ACCESS_CENT_SPECOPS_LEADER "cent_specops_leader"
/// Special Operations officer Access
#define ACCESS_CENT_SPECOPS_OFFICER "cent_specops_officer"
/// CentCom Official access
#define ACCESS_CENT_OFFICIAL "cent_official"
/// CentCom Cargo office access
#define ACCESS_CENT_SUPPLY "cent_supply"


//fleet admiral access and region
#define CENTCOM_NAVAL_ACCESS list( \
	ACCESS_CENT_ADMIRAL, \
	ACCESS_CENT_FLEET_ADMIRAL, \
)
/// Name for the NanoTrasen Naval region.
#define REGION_CENTCOM_NAVAL "Nanotrasen Naval"
/// Used to seed the accesses_by_region list in SSid_access. A list of all CENTCOM_NAVAL_ACCESS regional accesses.
#define REGION_ACCESS_CENTCOM_NAVAL CENTCOM_NAVAL_ACCESS

//nrt access and region
#define NTR_ACCESS list( \
	ACCESS_CENT_GENERAL, \
	ACCESS_CENT_LIVING, \
	ACCESS_COMMAND, \
	ACCESS_VAULT, \
)
///name for nanotrasen consultant "region".
#define REGION_CENTCOM_NTR "Nanotrasen Official"
/// Used to seed the accesses_by_region list in SSid_access.
#define REGION_ACCESS_CENTCOM_NTR NTR_ACCESS

//centcom captain access and region
#define CENTCOM_CAPTAIN_ACCESS list( \
	ACCESS_CENT_CAPTAIN, \
	ACCESS_CENT_SPECOPS_OFFICER, \
	ACCESS_CENT_OFFICER, \
)
/// Name for the CentCom Captain region.
#define REGION_CENTCOM_CAPTAIN "Centcom Officer"
/// Used to seed the accesses_by_region list in SSid_access. A list of all CENTCOM_CAPTAIN_ACCESS regional accesses.
#define REGION_ACCESS_CENTCOM_CAPTAIN CENTCOM_CAPTAIN_ACCESS

//specops officer access and region
#define CENTCOM_SPECOPS_ACCESS list( \
	ACCESS_CENT_BLACKOPS, \
	ACCESS_CENT_SPECOPS_LEADER, \
	ACCESS_CENT_SPECOPS, \
)
/// Name for the NanoTrasen SPEC ops region.
#define REGION_CENTCOM_SPECOPS "Nanotrasen Specialops"
/// Used to seed the accesses_by_region list in SSid_access. A list of all CENTCOM_SPECOPS_ACCESS regional accesses.
#define REGION_ACCESS_CENTCOM_SPECOPS CENTCOM_SPECOPS_ACCESS

//all centcom access
#define REGION_ALL_CENTCOM "Centcom"
/// Used to seed the accesses_by_region list in SSid_access. A list of all centcom accesses.
#define REGION_ACCESS_ALL_CENTCOM CENTCOM_ACCESS + CENTCOM_SPECOPS_ACCESS + CENTCOM_CAPTAIN_ACCESS + CENTCOM_NAVAL_ACCESS

#define REGION_AREA_CENTCOM list( \
	REGION_CENTCOM, \
	REGION_CENTCOM_SPECOPS, \
	REGION_CENTCOM_CAPTAIN, \
	REGION_CENTCOM_NAVAL, \
)

//nri
#define ACCESS_NRI "nri"
#define ACCESS_NRI_POLICE "nri_police"

//syndicate
#define ACCESS_SYNDICATE_DS "syndicate_deepspace"
#define ACCESS_SYNDICATE_IP "syndicate_interdyne"
#define ACCESS_SYNDICATE_OFFICER "syndicate_officer"
