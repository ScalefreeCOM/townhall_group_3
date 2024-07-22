{%- set yaml_metadata -%}
link_hashkey: "hk_invoice_nl"
foreign_hashkeys: 
    - hk_customer_key
    - hk_item_number
    - hk_invoice_number
payload:
    - invoice_date
source_models:
    - name: stg_dv_sales_data
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.nh_link(
        link_hashkey=metadata_dict.get("link_hashkey"),
        foreign_hashkeys=metadata_dict.get("foreign_hashkeys"),
        payload=metadata_dict.get('payload'),
        source_models=metadata_dict.get("source_models")
) }}
