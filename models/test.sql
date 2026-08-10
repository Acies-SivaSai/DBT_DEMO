select
*
from {{ source('demo', 'bikes') }}
limit 10