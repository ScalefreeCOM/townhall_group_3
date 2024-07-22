{%- set yaml_metadata -%}
ldts: LoadDate
rsrc: RecordSource
source_model: stg_bike_trip
hashed_columns:
    # Hub
    hk_bike_h:
        - bike_id

    hk_start_station_h:
        - start_station_id

    hk_end_station_h:
        - end_station_id

    # Link
    hk_bike_trip_nl:
        - start_station_id
        - end_station_id
        - bike_id
        - trip_id
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                        ldts=metadata_dict.get('ldts'),
                        rsrc=metadata_dict.get('rsrc'),
                        hashed_columns=metadata_dict.get('hashed_columns'),
                        derived_columns=metadata_dict.get('derived_columns'),
                        prejoined_columns=metadata_dict.get('prejoined_columns'),
                        missing_columns=metadata_dict.get('missing_columns')) }}

