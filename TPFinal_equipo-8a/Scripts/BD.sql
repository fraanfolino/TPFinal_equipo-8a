/*CREATE DATABASE ECOMMERCE_P3;
GO
*/
USE ECOMMERCE_P3;
GO
/*
CREATE TABLE direcciones (
    id INT IDENTITY(1,1) PRIMARY KEY,
    calle VARCHAR(255),
    numero VARCHAR(20),
    piso VARCHAR(10),
    departamento VARCHAR(10),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    codigo_postal VARCHAR(20),
    pais VARCHAR(100)
);

CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    direccion_id INT,
    url_imagen_perfil VARCHAR(255),
    es_admin BIT DEFAULT 0,
    fecha_nacimiento DATE,
    creado_en DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (direccion_id) REFERENCES direcciones(id) ON DELETE SET NULL
);

CREATE TABLE categorias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE marcas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE productos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    marca_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (marca_id) REFERENCES marcas(id)
);

CREATE TABLE talles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    etiqueta VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE producto_talle (
    producto_id INT,
    talle_id INT,
    cantidad INT DEFAULT 0,
    PRIMARY KEY (producto_id, talle_id),
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    FOREIGN KEY (talle_id) REFERENCES talles(id) ON DELETE CASCADE
);

CREATE TABLE imagenes_productos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    producto_id INT NOT NULL,
    url_imagen VARCHAR(255) NOT NULL,
    es_principal BIT DEFAULT 0,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
);

CREATE TABLE pedidos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES usuarios(id)
);

CREATE TABLE pedido_detalle (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);


INSERT INTO categorias (nombre) VALUES 
('Zapatillas'), 
('Buzos'), 
('Remeras');

INSERT INTO marcas (nombre) VALUES 
('Nike'), 
('Adidas'), 
('Vans'), 
('Puma'), 
('Reebok');

INSERT INTO talles (etiqueta) VALUES
('38'), ('39'), ('40'), ('41'), ('42'), ('43'), ('44'), ('45');

INSERT INTO talles (etiqueta) VALUES
('S'), ('M'), ('L'), ('XL');


INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Puma Ferrari', 'Zapatillas Puma Ferrari Tiburion Roja', 122.14, 1, 4);
INSERT INTO imagenes_productos (producto_id, url_imagen, es_principal) VALUES (1, 'https://media2.solodeportes.com.ar/media/catalog/product/cache/7c4f9b393f0b8cb75f2b74fe5e9e52aa/z/a/zapatillas-puma-ferrari-tiburion-roja-640010307234002-1.jpg', 0);
INSERT INTO imagenes_productos (producto_id, url_imagen, es_principal) VALUES (1, 'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-puma-ferrari-tiburion-roja-640010307234002-6.jpg', 0);
INSERT INTO imagenes_productos (producto_id, url_imagen, es_principal) VALUES (1, 'https://media2.solodeportes.com.ar/media/catalog/product/cache/3cb7d75bc2a65211451e92c5381048e9/z/a/zapatillas-puma-ferrari-tiburion-roja-640010307234002-7.jpg', 0);

INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Street Pro', 'Zapatilla deportiva modelo Zapatilla Street Pro', 165.50, 1, 4);



INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Air Max Evo', 'Zapatilla deportiva modelo Zapatilla Air Max Evo', 118.15, 1, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Classic Drive', 'Zapatilla deportiva modelo Zapatilla Classic Drive', 124.43, 1, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Urban Walk', 'Zapatilla deportiva modelo Zapatilla Urban Walk', 101.80, 1, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Flex Zoom', 'Zapatilla deportiva modelo Zapatilla Flex Zoom', 138.81, 1, 4);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Retro Kick', 'Zapatilla deportiva modelo Zapatilla Retro Kick', 138.87, 1, 2);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Storm Glide', 'Zapatilla deportiva modelo Zapatilla Storm Glide', 158.80, 1, 5);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Swift Bolt', 'Zapatilla deportiva modelo Zapatilla Swift Bolt', 100.94, 1, 4);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Zapatilla Trail King', 'Zapatilla deportiva modelo Zapatilla Trail King', 175.46, 1, 1);

INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Invierno Soft', 'Buzo abrigado modelo Buzo Invierno Soft', 78.30, 2, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Hoodie Classic', 'Buzo abrigado modelo Buzo Hoodie Classic', 76.26,2, 5);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Termal Pro', 'Buzo abrigado modelo Buzo Termal Pro', 79.72, 2, 2);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Urban Fit', 'Buzo abrigado modelo Buzo Urban Fit', 61.50, 2, 4);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Relax Max', 'Buzo abrigado modelo Buzo Relax Max', 74.31, 2, 2);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Comfort Zip', 'Buzo abrigado modelo Buzo Comfort Zip', 66.85, 2, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Style Edge', 'Buzo abrigado modelo Buzo Style Edge', 75.41, 2, 5);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Polar Wind', 'Buzo abrigado modelo Buzo Polar Wind', 75.51, 2, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Urban Heat', 'Buzo abrigado modelo Buzo Urban Heat', 76.28, 2, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Buzo Cosy Chill', 'Buzo abrigado modelo Buzo Cosy Chill', 68.83, 2, 3);

INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Remera Summer Breeze', 'Remera liviana modelo Remera Summer Breeze', 30.01, 3, 2);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Remera Casual Fit', 'Remera liviana modelo Remera Casual Fit', 33.99, 3, 4);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Remera Training Cool', 'Remera liviana modelo Remera Training Cool', 36.08, 3, 2);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Remera Urban Basic', 'Remera liviana modelo Remera Urban Basic', 46.13, 3, 5);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Remera Style Tee', 'Remera liviana modelo Remera Style Tee', 37.68, 3, 4);
INSERT INTO productos (nombre, descripcion, precio, categoria_id, marca_id) VALUES ('Remera Light Vibe', 'Remera liviana modelo Remera Light Vibe', 45.95, 3, 1);



-- Supongamos que productos ID del 1 al 10 son zapatillas
-- Talles del 1 al 8 son numéricos: 38, 39, 40, 41, 42, 43, 44, 45

INSERT INTO producto_talle (producto_id, talle_id, cantidad)
VALUES
-- Producto 1
(1, 1, 10), (1, 2, 10), (1, 3, 10), (1, 4, 10), (1, 5, 10), (1, 6, 10), (1, 7, 10), (1, 8, 10),
-- Producto 2
(2, 1, 10), (2, 2, 10), (2, 3, 10), (2, 4, 10), (2, 5, 10), (2, 6, 10), (2, 7, 10), (2, 8, 10),
-- Producto 3
(3, 1, 10), (3, 2, 10), (3, 3, 10), (3, 4, 10), (3, 5, 10), (3, 6, 10), (3, 7, 10), (3, 8, 10),
-- Producto 4
(4, 1, 10), (4, 2, 10), (4, 3, 10), (4, 4, 10), (4, 5, 10), (4, 6, 10), (4, 7, 10), (4, 8, 10),
-- Producto 5
(5, 1, 10), (5, 2, 10), (5, 3, 10), (5, 4, 10), (5, 5, 10), (5, 6, 10), (5, 7, 10), (5, 8, 10),
-- Producto 6
(6, 1, 10), (6, 2, 10), (6, 3, 10), (6, 4, 10), (6, 5, 10), (6, 6, 10), (6, 7, 10), (6, 8, 10),
-- Producto 7
(7, 1, 10), (7, 2, 10), (7, 3, 10), (7, 4, 10), (7, 5, 10), (7, 6, 10), (7, 7, 10), (7, 8, 10),
-- Producto 8
(8, 1, 10), (8, 2, 10), (8, 3, 10), (8, 4, 10), (8, 5, 10), (8, 6, 10), (8, 7, 10), (8, 8, 10),
-- Producto 9
(9, 1, 10), (9, 2, 10), (9, 3, 10), (9, 4, 10), (9, 5, 10), (9, 6, 10), (9, 7, 10), (9, 8, 10),
-- Producto 10
(10, 1, 10), (10, 2, 10), (10, 3, 10), (10, 4, 10), (10, 5, 10), (10, 6, 10), (10, 7, 10), (10, 8, 10);


-- Buzos
INSERT INTO producto_talle (producto_id, talle_id, cantidad)
VALUES
(11, 9, 10), (11, 10, 10), (11, 11, 10), (11, 12, 10),
(12, 9, 10), (12, 10, 10), (12, 11, 10), (12, 12, 10),
(13, 9, 10), (13, 10, 10), (13, 11, 10), (13, 12, 10),
(14, 9, 10), (14, 10, 10), (14, 11, 10), (14, 12, 10),
(15, 9, 10), (15, 10, 10), (15, 11, 10), (15, 12, 10),
(16, 9, 10), (16, 10, 10), (16, 11, 10), (16, 12, 10),
(17, 9, 10), (17, 10, 10), (17, 11, 10), (17, 12, 10),
(18, 9, 10), (18, 10, 10), (18, 11, 10), (18, 12, 10),
(19, 9, 10), (19, 10, 10), (19, 11, 10), (19, 12, 10),
(20, 9, 10), (20, 10, 10), (20, 11, 10), (20, 12, 10);

-- Remeras
INSERT INTO producto_talle (producto_id, talle_id, cantidad)
VALUES
(21, 9, 10), (21, 10, 10), (21, 11, 10), (21, 12, 10),
(22, 9, 10), (22, 10, 10), (22, 11, 10), (22, 12, 10),
(23, 9, 10), (23, 10, 10), (23, 11, 10), (23, 12, 10),
(24, 9, 10), (24, 10, 10), (24, 11, 10), (24, 12, 10),
(25, 9, 10), (25, 10, 10), (25, 11, 10), (25, 12, 10),
(26, 9, 10), (26, 10, 10), (26, 11, 10), (26, 12, 10);

------------------------------------------------------------------------------------------------


-------------------------------PROCEDIMIENTO ALMACENADO-------------------------
*/

