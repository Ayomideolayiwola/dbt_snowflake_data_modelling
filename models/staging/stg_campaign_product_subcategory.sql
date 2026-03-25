
select *
from {{ source('sales_data', 'campaign_product_subcategory') }}
