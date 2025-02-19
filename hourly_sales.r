source("load_data.r")

hourly_sales <- df %>%
    group_by(hour) %>%
    summarise(total_products_sold = sum(transaction_qty))
print(
    ggplot(hourly_sales, aes(x = factor(hour), y = total_products_sold)) +
        geom_bar(stat = "identity", fill = "lightcoral", color = "black") +
        geom_text(aes(label = total_products_sold), vjust = -0.5) +
        labs(title = "Sales Count by Hour of the Day", x = "Hour", y = "Total Products Sold") +
        theme_minimal()
)
print("Step 2: Hourly sales analysis completed!")
