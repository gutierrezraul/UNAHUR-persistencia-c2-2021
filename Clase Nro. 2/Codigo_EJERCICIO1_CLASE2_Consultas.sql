USE `deposito`;

/* 1.- Obtener los nombres de los productos de la tienda. */

SELECT ARTICULOS.Codigo AS 'Codigos articulos',
ARTICULOS.Nombre AS 'Nombre producto'
FROM ARTICULOS

/* 2.-  Obtener los nombres y los precios de los productos de la tienda. */

SELECT ARTICULOS.Codigo AS 'Codigos articulos',
ARTICULOS.Nombre AS 'Nombre producto',
ARTICULOS.Precio AS 'Precio'
FROM ARTICULOS

/* 3.- Obtener el nombre de los productos cuyo precio sea menor o igual a 200. */ 

SELECT ARTICULOS.Codigo AS 'Codigos articulos',
ARTICULOS.Nombre AS 'Nombre producto',
ARTICULOS.Precio AS 'Precio'
FROM ARTICULOS
WHERE ARTICULOS.Precio <= 200

/*4. Obtener todos los datos de los artículos cuyo precio esté entre los 60 $ y los 120 $
(ambas cantidades incluidas). */

INSERT INTO `ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) 
VALUES 
('10', 'Perfil hierro 2x2', '80', '1'), 
('11', 'Angulo hierro 1x1', '50', '1'), 
('12', 'Regla plastica', '40', '3'), 
('13', 'Barbijo', '60', '3') 
;

SELECT ARTICULOS.Codigo AS 'Codigos articulos',
ARTICULOS.Nombre AS 'Nombre producto',
ARTICULOS.Precio AS 'Precio'
FROM ARTICULOS
WHERE ARTICULOS.Precio >= 60 AND ARTICULOS.Precio <= 120

/* 5. Obtener el nombre y el precio en dolares (es decir, el precio multiplicado por 100). */

SELECT ARTICULOS.Nombre AS 'Nombre producto',
ARTICULOS.Precio / 100 AS 'Precio en US$'
FROM ARTICULOS


/* 6. Seleccionar el precio medio de todos los productos. */

SELECT AVG(ARTICULOS.Precio) AS 'Precio Promedio ARTICULOS'
FROM ARTICULOS

/* 7. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el
nombre de su fabricante. */

SELECT ARTICULOS.Nombre AS 'Nombre articulo',
ARTICULOS.Precio AS 'Precio',
FABRICANTES.Nombre AS 'Nombre fabricante'
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo


