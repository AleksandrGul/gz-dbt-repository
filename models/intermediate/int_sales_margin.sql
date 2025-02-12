SELECT
orders_id,
date_date,
quantity * purchase_price AS purchase_cost,

revenue - (quantity * purchase_price) as margin,
revenue, 
quantity,
purchase_price
FROM {{ref("stg_raw__sales")}}
JOIN {{ref("stg_raw__product")}}
USING(products_id)