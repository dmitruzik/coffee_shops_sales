source("load_data.r")


category_sales <- df %>%
    group_by(product_category) %>%
    summarise(total_sales = sum(total_sales)) %>%
    arrange(desc(total_sales))

highest_selling <- category_sales$product_category[1]
lowest_selling <- category_sales$product_category[nrow(category_sales)]

print(
    ggplot(category_sales, aes(x = reorder(product_category, -total_sales), y = total_sales)) +
        geom_bar(stat = "identity", fill = "royalblue", color = "black") +
        geom_text(aes(label = round(total_sales, 0)), vjust = -0.5) +
        labs(title = "Total Sales by Product Category", x = "Product Category", y = "Total Sales (£)") +
        theme_minimal() +
        coord_flip()
)
print(paste("Highest selling category:", highest_selling))
print(paste("Lowest selling category:", lowest_selling))

print("Step 4: Product category sales analysis completed!")
