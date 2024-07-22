{%- set yaml_metadata -%}
hashkey: 'hk_bike_h'
business_keys: 
    - bike_id
source_models: stg_dv_bike_trip
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey'),
                    business_keys=metadata_dict.get('business_keys'),
                    source_models=metadata_dict.get('source_models')
                    ) }}
