{{ config(materialized='table') }}

with trip as (
    select 
    RIDE_ID,
    RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) as TRIP_DATE,
    START_STATION_ID,
    END_STATION_ID,
    MEMBER_OR_CASUAL_RIDE,
    TIMESTAMPDIFF(second,to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration_seconds
    from {{ source('demo', 'bikes') }}
    where RIDE_ID != 'ride_id'
)

select * from trip