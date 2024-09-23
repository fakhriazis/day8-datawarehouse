{{
  config(
    materialized='table'
  )
}}

with t_data AS (
    SELECT DISTINCT
    `ORDER ID` AS order_id,
    Date AS date,
    {{ dbt_utils.generate_surrogate_key([
				'SKU'
			]) }} as product_id,
    {{ dbt_utils.generate_surrogate_key([
				'Fulfilment', 
				'`fulfilled-by`'
			])}} AS fulfilment_id,
    {{ dbt_utils.generate_surrogate_key([
				'`promotion-ids`'
			]) }} as promotion_id,
    {{ dbt_utils.generate_surrogate_key([
				        '`ship-service-level`',
                '`ship-city`',
                '`ship-country`',
                '`ship-postal-code`',
                '`ship-state`',
                '`Courier Status`'
			]) }} as sales_shipment_id,
    {{ dbt_utils.generate_surrogate_key([
				'`Sales Channel `'
			]) }} as sales_channel_id,
    Qty AS qty,
    Amount AS amount
    FROM
    `vivid-reality-361912.dibimbing.amazon_sale_report`
)

SELECT *
FROM t_data
LIMIT 100