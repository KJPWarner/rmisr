create_loc_tables <- function(loc_all){

  #hatchery locations data object
  loc_h <- loc_all %>%
    filter(location_type == 3) %>%
    rename(hatchery_location_code = location_code, hatchery_name = name, h_description = description)%>%
    select(hatchery_location_code, hatchery_name, h_description)

  #recovery locations data object
  loc_rec <- loc_all %>%
    filter(location_type == 1) %>%
    rename(recovery_basin = psc_basin, recovery_region = psc_region, rec_lat = latitude, rec_long = longitude,
           recovery_location_code = location_code, rec_loc_name= name, rec_description = description) %>%
    select(recovery_location_code, rec_loc_name, rec_description, recovery_basin, recovery_region, rec_lat, rec_long)


  #release locations data object
  loc_rel <- loc_all %>%
    filter(location_type == 4) %>%
    rename(rel_loc_name= name, release_basin = psc_basin, release_region = psc_region,
           release_location_code = location_code, rel_lat = latitude, rel_long = longitude) %>%
    select(release_location_code, rel_loc_name, release_basin, release_region, rel_lat, rel_long)


  #stock locations data object
  loc_stck <- loc_all %>%
    filter(location_type == 5) %>%
    rename(stock_location_code = location_code, stock_name = name) %>%
    select(stock_location_code, stock_name)

  loc_list <- list(loc_h = loc_h, loc_rec = loc_rec, loc_rel = loc_rel, loc_stck = loc_stck)


  return(map(loc_list, as_tibble))


}
