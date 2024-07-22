{%- set yaml_metadata -%}
sat_v0: "line_item_info_lrn0_s" 
hashkey: "hk_invoice_line_item_l"
hashdiff: "hd_line_item_info_lrn_s"
ledts_alias: 'ledts'
add_is_current_flag: true
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ datavault4dbt.sat_v1(sat_v0=metadata_dict.get('sat_v0'),
		hashkey=metadata_dict.get('hashkey'),
		hashdiff=metadata_dict.get('hashdiff'),
		ledts_alias=metadata_dict.get('ledts_alias'),
		add_is_current_flag=metadata_dict.get('add_is_current_flag')) }}
