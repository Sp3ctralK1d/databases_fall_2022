
INSERT INTO products (id, name, description, price) VALUES ('1', 'Milk', 'Milk is a nutrient-rich, white liquid food produced by the mammary glands of mammals.', 1.5);
UPDATE products
  SET name="Super Milk"
  WHERE id=1;
DELETE FROM products WHERE id=1;