USE pizzeria;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO region (region_name) VALUES
('Barcelona'), 
('Galicia'), 
('Madrid');

INSERT INTO city (city_name, region_region_id) VALUES 
('Barcelona', 1), 
('Pontevedra', 2), 
('Santiago', 2), 
('Madrid', 3);

INSERT INTO `client` (client_name, client_surname, client_address, client_zip_code, client_phone, city_city_id) VALUES 
('Antonio', 'Losada', 'Rua Sumidoiro 23', '36630', '54236578', 2), 
('Manuela', 'Prado', 'Rua Quintana 12', '36631', '23415357', 3), 
('Lourdes', 'García', 'Calle Señorial 1', '28042', '98765478', 4), 
('Miquel', 'Pujol', 'Carrer Indepe 99', '08001', '786523453', 1);

INSERT INTO shop (shop_address, shop_zip_code, city_city_id) VALUES 
('Carrer Formatge', '08002', 1), 
('Rua Ceive', '36630', 2), 
('Rua Libertade Carallo', '36631', 3),
('Carrer Diners', '08004', 4);

INSERT INTO employee (employee_name, employee_surname, employee_id_num, employee_phone, employee_position, shop_shop_id) VALUES 
('Alicia', 'Pons', '000012', '34556752', 'cook', 1), 
('Alicio', 'Pons', '000013', '34652365', 'delivery', 1), 
('Marcos', 'Marquez', '000008', '23456787', 'cook', 2), 
('Alejandra', 'Ramirez', '000002', '42367342', 'delivery', 2), 
('Jose Antonio', 'Portas', '000016', '23468435', 'cook', 3), 
('Benitiño', 'Montero', '000078', '34762385', 'delivery', 3), 
('Amancio', 'Menudo', '000001', '43575257', 'cook', 4), 
('Alejandra', 'Rubianes', '000043', '43762387', 'delivery', 4);

INSERT INTO pizza_category (pizza_category_name) VALUES
('Clásica'), 
('Especialidad'), 
('Pascua');

INSERT INTO products (products_name, products_description, products_picture, products_price, products_type, pizza_category_pizza_category_id) VALUES 
('Margarita', 'Tomate, mozarella, albahaca', 'margarita.png', 8.90, 'pizzas', 1),
('Diavola', 'Tomate, salami picante, mozarella', 'diavola.png', 9.90, 'pizzas', 1), 
('Hawaiana', 'Tomate, jamon, piña, mozarella', 'hawainana.png', 10.40, 'pizzas', 2),
('Mona', 'Chocolate y muñecos', 'mona.png', 12.99, 'pizzas', 3), 
('AfriKola', 'Refresco de cola', 'afrikola.png', 2.30, 'drinks', NULL),
('Cheese burger', 'Hamburguesa con queso', 'burger.png', 12.00, 'burguers', NULL);

INSERT INTO `order` (order_creation, order_type, order_price, client_client_id, employee_employee_id, shop_shop_id) VALUES 
('2025-04-20 12:46:00', 'take_away', 12.20, 1, 4, 2),
('2025-04-21 12:48:00', 'restaurant', 20.30, 2, 5, 3), 
('2025-04-20 12:50:00', 'restaurant', 24.19, 4, 1, 1);

INSERT INTO order_uniques (order_uniques_amount, order_uniques_price, products_products_id, order_order_id) VALUES 
(1, 8.90, 1, 1), 
(1, 2.30, 5, 1), 
(1, 9.90, 2, 2), 
(1, 10.40, 3, 2),
(1, 12.99, 4, 3),
(1, 2.30, 5, 3), 
(1, 8.90, 1, 3);

SET FOREIGN_KEY_CHECKS = 1;