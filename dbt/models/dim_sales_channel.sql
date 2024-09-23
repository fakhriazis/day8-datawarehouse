{{
  config(
    materialized='table'
  )
}}

with t_data AS (
    SELECT DISTINCT
    `Sales Channel ` AS sales_channel
    FROM
    `vivid-reality-361912.dibimbing.amazon_sale_report`
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'sales_channel'
			]) }} as sales_channel_id, *
FROM t_data