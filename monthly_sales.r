source("load_data.r")

monthly_counts <- df %>%
    mutate(month = floor_date(transaction_date, "month")) %>%
    group_by(month) %>%
    summarise(transaction_count = n())
print(
    ggplot(monthly_counts, aes(x = month, y = transaction_count)) +
        geom_bar(stat = "identity", fill = "skyblue", color = "black") +
        geom_text(aes(label = transaction_count), vjust = -0.5) +
        labs(title = "Monthly Transaction Counts", x = "Month", y = "Number of Transactions") +
        theme_minimal()
)
print("Step 1: Monthly sales analysis completed!")
