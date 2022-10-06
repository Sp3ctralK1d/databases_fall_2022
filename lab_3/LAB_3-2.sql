	CREATE TABLE products 
	(
		id VARCHAR UNIQUE,
		name VARCHAR UNIQUE,
		description TEXT,
		price DOUBLE PRECISION,

    PRIMARY KEY (id)
	)		

	CREATE TABLE customers
	(
		id INTEGER NOT NULL UNIQUE,
		full_name VARCHAR(50) NOT NULL,
		timestamp TIMESTAMP NOT NULL,
		delivery_address TEXT NOT NULL,

    PRIMARY KEY (id)
	)

	CREATE TABLE orders
  (
		code INTEGER NOT NULL UNIQUE,
		customer_id INTEGER,
		total_sum DOUBLE PRECISION NOT NULL,
		is_paid BOOLEAN NOT NULL,
  
    PRIMARY KEY (code),
    CONSTRAINT FK_customer_id FOREIGN KEY (customer_id)
      REFERENCES customers (id) MATCH SIMPLE 
      ON UPDATE NO ACTION 
      ON DELETE NO ACTION,
  )

	CREATE TABLE order_items
  (
		order_code INTEGER NOT NULL UNIQUE,
		product_id VARCHAR NOT NULL UNIQUE,
		quantity INTEGER NOT NULL,

    PRIMARY KEY (order_code, product_id),
    CONSTRAINT FK_order_code FOREIGN KEY (order_code)
      REFERENCES orders (code) MATCH SIMPLE 
      ON UPDATE NO ACTION 
      ON DELETE NO ACTION,
    CONSTRAINT FK_product_id FOREIGN KEY (product_id)
      REFERENCES products (id) MATCH SIMPLE 
      ON UPDATE NO ACTION 
      ON DELETE NO ACTION,
  )
