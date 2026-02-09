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
  // Celadon REMOVAL OF ERP FLAVOR AND NOTES, START, END
  // Antaggery
  // Celadon REMOVAL START
  // ideal_antag_optin_status: string;
  // current_antag_optin_status: string;
  // opt_in_colors: {
  //   optin: string;
  //   color: string;
  // };
  // Celadon REMOVAL END
  // Misc
  nova_star_status: boolean;
};
