CREATE VIEW client_orders_by_date AS
SELECT COUNT(DISTINCT c.id) as num_clients, AVG(s.amount) as avg_purchase, SUM(s.amount) as total_purchase, s.date
FROM client c
INNER JOIN sell s ON s.client_id = c.id
GROUP BY s.date


CREATE VIEW top_sell_dates AS
SELECT s.date, SUM(s.amount) as total_sell
FROM sell s
GROUP BY s.date
ORDER BY total_sell DESC
LIMIT 5


CREATE VIEW dealer_sales AS
SELECT d.name as dealer_name, COUNT(s.id) as num_sales, AVG(s.amount) as avg_sale, SUM(s.amount) as total_sales
FROM dealer d
INNER JOIN sell s ON s.dealer_id = d.id
GROUP BY d.id


CREATE VIEW dealer_earnings_by_location AS
SELECT d.location, SUM(s.amount * d.charge) as earnings
FROM dealer d
INNER JOIN sell s ON s.dealer_id = d.id
GROUP BY d.location


CREATE VIEW dealer_sales_by_location AS
SELECT d.location, COUNT(s.id) as num_sales, AVG(s.amount) as avg_sale, SUM(s.amount) as total_sales
FROM dealer d
INNER JOIN sell s ON s.dealer_id = d.id
GROUP BY d.location


CREATE VIEW client_expenses_by_city AS
SELECT c.city, COUNT(s.id) as num_sales, AVG(s.amount) as avg_expense, SUM(s.amount) as total_expenses
FROM client c
INNER JOIN sell s ON s.client_id = c.id
GROUP BY c.city


CREATE VIEW cities_with_high_expenses AS
SELECT c.city, SUM(s.amount) as total_expenses, SUM(s2.amount) as total_sales
FROM client c
INNER JOIN sell s ON s.client_id = c.id
INNER JOIN dealer d ON s.dealer_id = d.id
INNER JOIN sell s2 ON s2.
