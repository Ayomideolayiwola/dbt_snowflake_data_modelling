with returned as (
    select * from {{ ref('stg_returns') }}
)

select
return_id,
order_id,
product_id,
return_date,
reason,
amount_refunded
from returned 