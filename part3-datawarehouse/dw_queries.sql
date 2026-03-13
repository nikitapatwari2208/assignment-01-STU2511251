-- Q1 Sales revenue by category monthly

SELECT d.month,
p.category,
SUM(f.revenue)
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY d.month, p.category;