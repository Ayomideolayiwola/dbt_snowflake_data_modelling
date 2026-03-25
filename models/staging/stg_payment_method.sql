select *
from {{ source('sales_data', 'payment_method') }}