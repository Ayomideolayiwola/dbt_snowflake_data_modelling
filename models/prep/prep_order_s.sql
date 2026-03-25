with orders as (
    select * from {{ ref('stg_order_s') }}
)

select 
order_id_surrogate,
order_id,
customer_id,
order_date,
campaign_id,
amount,
payment_method_id
from orders
