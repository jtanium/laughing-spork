WITH base AS (

    SELECT *
    FROM {{ ref('base_bookings_flights') }}

),

status_arrived AS (
    SELECT *,
      scheduled_arrival - scheduled_departure AS scheduled_flight_time,
      actual_arrival - actual_departure AS actual_flight_time,
      actual_departure - scheduled_departure AS departure_diff,
      actual_arrival - scheduled_arrival AS arrival_diff
    FROM base
    WHERE status = 'Arrived'
)

SELECT *
FROM status_arrived
