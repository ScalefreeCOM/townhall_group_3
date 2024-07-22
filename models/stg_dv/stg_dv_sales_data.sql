{%- set yaml_metadata -%}
ldts: LoadDate
rsrc: RecordSource
source_model: stg_sales_data
hashed_columns:
    # Hub
    hk_customer_key:
        - customer_key

    hk_item_number:
        - item_number

    hk_invoice_number:
        - invoice_number

    # Link
    hk_invoice_nl:
        - customer_key
        - item_number
        - invoice_number

    hk_invoice_line_item_l:
        - invoice_number
        - line_item

    # Satellite
    hd_item_info_lrn_s:
        is_hashdiff: true
        columns:
            - item_name
            - item_price

    hd_line_item_info_lrn_s:
        is_hashdiff: true
        columns:
            - quantity
            - discount

{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                        ldts=metadata_dict.get('ldts'),
                        rsrc=metadata_dict.get('rsrc'),
                        hashed_columns=metadata_dict.get('hashed_columns'),
                        derived_columns=metadata_dict.get('derived_columns'),
                        prejoined_columns=metadata_dict.get('prejoined_columns'),
                        missing_columns=metadata_dict.get('missing_columns')) }}

