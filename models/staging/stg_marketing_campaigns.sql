select *
from {{ source('sales_data', 'marketing_campaigns') }}