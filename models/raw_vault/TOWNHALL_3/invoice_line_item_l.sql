{%- set yaml_metadata -%}
link_hashkey: 'hk_invoice_line_item_l'
foreign_hashkeys: 
    - 'hk_invoice_number'
    - 'line_item'
source_models: stg_dv_sales_data
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey'),
        foreign_hashkeys=metadata_dict.get('foreign_hashkeys'),
        source_models=metadata_dict.get('source_models')
        ) }}
