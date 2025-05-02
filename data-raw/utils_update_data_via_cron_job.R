## code to prepare `utils_update_data_via_cron_job` dataset goes here

fake_data_updated_via_cron_job <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  date = Sys.Date()
)

# save data and set overwrite= TRUE to replace with new data
# usethis::use_data(fake_data_updated_via_cron_job, overwrite = TRUE)

save(fake_data_updated_via_cron_job, file = here::here("inst/app/data/fake_data_updated_via_cron_job.rda"))
