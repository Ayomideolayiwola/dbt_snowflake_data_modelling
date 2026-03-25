with products as (
    select * from {{ ref('stg_products') }}
)

select
product_id,
name,
price,
subcategory_id
from products