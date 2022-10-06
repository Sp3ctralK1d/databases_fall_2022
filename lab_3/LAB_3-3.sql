CREATE TABLE products 
(
  id INTEGER,
  
  
  id VARCHAR UNIQUE,
  name VARCHAR UNIQUE,
  description TEXT,
  price DOUBLE PRECISION,

  PRIMARY KEY (id),
  CONSTRAINTS
)		