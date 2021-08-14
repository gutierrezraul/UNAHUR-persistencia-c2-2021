USE `DBRRHH-sueldos`;

/* 1.- Obtener los datos completos de los empleados. */
SELECT empleados.nDIEmp AS 'Codigo empleado',
empleados.nomEmp AS 'Nombre empleado',
empleados.sexEmp AS 'Sexo',
empleados.fecNac AS 'Fecha nacimiento',
empleados.fecIncorporacion AS 'Fecha incorpora.',
empleados.salEmp AS 'Salario',
empleados.comisionE AS 'Comision',
empleados.cargoE AS 'Cargo',
empleados.jefeID AS 'codigo del Jefe',
empleados.codDepto AS 'codigo Depto.' 
FROM empleados

/* 2.-  Listar el nombre de los departamentos. */

SELECT departamentos.nombreDpto AS 'Nombre de deptos.'
FROM departamentos

/* 3.- Obtener el nombre y cargo de todos los empleados, ordenado por salario. */ 

SELECT empleados.nomEmp AS 'Nombre empleado',
empleados.cargoE AS 'Cargo', empleados.salEmp AS 'Salario'
FROM empleados 
ORDER BY empleados.salEmp

/*4. Obtener la lista de los empleados que ganan una comisión superior a su sueldo. */

SELECT empleados.nomEmp AS 'Nombre empleado',
empleados.cargoE AS 'Cargo',
empleados.salEmp AS 'Salario',
empleados.comisionE AS 'Comision'
FROM empleados 
WHERE empleados.comisionE > empleados.salEmp
ORDER BY empleados.salEmp

/* 5. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo. */

SELECT empleados.nomEmp AS 'Nombre empleado',
empleados.cargoE AS 'Cargo',
empleados.salEmp AS 'Salario',
empleados.comisionE AS 'Comision'
FROM empleados 
WHERE empleados.comisionE <= empleados.salEmp * 0.30
ORDER BY empleados.salEmp

/* 6. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango). Liste estos empleados y su cargo por orden alfabético. */
/* Nota: se agregan empleados a efectos de mejorar el resultado. */
INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) 
VALUES ('1006', 'DANIEL SANTORO', 'M', '1973-06-01', '2020-12-01', '650000', '19800', 'Administrativo', '1003', '0002');
INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) 
VALUES ('1007', 'DARIO HORNADO', 'M', '1987-07-20', '2021-03-15', '660000', '19800', 'Deposito', '1001', '0003');

SELECT empleados.nomEmp AS 'Nombre empleado',
empleados.cargoE AS 'Cargo'
FROM empleados 
WHERE empleados.nomEmp >= 'J' AND empleados.nomEmp <= 'Z'
ORDER BY empleados.cargoE ASC

/* 7. Hallar los empleados cuyo nombre no contiene la cadena “MA” */

SELECT empleados.nomEmp AS 'Nombre empleado',
empleados.cargoE AS 'Cargo'
FROM empleados 
WHERE empleados.nomEmp NOT LIKE '%MA%';

/* 8. Listar los datos de los empleados cuyo nombre inicia por la letra ‘M’, su salario es mayor a
$800.000 o reciben comisión y trabajan para el departamento de ‘VENTAS’ */

INSERT INTO `departamentos` (`codDepto`, `nombreDpto`, `ciudad`, `codDirector`) VALUES ('0004', 'Ventas', 'CABA', NULL);

INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('1008', 'MARCELO MORALES', 'M', '1963-10-19', '2019-12-01', '850000', '0', 'Jefe ventas', NULL, '0004');

INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('1009', 'MARIO CORRALES', 'M', '1967-07-29', '2019-12-01', '520000', '100000', 'Ventas', NULL, '0004');

INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('1010', 'SERGIO CORRALES', 'M', '1969-11-09', '2020-01-04', '800000', '0', 'Ventas', NULL, '0004');

SELECT empleados.nDIEmp AS 'Codigo empleado',
empleados.nomEmp AS 'Nombre empleado',
empleados.sexEmp AS 'Sexo',
empleados.fecNac AS 'Fecha nacimiento',
empleados.fecIncorporacion AS 'Fecha incorpora.',
empleados.salEmp AS 'Salario',
empleados.comisionE AS 'Comision',
empleados.cargoE AS 'Cargo',
empleados.jefeID AS 'codigo del Jefe',
empleados.codDepto AS 'codigo Depto.' 
FROM empleados
WHERE empleados.nomEmp LIKE 'M%' 
AND empleados.salEmp > 800000 OR empleados.comisionE > 0
AND empleados.codDepto = 0004 

/* 9. Mostrar el salario más alto de la empresa. */

SELECT empleados.nomEmp AS 'Nombre empleado',
empleados.cargoE AS 'Cargo',
MAX(empleados.salEmp) AS 'Salario'
FROM empleados 

/* 10. Hallar el salario más alto, el más bajo y la diferencia entre ellos. */

SELECT MAX(empleados.salEmp) AS 'Salario mas alto',
MIN(empleados.salEmp) AS 'Salario mas bajo',
MAX(empleados.salEmp) - MIN(empleados.salEmp) AS 'Deferencia'
FROM empleados

/* 11. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento. */

SELECT departamentos.nombreDpto,
empleados.sexEmp, 
COUNT(empleados.sexEmp) AS 'Empleados'
FROM departamentos,empleados 
WHERE departamentos.codDepto = empleados.codDepto
GROUP BY departamentos.nombreDpto, empleados.sexEmp

/* 12. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de
esos departamentos. */

INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('1011', 'GERMAN LUX', 'M', '1990-04-24', '2018-03-01', '95000', '35000', 'Ventas', '1008', '0004');

SELECT departamentos.nombreDpto,
COUNT(empleados.sexEmp) AS 'Empleados'
FROM departamentos,empleados 
WHERE departamentos.codDepto = empleados.codDepto
GROUP BY departamentos.nombreDpto
HAVING COUNT(empleados.nDiEmp) > 3

/* 13. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan más de dos empleados (2 incluido). */

SELECT empleados.jefeID AS 'codigo jefe',
empleados.nomEmp AS 'Nombre Jefe', 
departamentos.nombreDpto,
COUNT(empleados.nDIEmp) AS 'Cantidad empleados'
FROM departamentos,empleados 
WHERE departamentos.codDepto = empleados.codDepto
GROUP BY departamentos.nombreDpto
HAVING COUNT(empleados.nDiEmp) >= 2

/* 14. Hallar los departamentos que no tienen empleados */

/* Se agrega departamente sin empleados */
INSERT INTO `departamentos` (`codDepto`, `nombreDpto`, `ciudad`, `codDirector`) VALUES ('0005', 'Legales', 'BsAs', NULL), ('0006', 'Archivo', 'CABA', NULL);

SELECT departamentos.nombreDpto FROM departamentos
LEFT JOIN empleados ON departamentos.codDepto=empleados.codDepto WHERE empleados.nomEmp is null


/* 15. Mostrar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de
la suma. */

SELECT departamentos.nombreDpto AS 'Departamento',
SUM(empleados.salEmp) AS 'Sueldo empleados'
FROM departamentos,empleados
WHERE departamentos.codDepto = empleados.codDepto
GROUP BY departamentos.nombreDpto

