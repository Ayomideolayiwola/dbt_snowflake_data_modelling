select *
from {{ source('sales_data', 'supplier_s') }}
