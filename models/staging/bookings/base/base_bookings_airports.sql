WITH source AS (

    SELECT *
    FROM {{ source('bookings', 'airports') }}

),

renamed AS (
    SELECT
        city,
        timezone,
        coordinates,
        airport_code,
        airport_name
    FROM source
)

SELECT *
FROM renamed
