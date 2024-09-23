{{
  config(
    materialized='table'
  )
}}

WITH t_data AS (
SELECT DISTINCT
  `promotion-ids` AS promotion_ids
FROM
    `vivid-reality-361912.dibimbing.amazon_sale_report`
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'promotion_ids'
			]) }} as promotion_id, *
FROM t_data