CREATE DATABASE IF NOT EXISTS `deposito`;
USE `deposito`;

CREATE TABLE IF NOT EXISTS `FABRICANTES` (
`Codigo` INT NOT NULL,
`Nombre` VARCHAR(100),
PRIMARY KEY (`Codigo`)
);

CREATE TABLE IF NOT EXISTS `ARTICULOS` (
`Codigo` INT NOT NULL,
`Nombre` VARCHAR(100),
`Precio` INT,
`Fabricante` INT,
PRIMARY KEY (`Codigo`),
CONSTRAINT `FK1` FOREIGN KEY (`Fabricante`) REFERENCES `FABRICANTES` (`Codigo`)
);


INSERT INTO `FABRICANTES` (`Codigo`, `Nombre`) VALUES ('1', 'METALURGIA MARCELO S.R.L.'), ('2', 'ELECTRONICA XIN-XAM-WAN LLC'), ('3', 'PLASTICOR S.A.');

INSERT INTO `ARTICULOS` (`Codigo`, `Nombre`, `Precio`, `Fabricante`) VALUES ('1', 'Perfil hierro 4x2', '120', '1'), ('2', 'Angulo hierro 3x3', '150', '1'), ('3', 'Calibre plastico', '280', '3'), ('4', 'Mascara protectora', '200', '3'), ('5', 'Tester electronico red', '1790', '2'), ('6', 'Chapa acanalada 6m', '1800', '1'), ('7', 'Perfil hierro 4x4', '180', '1'), ('8', 'Tester electronico multfun', '2500', '2'), ('9', 'Molde plast. cubre calzado', '110', '3');

