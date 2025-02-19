library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)
library(hms)

file_path <- "Coffee Shop Sales.xlsx"
df <- read_excel(file_path, sheet = "Transactions")

df$transaction_date <- as.Date(df$transaction_date)
df$transaction_time <- hms::as_hms(df$transaction_time)
df$hour <- hour(df$transaction_time)

df$total_sales <- df$transaction_qty * df$unit_price

print("Data loaded successfully!")
