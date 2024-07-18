{%- set yaml_metadata -%}
hashkey: "hk_item_number"
business_keys: 
 - item_number
source_models: 
    - name: stg_dv_sales_data
      hk_column: 'hk_item_number'
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey'),
                    business_keys=metadata_dict.get('business_keys'),
                    source_models=metadata_dict.get('source_models')) }}

