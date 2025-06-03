// THIS IS A NOVA SECTOR UI FILE

export type ExaminePanelData = {
  // Danger, do not use
  assigned_map: string;
  // Identity
  character_name: string;
  headshot: string;
  obscured: boolean;
  // Descriptions
  flavor_text: string;
  ooc_notes: string;
  custom_species: string;
  custom_species_lore: string;
  // SS1984 REMOVAL OF ERP FLAVOR AND NOTES, START, END
  // Antaggery
  // SS1984 REMOVAL START
  // ideal_antag_optin_status: string;
  // current_antag_optin_status: string;
  // opt_in_colors: {
  //   optin: string;
  //   color: string;
  // };
  // SS1984 REMOVAL END
  // Misc
  veteran_status: boolean;
};
