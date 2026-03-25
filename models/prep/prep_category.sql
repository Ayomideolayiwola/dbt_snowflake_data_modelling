with category as (
    select * from {{ ref('stg_category') }}
)

select 
category_id,
category_name
from category