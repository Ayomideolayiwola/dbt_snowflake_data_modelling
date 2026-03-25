select *
from {{ source('sales_data', 'subcategory') }}