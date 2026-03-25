select *
from {{ source('sales_data', 'customer_product_rating') }}

