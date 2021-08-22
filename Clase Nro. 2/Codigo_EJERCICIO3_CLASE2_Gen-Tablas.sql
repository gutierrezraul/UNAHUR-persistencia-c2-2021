CREATE DATABASE IF NOT EXISTS `almacen`;
USE `almacen`;

CREATE TABLE IF NOT EXISTS `ALMACENES` (
`Codigo` INT NOT NULL,
`Lugar` VARCHAR(100),
`Capacidad` INT,
PRIMARY KEY (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `CAJAS` (
`NumRefencia` CHAR(5),
`Contenido` VARCHAR(100),
`Valor` INT,
`Almacen` INT,
PRIMARY KEY (`NumRefencia`),
CONSTRAINT `FK1` FOREIGN KEY (`Almacen`) REFERENCES `ALMACENES` (`Codigo`)
);


INSERT INTO `ALMACENES` (`Codigo`, `Lugar`, `Capacidad`) 
VALUES 
('1', 'Pilar', '5'), 
('2', 'Villa Crespo', '3'), 
('3', 'Rosario', '10');

INSERT INTO `CAJAS` (`NumRefencia`, `Contenido`, `Valor`, `Almacen`) 
VALUES 
('00001', 'Huevos', '220', '2'), 
('00002', 'Repuestos para Bicis', '7500', '1'), 
('00003', 'Componentes electronicos', '5000', '3'), 
('00004', 'Mascaras protectoras', '1200', '3'), 
('00005', '10 pares de zapatillas', '15900', '2'), 
('00006', 'Bolenos 3/8', '2800', '2'), 
('00007', 'Mouses USB', '5480', '1'), 
('00008', 'Paquetes de yerba', '4500', '3'),
('00009', 'Cubre calzado', '1610', '3');

