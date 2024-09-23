{{
  config(
    materialized='table'
  )
}}

SELECT 
  dp.category,
  COUNT(dp.category) AS total_category
FROM 
  `vivid-reality-361912.dibimbing.fact_salesorder` fs
LEFT JOIN
  `vivid-reality-361912.dibimbing.dim_product` dp on dp.product_id=fs.product_id
GROUP BY
  dp.category
ORDER BY
  total_category DESC
LIMIT 1000