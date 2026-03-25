with customer as (
    select * from {{ ref('stg_customer') }}
)

select 
customer_id,
first_name,
last_name,
concat(first_name, ' ', last_name) as full_name,
email,
country
from customer