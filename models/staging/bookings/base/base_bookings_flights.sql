WITH source AS (

    SELECT *
    FROM {{ source('bookings', 'flights') }}

),

retyped AS (
    SELECT
        status,
        flight_id,
        flight_no,
        aircraft_code,
        actual_arrival::TIMESTAMPTZ,
        arrival_airport,
        actual_departure::TIMESTAMPTZ,
        departure_airport,
        scheduled_arrival::TIMESTAMPTZ,
        scheduled_departure::TIMESTAMPTZ
    FROM source
)

SELECT *
FROM retyped
