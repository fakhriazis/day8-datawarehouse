{{
  config(
    materialized='table'
  )
}}

with t_data AS (
    SELECT DISTINCT
    `ship-service-level` AS ship_service_level,
    `ship-city` AS ship_city,
    `ship-country` AS ship_country,
    `ship-postal-code` AS ship_postal_code,
    `ship-state` AS ship_state,
    `Courier status` AS courier_status
    FROM
        `vivid-reality-361912.dibimbing.amazon_sale_report`
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'ship_service_level',
                'ship_city',
                'ship_country',
                'ship_postal_code',
                'ship_state',
                'courier_status'
			]) }} as sales_shipment_id, *
FROM t_data