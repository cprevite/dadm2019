#remove rows
bands <- bands[-c(486:540),]


#remove certain columns
bands <-
  bands[, which(
    !names(bands) %in% c(
      "date",
      "cylinder_no",
      "customer",
      "job_number",
      "ink_color",
      "blade_mfg",
      "cylinder_division",
      "unit_number",
      "location",
      "plating_tank",
      "solvent_pct",
      "ESA_voltage",
      "ESA_amperage" ,
      "chrome_content"
    )
  )]
