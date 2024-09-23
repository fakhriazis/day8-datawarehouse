{{ config(materialized='table') }}

with t_data AS 
(
SELECT DISTINCT 
  Fulfilment AS fulfilment, 
  COALESCE(`fulfilled-by`,'-') AS fulfilled_by
FROM `vivid-reality-361912.dibimbing.amazon_sale_report` 
)

SELECT 
{{ dbt_utils.generate_surrogate_key([
				'fulfilment', 
				'fulfilled_by'
			])}} AS fulfilment_id,
             *
FROM t_data