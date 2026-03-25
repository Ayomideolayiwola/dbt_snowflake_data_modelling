select *
from {{ source('sales_data', 'orderitem') }}