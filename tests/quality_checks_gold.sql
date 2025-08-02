/*
===============================================================================
Gold Layer Quality Checks
===============================================================================
Script Purpose:
    This script performs essential quality checks on the Gold Layer to ensure:
    - Referential integrity across fact and dimension tables.
    - Absence of duplicate primary keys in dimensions.
    - Consistent and complete joins between fact and dimension tables.

Usage Notes:
    - Run these checks after Gold Layer transformations and loading.
    - Review any discrepancies to maintain analytical data integrity.
===============================================================================
*/

-- Check for duplicate primary keys in dim_customers
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- Check for duplicate primary keys in dim_products
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- Check referential integrity: unmatched keys in fact_sales
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p ON p.product_key = f.product_key
WHERE c.customer_key IS NULL 
   OR p.product_key IS NULL;
