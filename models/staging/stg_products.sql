select *
from {{ source('sales_data', 'product') }}