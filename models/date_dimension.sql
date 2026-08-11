{{ config(materialized='table') }}
with cte as (
    select
        try_to_timestamp(STARTED_AT) as STARTED_AT,
        DATE(try_to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
        HOUR(try_to_timestamp(STARTED_AT)) AS HOUR_STARTED_AT,
        {{get_season('STARTED_AT')}} as station_of_year,
        {{get_day('STARTED_AT')}} day_type,
        -- case
        -- when month(try_to_timestamp(STARTED_AT)) in (12,1,2)
        -- then 'WINTER'
        -- when month(try_to_timestamp(STARTED_AT)) in (3,4,5)
        -- then 'SPRING'
        -- when month(try_to_timestamp(STARTED_AT)) in (6,7,8)
        -- then 'SUMMER'
        -- ELSE 'AUTUMN'
        -- end as station_of_year

    from {{ ref('stg_bike') }}
    where STARTED_AT != 'started_at'
)

select *
from cte