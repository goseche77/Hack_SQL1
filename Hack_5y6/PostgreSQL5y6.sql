CREATE TABLE countries (
  id_country serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL
  );

CREATE TABLE roles (
  id_role serial PRIMARY KEY,
  name VARCHAR (30) NOT NULL
  );

CREATE TABLE customers (
  email varchar (70) PRIMARY key,
  id_country INTEGER not NULL, 
  id_role INTEGER not NULL,
  name VARCHAR (50) not NULL,
  age INTEGER not NULL,
  PASSWORD varchar (100),
  physical_address VARCHAR (250) NOT NULL,
  FOREIGN KEY (id_country) REFERENCES countries (id_country),
  FOREIGN KEY (id_role) REFERENCES roles(id_role)
  );

CREATE TABLE taxes (
  id_tax serial PRIMARY KEY,
  percentage DECIMAL(5,2) NOT NULL
  );

CREATE TABLE offers (
    id_offer SERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE discounts (
    id_discount SERIAL PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    percentage DECIMAL(5, 2) NOT NULL
  );

CREATE TABLE payments (
    id_payment SERIAL PRIMARY KEY,
    id_customer VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customers (email) ON DELETE CASCADE
);
  
CREATE TABLE invoice_status (
  id_invoice_status SERIAL PRIMARY KEY,
  status VARCHAR(50) NOT NULL
  );
  
CREATE TABLE products (
  id_product serial PRIMARY key,
  id_discount INTEGER not NULL,
  id_offer INTEGER not NULL,
  id_tax INTEGER not NULL,
  name VARCHAR(100),
  DETAIL varchar(100),
  minimun_stock INTEGER not NULL,
  maximun_stock INTEGER not NULL,
  current_stock INTEGER not NULL,
  price DECIMAL (5,2) NOT NULL,
  price_with_tax DECIMAL (5,2) not NULL,
  FOREIGN KEY (id_discount) REFERENCES discounts (id_discount),
  FOREIGN key (id_tax) REFERENCES taxes (id_tax),
  FOREIGN key (id_offer) REFERENCES offers (id_offer)
);  
  
  CREATE TABLE product_customers (
    id_product INTEGER,
    email VARCHAR(100),
    FOREIGN KEY (id_product) REFERENCES products (id_product) ON DELETE CASCADE,
    FOREIGN KEY (email) REFERENCES customers (email) ON DELETE CASCADE,
    PRIMARY KEY (id_product, email)
);
  
 CREATE TABLE invoices (
    id_invoice SERIAL PRIMARY KEY,
    id_customer VARCHAR(100) NOT NULL,
    id_payment_status INTEGER NOT NULL,
    date DATE NOT NULL,
    total_to_pay DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customers (email) ON DELETE CASCADE,
    FOREIGN KEY (id_payment_status) REFERENCES invoice_status (id_invoice_status)
); 
  
CREATE TABLE orders (
    id_order SERIAL PRIMARY KEY,
    id_invoice INTEGER NOT NULL,
    id_product INTEGER NOT NULL,
    detail TEXT,
    amount INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_invoice) REFERENCES invoices (id_invoice) ON DELETE CASCADE,
    FOREIGN KEY (id_product) REFERENCES products (id_product)
);
  
  INSERT INTO countries (name) VALUES
    ('USA'),
    ('Venezuela'),
    ('Italia');
  
  SELECT * from countries
  
  
  INSERT INTO roles (name) VALUES
    ('admin'),
    ('user_advanced'),
    ('user_read');
  
  SELECT * from roles
  
  INSERT INTO taxes (percentage) VALUES
    (5.00),
    (12.00),
    (15.00);

 sELECT * FROM taxes;
  
INSERT INTO offers (status) VALUES
    ('oferta_del_mes'),
    ('oferta_del_dia');
  
  SELECT * FROM offers;
  
  INSERT INTO discounts (status, percentage) VALUES
    ('inactivo', 5.00),
    ('activo', 12.00),
    ('activo', 15.00);
  
  SELECT * FROM discounts;
  
  INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address) VALUES
    ('goseche@kmg.com', 1, 1, 'Gustavo', 38, 'phenom16', 'El doral Miami, USA'),
    ('kgutierrez@kmg.com', 2, 2, 'Kendy', 31, 'mathy123', 'calle el kinder, Venezuela'),
    ('moseche@kmg.com', 3, 3, 'Mathias', 18, 'android16', 'calle roma, Italia');
  
  SELECT * FROM customers;
  
 INSERT INTO payments (id_customer, type) VALUES
    ('goseche@kmg.com', 'Zinli'),
    ('kgutierrez@kmg.com', 'PayPal'),
    ('moseche@kmg.com', 'Binance');
  
  SELECT * FROM payments;
  
INSERT INTO invoice_status (status) VALUES
    ('pendiente'),
    ('pagado'),
    ('cancelado');  
  
SELECT * FROM invoice_status;
  
 INSERT INTO products (id_discount, id_tax, id_offer, name, detail, minimun_stock, maximun_stock, current_stock, price, price_with_tax) VALUES
    (1, 1, 1, 'Producto 1', 'Detalles del producto 1', 15, 90, 70, 150.00, 150.00),
    (2, 2, 1, 'Producto 2', 'Detalles del producto 2', 25, 60, 40, 230.00, 207.00),
    (3, 3, 2, 'Producto 3', 'Detalles del producto 3', 10, 300, 150, 400.00, 336.00);
    
    SELECT * FROM products;
  
 INSERT INTO product_customers (id_product, email) VALUES
    (1, 'goseche@kmg.com'),
    (2, 'kgutierrez@kmg.com'),
    (3, 'moseche@kmg.com'); 
  
  SELECT * FROM product_customers;
  
 INSERT INTO invoices (id_customer, id_payment_status, date, total_to_pay) VALUES
    ('goseche@kmg.com', 1, '2024-07-03', 150.00),
    ('kgutierrez@kmg.com', 2, '2024-09-02', 230.00),
    ('moseche@kmg.com', 3, '2024-07-01', 400.00); 
  
  SELECT * FROM invoices;
  
  INSERT INTO orders (id_invoice, id_product, detail, amount, price) VALUES
    (1, 1, 'Orden de producto 1', 1, 150.00),
    (2, 2, 'Orden de producto 2', 2, 230.00),
    (3, 3, 'Orden de producto 3', 3, 400.00);
  
  SELECT * FROM orders;

  DELETE FROM customers
WHERE email = (SELECT email FROM customers ORDER BY email DESC LIMIT 1);
  
 SELECT * FROM customers; 
  
 UPDATE customers
SET name = 'Nancy Campomas Actualizado', password = 'beatriz123', physical_address = 'El doral, Miami, USA'
WHERE email = (SELECT email FROM customers ORDER BY email DESC LIMIT 1); 
 
  UPDATE taxes
SET percentage = percentage + 1.00;

 SELECT * FROM taxes; 
  
UPDATE products
SET price = price * 1.10,
    price_with_tax = price_with_tax * 1.10;  
    
 SELECT * FROM products; 