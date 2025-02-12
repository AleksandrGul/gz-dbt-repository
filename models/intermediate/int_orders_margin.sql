SELECT 
    orders_id,
    DATE(date_date) AS date_date, 
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity, 
    SUM(purchase_cost) AS total_purchase_cost,
    SUM(margin) AS total_margin

FROM {{ref("int_sales_margin")}} 
GROUP BY orders_id, date_date  
ORDER BY date_date ASC