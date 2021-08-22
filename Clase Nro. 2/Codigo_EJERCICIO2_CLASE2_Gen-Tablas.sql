CREATE DATABASE IF NOT EXISTS `departamentos`;
USE `departamentos`;

CREATE TABLE IF NOT EXISTS `DEPARTAMENTOS` (
`Codigo` INT NOT NULL,
`Nombre` VARCHAR(100),
`Presupuesto` INT,
PRIMARY KEY (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `EMPLEADOS` (
`DNI` VARCHAR(8) NOT NULL,
`Nombre` VARCHAR(100),
`Apellido` VARCHAR(255),
`Departamento` INT,
PRIMARY KEY (`DNI`),
CONSTRAINT `FK1` FOREIGN KEY (`Departamento`) REFERENCES `DEPARTAMENTOS` (`Codigo`)
);

INSERT INTO `DEPARTAMENTOS` (`Codigo`, `Nombre`, `Presupuesto`) 
VALUES 
('1', 'INFRAESTRUCTURA', '195000'), 
('2', 'DESARROLLO','25000'), 
('3', 'DISEÑO', '55000'),
('4', 'ADMINISTRACION', '45000')
;

INSERT INTO `EMPLEADOS` (`DNI`, `Nombre`, `Apellido`, `Departamento`) 
VALUES 
('28657983', 'Gabriel', 'Vega', '3'), 
('34453984', 'Angel', 'Barrientos', '2'), 
('27342904', 'Robert', 'Roja', '1'), 
('44345235', 'Marcela', 'Lopez', '3'), 
('33452745', 'Lisandro', 'Perez', '2'), 
('41453647', 'Cristiana', 'Varela', '3'), 
('26254462', 'Carla', 'Lopez', '4'), 
('38544533', 'Matias', 'Morales', '2'), 
('25657765', 'Sergio', 'Canordacichi', '2');

