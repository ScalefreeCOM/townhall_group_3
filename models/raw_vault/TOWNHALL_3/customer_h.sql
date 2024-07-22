{%- set yaml_metadata -%}
hashkey: "hk_customer_key"
business_keys: 
    - customer_key
source_models: 
    - name: stg_dv_sales_data
      hk_column: 'hk_customer_key'
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey'),
                    business_keys=metadata_dict.get('business_keys'),
                    source_models=metadata_dict.get('source_models')) }}

