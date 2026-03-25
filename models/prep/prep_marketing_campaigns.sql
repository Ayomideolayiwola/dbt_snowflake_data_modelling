with marketing_campaigns as (
    select * from {{ ref('stg_marketing_campaigns') }}
)

select 
campaign_id,
campaign_name,
offer_week
from marketing_campaigns


