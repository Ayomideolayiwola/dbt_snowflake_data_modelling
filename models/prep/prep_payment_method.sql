with payment_method as (
    select * from {{ ref('stg_payment_method') }}
)

select 
payment_method_id,
payment_method
from payment_method

