
SELECT *
FROM dealer
CROSS JOIN client;


SELECT d.name as dealer_name, c.name as client_name, c.city, c.priority, s.id as sell_id, s.date, s.amount
FROM dealer d
INNER JOIN client c ON d.id = c.dealer_id
INNER JOIN sell s ON s.client_id = c.id


SELECT d.name as dealer_name, c.name as client_name
FROM dealer d
INNER JOIN client c ON d.id = c.dealer_id
WHERE d.location = c.city


SELECT s.id as sell_id, s.amount, c.name as client_name, c.city
FROM sell s
INNER JOIN client c ON s.client_id = c.id
WHERE s.amount BETWEEN 100 AND 500


SELECT d.name as dealer_name
FROM dealer d
LEFT JOIN client c ON d.id = c.dealer_id
GROUP BY d.id
HAVING COUNT(c.id) > 0 OR COUNT(c.id) = 0


SELECT c.name as client_name, c.city, d.name as dealer_name, d.charge as commission
FROM dealer d
INNER JOIN client c ON d.id = c.dealer_id


SELECT c.name as client_name, c.city, d.name as dealer_name, d.charge as commission
FROM dealer d
INNER JOIN client c ON d.id = c.dealer_id
WHERE d.charge > 0.12


SELECT c.name as client_name, c.city, s.id as sell_id, s.date, s.amount, d.name as dealer_name, d.charge as commission
FROM sell s
INNER JOIN client c ON s.client_id = c.id
INNER JOIN dealer d ON s.dealer_id = d.id


SELECT c.name as client_name, c.priority as client_grade, d.name as dealer_name, s.id as sell_id, s.amount
FROM dealer d
INNER JOIN client c ON d.id = c.dealer_id
LEFT JOIN sell s ON s.client_id = c.id
WHERE (COUNT(c.id) > 0 AND s.amount > 2000 AND c.priority IS NOT NULL)
   OR (COUNT(c.id) = 0 AND s.amount IS NULL)
GROUP BY d.id

