{%- set yaml_metadata -%}
link_hashkey: hk_bike_trip_nl
foreign_hashkeys: 
    - bike_id
    - start_station_id
    - end_station_id
payload:
    - trip_id
    - subscriber_type
    - bike_type
    - start_time
    - start_station_name
    - end_station_name
    - duration_minutes
source_models: stg_dv_bike_trip
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.nh_link(link_hashkey=metadata_dict.get('link_hashkey'),
                        foreign_hashkeys=metadata_dict.get('foreign_hashkeys'),
                        payload=metadata_dict.get('payload'),
                        source_models=metadata_dict.get('source_models')
                        ) }}
