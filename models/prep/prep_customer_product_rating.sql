with customer_product_rating as (
    select * from {{ ref('stg_customer_product_rating') }}
    )

select
customerproductrating_id,
customer_id,
product_id,
ratings,
review,
sentiment
from customer_product_rating


