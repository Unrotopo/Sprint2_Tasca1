USE pizzeria;

SELECT SUM(ou.order_uniques_amount) AS total_begudes
FROM products p
INNER JOIN order_uniques ou ON p.products_id = ou.products_products_id
INNER JOIN `order` o ON ou.order_order_id = o.order_id
INNER JOIN client c ON o.client_client_id = c.client_id
INNER JOIN city ci ON c.city_city_id = ci.city_id
WHERE p.products_type = 'drinks' AND ci.city_name = 'Barcelona';


SELECT COUNT(*) AS total_comandes
FROM `order`
WHERE employee_employee_id = 1;