CREATE OR ALTER PROCEDURE dbo.sp_ObtenerProductoDetalle
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
         p.id AS Id,
         p.nombre AS Nombre,
         p.descripcion AS Descripcion,
         p.precio AS Precio,
         ip.url_imagen AS UrlImagen
    FROM productos p
        LEFT JOIN imagenes_productos ip ON ip.producto_id = p.id
    WHERE p.id = @id;
END;

CREATE OR ALTER PROCEDURE dbo.sp_FiltrarProductosPorMarca
    @marca VARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.id AS Id,
        p.nombre AS Nombre,
        p.descripcion AS Descripcion,
        p.precio AS Precio,
        c.nombre AS Categoria,
        m.nombre AS Marca,
        ip.url_imagen AS UrlImagen
    FROM productos p
        LEFT JOIN categorias c ON p.categoria_id = c.id
        LEFT JOIN marcas m ON p.marca_id = m.id
        LEFT JOIN imagenes_productos ip ON ip.producto_id = p.id
    WHERE 

        (@marca IS NULL OR @marca = '' OR m.nombre = @marca)
        AND EXISTS (
            SELECT 1 
            FROM producto_talle pt
            WHERE pt.producto_id = p.id 
              AND pt.cantidad > 0
        )
    ORDER BY p.id, ip.es_principal DESC, ip.id;
