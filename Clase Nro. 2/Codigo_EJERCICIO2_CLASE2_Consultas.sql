USE `departamentos`;

/* 8. Obtener todos los datos de los empleados que se apellidan Lopez y los que se apellidan Perez. */

SELECT EMPLEADOS.Nombre AS 'Nombre empleado',
EMPLEADOS.Apellido AS 'Apellido empleado',
EMPLEADOS.DNI AS 'DNI',
DEPARTAMENTOS.Nombre AS 'Departamento'
FROM EMPLEADOS 
LEFT JOIN DEPARTAMENTOS ON EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo
WHERE 
EMPLEADOS.Apellido LIKE 'Lopez' 
OR
EMPLEADOS.Apellido LIKE 'Perez'

/* 9. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77. */

INSERT INTO `DEPARTAMENTOS` (`Codigo`, `Nombre`, `Presupuesto`) 
VALUES 
('37', 'COBRANZA', '28000'), 
('77', 'VENTAS','65000');

INSERT INTO `EMPLEADOS` (`DNI`, `Nombre`, `Apellido`, `Departamento`) 
VALUES 
('32657983', 'Gabriela', 'Vega', '37'), 
('38453984', 'Angela', 'Barrientos', '77'), 
('38342904', 'Robertico', 'Vera Cruz de los Mares', '77')
;

SELECT EMPLEADOS.Nombre AS 'Nombre empleado',
EMPLEADOS.Apellido AS 'Apellido empleado',
EMPLEADOS.DNI AS 'DNI',
DEPARTAMENTOS.Nombre AS 'Departamento'
FROM EMPLEADOS 
LEFT JOIN DEPARTAMENTOS ON EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo
WHERE 
EMPLEADOS.Departamento LIKE '37' 
OR
EMPLEADOS.Departamento LIKE '77'

/* 10. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento. */

SELECT EMPLEADOS.Nombre AS 'Nombre empleado',
EMPLEADOS.Apellido AS 'Apellido empleado',
DEPARTAMENTOS.Nombre AS 'Departamento',
DEPARTAMENTOS.Presupuesto AS 'Presupuesto'
FROM EMPLEADOS 
LEFT JOIN DEPARTAMENTOS ON EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo

/* 11. Obtener los nombres (unicamente los nombres) de los departamentos que tienen mas de dos empleados. */

SELECT DEPARTAMENTOS.Nombre AS 'Departamento'
FROM DEPARTAMENTOS
LEFT JOIN EMPLEADOS ON EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo
GROUP BY DEPARTAMENTOS.Nombre
HAVING COUNT(DEPARTAMENTOS.Codigo) > 2

/* 12. Añadir un nuevo departamento: ‘Calidad’, con presupuesto de 40.000 $ y código. Añadir un empleado vinculado al departamento reci ́en creado: Esther Vazquez, DNI: 89267109 */

INSERT INTO `DEPARTAMENTOS` (`Codigo`, `Nombre`, `Presupuesto`) 
VALUES 
('93', 'CALIDAD', '44000');

INSERT INTO `EMPLEADOS` (`DNI`, `Nombre`, `Apellido`, `Departamento`) 
VALUES 
('89267109', 'Esther', 'Vazquez', '93')
;

/* 13. Aplicar un recorte presupuestario del 10 % a todos los departamentos. */

/* Test */
SELECT DEPARTAMENTOS.Presupuesto, 
(DEPARTAMENTOS.Presupuesto - (DEPARTAMENTOS.Presupuesto / 10)) AS 'desc 10%'
FROM DEPARTAMENTOS

/* Update */
UPDATE DEPARTAMENTOS 
SET DEPARTAMENTOS.Presupuesto = DEPARTAMENTOS.Presupuesto - (DEPARTAMENTOS.Presupuesto / 10) 

/* Consulta */
SELECT DEPARTAMENTOS.Presupuesto
FROM DEPARTAMENTOS

