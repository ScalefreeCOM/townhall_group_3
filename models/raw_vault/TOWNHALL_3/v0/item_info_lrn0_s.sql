
{%- set yaml_metadata -%}
parent_hashkey: "hk_customer_invoice_product_l"
src_hashdiff: "hd_item_info_lrn_s"
source_model: "stg_dv_sales_data"
src_payload: 
    - item_name
    - item_price

{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey'),
                        src_hashdiff=metadata_dict.get('src_hashdiff'),
                        source_model=metadata_dict.get('source_model'),
                        src_payload=metadata_dict.get('src_payload')) }}

