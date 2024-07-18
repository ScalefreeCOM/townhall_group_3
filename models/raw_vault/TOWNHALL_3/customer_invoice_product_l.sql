{%- set yaml_metadata -%}
link_hashkey: "hk_customer_invoice_product_l"
foreign_hashkeys: 
    - hk_customer_key
    - hk_item_number
    - hk_invoice_number
    - line_item
source_models:
    - name: stg_dv_sales_data
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.link(
        link_hashkey=metadata_dict.get("link_hashkey"),
        foreign_hashkeys=metadata_dict.get("foreign_hashkeys"),
        source_models=metadata_dict.get("source_models")
) }}
