{{ config(materialized='table')}}

with bikes as (
    select 
    distinct
    start_station_id as station_id,
    start_station_name as station_name,
    start_latitude as station_lat,
    start_longitude as station_long

    from {{ source('demo', 'bikes') }}
    where RIDE_ID != 'ride_id'
)

select * from bikes