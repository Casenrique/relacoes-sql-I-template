-- Active: 1673873325786@@127.0.0.1@3306


-- Práticas 1 e 2 - 1 para muitos

create Table users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

create Table phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (id, name, email, password)
VALUES 
    ("u001", "Pedro Maia", "pedro@email.com", "P3dro"),
    ("u002", "Carlos Bergson", "carlos@email.com", "B3rg$on");

INSERT INTO phones (id, phone_number, user_id)
VALUES 
    ("p001", "554891111111", "u002"),
    ("p002", "554892222222", "u002"),
    ("p003", "559293333333", "u001");

DELETE FROM phones
WHERE user_id = "u003"

DROP Table users;


DROP Table phones;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

-- Prática 3 - 1 para 1

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number, category)
VALUES
    ("l001", "11111111111", "A"),
    ("l002", "22222222222", "AB");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ("d001", "João Victor", "joão@email.com", "jo4op4o", "l001"),
    ("d002", "Ruan Patrick", "ruan@email.com", "trigr3Rp", "l002");

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;


-- Fixação

CREATE TABLE brands (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE products (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL,
    price REAL NOT NULL,
    brand_id TEXT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brands (id)
);

INSERT INTO brands (id, name)
VALUES
    ("b001", "Nike"),
    ("b002", "Asics"),
    ("b003", "Adidas");

INSERT INTO products (id, name, price, brand_id)
VALUES
    ("p001", "Nike Shox Nz", 109.99, "b001"),
    ("p002", "Tênis SHX Four Premium", 239.90, "b001"),
    ("p003", "TÊNIS ULTRABOOST 22", 899.99, "b003"),
    ("p004", "Tênis Asics Gel Nimbus 24", 1099.90, "b002"),
    ("p005", "Tênis Asics Gel-rocket 10", 499.00, "b002");
   
SELECT * FROM products
INNER JOIN brands
ON products.brand_id = brands.id;

DROP Table brands;

DROP Table products;