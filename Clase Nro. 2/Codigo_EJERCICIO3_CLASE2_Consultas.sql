USE `almacen`;

/* 14.-  Obtener el numero de cajas que hay en cada almac ́en. */

SELECT ALMACENES.Lugar AS 'Almacen',
COUNT(CAJAS.NumRefencia) AS 'Cant.Cajas'
FROM ALMACENES, CAJAS
WHERE CAJAS.Almacen = ALMACENES.Codigo
GROUP BY ALMACENES.Lugar

/* Vaciar el contenido de los almacenes que esta ́n saturados. */

/* Determinar almacenes saturados */
SELECT ALMACENES.Lugar AS 'Almacen',
ALMACENES.Codigo AS 'Codigo',
ALMACENES.Capacidad AS 'Capacidad del almacen',
COUNT(CAJAS.NumRefencia) AS 'Cant.Cajas'
FROM ALMACENES, CAJAS
WHERE CAJAS.Almacen = ALMACENES.Codigo
GROUP BY ALMACENES.Lugar
ORDER BY ALMACENES.Capacidad

/* 15.- Encontrado el almacen, se lo vacia de todas las cajas que tiene */
/* Test = Ver las cajas que se sacaran del almacen */
SELECT CAJAS.Contenido As 'Contenido cajas',
ALMACEN.Lugar AS 'Donde estan Almacenadas'
FROM CAJAS, ALMACENES
WHERE CAJAS.Almacen = ALMACENES.Codigo 
AND CAJAS.Almacen = 3

/* Update -> Se vacia el almacen de saturado. Plus -> se envian las cajas al almacen con mas espacio */
UPDATE CAJAS 
SET CAJAS.Almacen = 3
WHERE CAJAS.Almacen = 2

/* Se lista de nuevo los almacenes */
SELECT ALMACENES.Lugar AS 'Almacen',
COUNT(CAJAS.NumRefencia) AS 'Cant.Cajas'
FROM ALMACENES, CAJAS
WHERE CAJAS.Almacen = ALMACENES.Codigo
GROUP BY ALMACENES.Lugar
