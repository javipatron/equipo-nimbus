convert_monthly_to_bimonthly <- function(df, month_column) {
  df_odd_column <- df %>%
    mutate(odd_month_date = {{ month_column }}, .after = {{ month_column }}) %>% # Create a copy of the month column which will be filled with bimonthly dates
    mutate(odd_month_date = str_replace(odd_month_date, "02-01", "01-01"), # Converting to merge even months into odd months
           odd_month_date = str_replace(odd_month_date, "04-01", "03-01"),
           odd_month_date = str_replace(odd_month_date, "06-01", "05-01"),
           odd_month_date = str_replace(odd_month_date, "08-01", "07-01"),
           odd_month_date = str_replace(odd_month_date, "10-01", "09-01"),
           odd_month_date = str_replace(odd_month_date, "12-01", "11-01"),
           odd_month_date = as.Date(odd_month_date)) # Make it a Date variable again
}