END;


CREATE OR ALTER PROCEDURE sp_ListarProductosConStock
AS
BEGIN
    SELECT 
        p.id AS Id,
        p.nombre AS Nombre,
        p.descripcion AS Descripcion,
        p.precio AS Precio,
        c.nombre AS Categoria,
        m.nombre AS Marca,
        ip.url_imagen AS UrlImagen
    FROM productos p
    -- Traer categoría y marca aunque sean nulas
    LEFT JOIN categorias c ON p.categoria_id = c.id
    LEFT JOIN marcas m ON p.marca_id = m.id
    -- Traer todas las imágenes (si hay)
    LEFT JOIN imagenes_productos ip ON ip.producto_id = p.id
    -- Filtrar solo los productos con stock (en cualquier talle)
    WHERE EXISTS (
        SELECT 1
        FROM producto_talle pt
        WHERE pt.producto_id = p.id AND pt.cantidad > 0
    )
    ORDER BY p.id, ip.es_principal DESC, ip.id;
END;






------LIIMPPIAR TODA LA BD-------

--DELETE FROM pedido_detalle;
--DELETE FROM pedidos;
--DELETE FROM imagenes_productos;
--DELETE FROM producto_talle;
--DELETE FROM productos;
--DELETE FROM marcas;
--DELETE FROM categorias;
--DELETE FROM talles;
--DELETE FROM usuarios;
--DELETE FROM direcciones;

---- RESET DE IDENTITY SOLO EN TABLAS QUE LO USAN
--DBCC CHECKIDENT ('pedido_detalle', RESEED, 0);
--DBCC CHECKIDENT ('pedidos', RESEED, 0);
--DBCC CHECKIDENT ('imagenes_productos', RESEED, 0);
---- producto_talle NO tiene IDENTITY, no hacer CHECKIDENT
--DBCC CHECKIDENT ('productos', RESEED, 0);
--DBCC CHECKIDENT ('marcas', RESEED, 0);
--DBCC CHECKIDENT ('categorias', RESEED, 0);
--DBCC CHECKIDENT ('talles', RESEED, 0);
--DBCC CHECKIDENT ('usuarios', RESEED, 0);
--DBCC CHECKIDENT ('direcciones', RESEED, 0);

-------------------------------------------
*/
SELECT * FROM TALLES

SELECT 
    p.id AS producto_id,
    p.nombre AS producto_nombre,
    p.descripcion AS producto_descripcion,
    c.nombre AS categoria,
    m.nombre AS marca,
    t.etiqueta AS talle,
    pt.cantidad AS stock
FROM productos p
LEFT JOIN categorias c ON p.categoria_id = c.id
LEFT JOIN marcas m ON p.marca_id = m.id
LEFT JOIN producto_talle pt ON p.id = pt.producto_id
LEFT JOIN talles t ON pt.talle_id = t.id
ORDER BY p.id, t.id;