select *
from {{ source('sales_data', 'order_s') }}