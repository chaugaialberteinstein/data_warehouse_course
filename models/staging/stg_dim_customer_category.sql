WITH dim_customer_category__source AS (
  SELECT *
  FROM `vit-lam-data.wide_world_importers.sales__customer_categories`
)

, dim_customer_category__remame_column as (
  SELECT
    customer_category_id AS customer_category_key
    , customer_category_name
  FROM dim_customer_category__source
)

, dim_customer_category__cast_type as (
  SELECT 
    CAST(customer_category_key AS INTEGER) AS customer_category_key
    , CAST(customer_category_name AS STRING) AS customer_category_name
    FROM dim_customer_category__remame_column
)

SELECT
  customer_category_key,
  customer_category_name
FROM dim_customer_category__cast_type