-- 1. All products
SELECT * FROM products;

-- 2. Top 5 most expensive products
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- 3. Products with stock less than 5
SELECT * FROM products WHERE stock < 5;

-- 4. Orders with user and product details
SELECT users.name, orders.id AS order_id, products.name AS product, orders.quantity FROM users INNER JOIN orders ON users.id = orders.user_id INNER JOIN products ON orders.product_id = products.id;

-- 5. Total spent by each user
SELECT users.name, SUM(products.price * orders.quantity) AS total_spent FROM users INNER JOIN orders ON users.id = orders.user_id INNER JOIN products ON orders.product_id = products.id GROUP BY users.name;

-- 6. Users with no orders
SELECT users.name FROM users LEFT JOIN orders ON users.id = orders.user_id WHERE orders.id IS NULL;

-- 7. Total number of orders
SELECT COUNT(*) FROM orders;

-- 8. Top spender
SELECT users.name, SUM(products.price * orders.quantity) AS total_spent FROM users INNER JOIN orders ON users.id = orders.user_id INNER JOIN products ON orders.product_id = products.id GROUP BY users.name ORDER BY total_spent DESC LIMIT 1;
