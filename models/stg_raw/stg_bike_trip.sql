SELECT
    TIMESTAMP("2024-07-22 08:08:21.464321 UTC") as LoadDate,
    "BIGQUERY_SAMPLE_DATA" as RecordSource,
    trip_id,
    subscriber_type,
    bike_id,
    bike_type,
    start_time,
    start_station_id,
    start_station_name,
    CAST(end_station_id as INTEGER) as end_station_id,
    end_station_name,
    duration_minutes
FROM 
    {{ source('townhall_3','austin_bikeshare_trips') }}
WHERE
    start_station_id is not NULL
    AND end_station_id is not NULL
    AND end_station_id != "Event"
