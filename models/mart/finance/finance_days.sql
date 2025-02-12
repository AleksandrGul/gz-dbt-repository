{{ config(
    materialized='table' 
) }}
SELECT 
    o.date_date,
    COUNT(o.orders_id) AS nb_transaction,
    SUM(m.total_revenue) AS revenue,
    SUM(m.total_revenue) / COUNT(o.orders_id) AS average_basket,
    SUM(m.total_margin) AS margin,
    SUM(o.operational_margin) AS operational_margin
FROM {{ref("int_orders_operational")}} o
JOIN {{ref("int_orders_margin")}} m
ON o.date_date = m.date_date
GROUP BY o.date_date
ORDER BY o.date_date desc