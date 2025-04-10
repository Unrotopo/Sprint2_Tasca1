USE optic_shop;

SELECT * FROM sales 
WHERE clients_clients_id = 2 
AND YEAR(sales_date) = 2024;

SELECT DISTINCT g.glasses_brand
FROM employees e
JOIN sales s ON e.employees_id = s.employees_employees_id
JOIN sales_has_glasses shg ON s.sales_id = shg.sales_sales_id
JOIN glasses g ON shg.glasses_glasses_id = g.glasses_id
WHERE e.employees_id = 3
  AND YEAR(s.sales_date) = 2024;
  
SELECT 
  s.suppliers_id,
  s.suppliers_name,
  COUNT(shg.glasses_glasses_id) AS total_glasses_sold
FROM suppliers s
JOIN glasses g ON s.suppliers_id = g.suppliers_suppliers_id
JOIN sales_has_glasses shg ON g.glasses_id = shg.glasses_glasses_id
GROUP BY s.suppliers_id, s.suppliers_name
ORDER BY total_glasses_sold DESC;