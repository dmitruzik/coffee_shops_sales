source("load_data.r")


sales_by_location <- df %>%
    group_by(store_location) %>%
    summarise(total_sales = sum(total_sales))

ggplot(sales_by_location, aes(x = reorder(store_location, -total_sales), y = total_sales)) +
    geom_bar(stat = "identity", fill = "seagreen", color = "black") +
    geom_text(aes(label = round(total_sales, 0)), vjust = -0.5) +
    labs(title = "Total Sales by Store Location", x = "Store Location", y = "Total Sales (£)") +
    theme_minimal() +
    coord_flip()

avg_sales_by_location <- df %>%
    group_by(store_location) %>%
    summarise(avg_sales = mean(total_sales))

print(
    ggplot(avg_sales_by_location, aes(x = reorder(store_location, -avg_sales), y = avg_sales)) +
        geom_bar(stat = "identity", fill = "goldenrod", color = "black") +
        geom_text(aes(label = round(avg_sales, 0)), vjust = -0.5) +
        labs(title = "Average Sales per Store Location", x = "Store Location", y = "Average Sales (£)") +
        theme_minimal() +
        coord_flip()
)
print("Step 3: Store sales analysis completed!")
