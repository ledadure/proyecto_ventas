DROP DATABASE IF EXISTS compras_online ; 

CREATE DATABASE compras_online;

USE compras_online;


 -- tabla Producto
CREATE TABLE PRODUCTO (
  IDPEDIDO INT PRIMARY KEY ,
  NOMBRE VARCHAR(100) ,
  DESCRIPCION TEXT ,
  PRECIO DECIMAL(10, 2) ,
  STOCK INT 
);  

 -- tabla Cliente
CREATE TABLE CLIENTE (
  IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT ,
  NOMBRE VARCHAR(100) DEFAULT 'USUARIO_UNKNOW',
  DIRECCION VARCHAR(200) NOT NULL,
  EMAIL VARCHAR(100) UNIQUE NOT NULL
);
  

-- tabla Pedido
CREATE TABLE PEDIDO (
 IDPEDIDO INT PRIMARY KEY AUTO_INCREMENT,
 IDCLIENTE INT,
 FECHAPEDIDO DATE ,
 ESTADO VARCHAR(50) 
);
  

-- tabla Detalles_Pedido
CREATE TABLE DETALLESPEDIDO (
  IDDETALLESPEDIDO INT PRIMARY KEY AUTO_INCREMENT,
  IDPEDIDO INT ,
  IDPRODUCTO INT ,
  CANTIDAD VARCHAR(50) ,
  PRECIOUNITARIO DECIMAL(10, 2) 
);
 
-- tabla Factura
CREATE TABLE FACTURA ( 
IDFACTURA INT PRIMARY KEY AUTO_INCREMENT,
IDPEDIDO INT ,
FECHAFACTURA DATE,
TOTALFACTURA DECIMAL (10, 2)
); 

-- Agregar clave foránea a la tabla Pedidos para referenciar la tabla Clientes
ALTER TABLE Pedido ADD CONSTRAINT fk_pedido FOREIGN KEY (IDCLIENTE)
REFERENCES Cliente (IDCLIENTE);

-- Agregar clave foránea a la tabla DetallesPedido para referenciar la tabla Pedidos
ALTER TABLE DetallesPedido ADD CONSTRAINT fk_detallespedido_pedido
FOREIGN KEY (IDPEDIDO)
REFERENCES Pedido (IDPEDIDO);

-- Agregar clave foránea a la tabla DetallesPedido para referenciar la tabla Productos
ALTER TABLE DetallesPedido ADD CONSTRAINT fk_detallespedido_producto
FOREIGN KEY (IDPRODUCTO)
REFERENCES Producto (IDPRODUCTO);

-- Agregar clave foránea a la tabla Facturas para referenciar la tabla Pedidos
ALTER TABLE Factura ADD CONSTRAINT fk_factura_pedido
FOREIGN KEY (IDPEDIDO)
REFERENCES Pedido (IDPEDIDO);
