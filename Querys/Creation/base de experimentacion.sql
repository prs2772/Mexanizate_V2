DROP DATABASE IF EXISTS DEMOSTRACION;-- borra la base solo si existe, sino, no da error
CREATE DATABASE DEMOSTRACION;-- crea la base de datos
USE DEMOSTRACION;-- usa la base de datos
 /*
CTRL SHIFT ENTER (EJECUTA TODO) 
CTRL SHIFT ENTER (EJECUTA LO QUE ESTÉ SELECCIONADO)
CTRL ENTER (EJECUTA LA LINEA SELECCIONADA)
 */
CREATE TABLE TABLA_1 (
    VAR_1 INT PRIMARY KEY
);
CREATE TABLE Tabla_1 (
    VAR_1 INT PRIMARY KEY
);
SELECT * FROM TABLA_1; -- select everything 
SELECT * FROM Tabla_1;

/*
comentariototototote
así así bien grandote
pérame, estoy escribiendo practicando
*/
DROP TABLE TABLA_1;
DROP TABLE Tabla_1;-- el nombre de las tablas es sensibles a mayúsculas y acentos

SELECT var_1 from TABLA_1; -- las variables no son sensibles a mayúsculas, el contenido de char no es sensible a acentos ni mayúsculas

CREATE TABLE productos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(40),
    CATEGORIA VARCHAR(20),
    PRECIO DECIMAL(5,2),-- es un decimal de 5 dígitos de los cuales, 2 son flotantes
    STOCK INT           -- "ctrl b" identa la tabla seleccionada
);
DROP TABLE IF EXISTS productos;

INSERT INTO productos (id, nombre, categoria,precio,stock)-- insert sirve para nuevos registros
VALUES
    (1, 'Camiseta', 'Ropa', 20.99,50),
    (2, 'Pantalón', 'Ropa', 39.99,30),
    (3, 'Zapatillas', 'Calzado', 89.99, 20),
    (4, 'Smartphone', 'Electrónicos', 499.99, 10),
    (5, 'Auriculares', 'Electrónicos', 49.99, 15),
    (6, 'Mochila', 'Accesorios', 29.99, 25);
SELECT * FROM productos WHERE caTegOria = 'rOpA';-- los valores de varchar no son sensibles a mayúscula
SELECT NOMBRE, precio FROM productos WHERE precio > 50;-- si no buscarás todos los valores, los separas con comas (,)
SELECT nombre,stock FROM productos WHERE stock <= 20; -- primero se pone el angular (<>) luego el igual (=)
SELECT nombre, precio, stock FROM productos WHERE precio < 100 AND categoria = 'electrOnicos';-- para más de 1 condición, se usa AND
SELECT nombre, stock FROM productos WHERE stock<=30 and stock>=10;-- es opcional dejar un espacio entre la variable, la condición y el valor a comparar

SELECT AVG(PRECIO) AS 'primedio de precios' FROM productos; -- el comando "AS" asigna un alias
SELECT AVG(PRECIO) AS primedio_de_precios FROM productos; -- este y el comando de arriba, son equivalentes
SELECT AVG(PRECIO) AS primedio_de_precios FROM productos WHERE categoria='electronicOs';
SELECT * FROM productos WHERE categoria='electronicOs';

SELECT -- es una subconsulta
(SELECT AVG(PRECIO) AS promedio_de_precios FROM productos WHERE categoria='electronicOs') AS 'Promedio electrónicos', 
(SELECT AVG(PRECIO) AS promedio_de_precios FROM productos WHERE categoria='ropa') AS 'Promedio ropa',
(SELECT AVG(PRECIO) AS promedio_de_precios FROM productos WHERE categoria='calzado') AS 'Promedio calzado';

SELECT categoria, ROUND(AVG(PRECIO),2) AS 'precio promedio', COUNT(CATEGORIA) AS productos-- ROUND sirve para limitar los decimales (valor, número de decimales)
	FROM productos
	GROUP BY CATEGORIA;
    
SELECT COUNT(*) FROM productos;-- muestra todos los registros de la tabla
SELECT COUNT(*) FROM productos WHERE CATEGORIA ='éléctronicos';-- el nombre de la variable es sensible a acentos
SELECT COUNT(DISTINCT categoria) FROM productos;-- muestra cuantos campos distintos hay en la tabla

SELECT count(ID), ROUND(avg(PRECIO),2) from productos;
SELECT ROUND(avg(PRECIO),2) from productos;

/*
CTRL SHIFT (LETRAS)= COSAS BIEN EXTRAÑAS (son caracteres de control)

*/