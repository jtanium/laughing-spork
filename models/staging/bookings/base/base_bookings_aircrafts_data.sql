WITH source AS (

    SELECT *
    FROM {{ source('bookings', 'aircrafts_data') }}

),

retyped AS (
    SELECT
        aircraft_code,
        range::INTEGER AS range_km,
        model
    FROM source
)

SELECT *
FROM retyped
