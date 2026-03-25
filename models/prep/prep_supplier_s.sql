with supplier as (
    select * from {{ ref('stg_supplier_s') }}
)

select 
supplier_id,
supplier_name,
email
from supplier
