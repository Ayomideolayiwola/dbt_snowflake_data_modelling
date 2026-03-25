select *
from {{ source('sales_data', 'returns') }}
