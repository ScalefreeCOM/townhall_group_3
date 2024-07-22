{%- set yaml_metadata -%}
link_hashkey: hk_bike_trip_nl
foreign_hashkeys: 
    - hk_bike_h
    - hk_start_station_h
    - hk_end_station_h
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
