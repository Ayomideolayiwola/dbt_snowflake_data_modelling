with orderitem as (
    select * from {{ ref('stg_orderitem') }}
)

select 
orderitem_id,
order_id,
product_id,
quantity,
supplier_id,
subtotal,
discount

from orderitem 
