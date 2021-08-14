CREATE DATABASE IF NOT EXISTS `DBRRHH-sueldos`;
USE `DBRRHH-sueldos`;

CREATE TABLE IF NOT EXISTS `departamentos` (
`codDepto` VARCHAR(4),
`nombreDpto` VARCHAR(20),
`ciudad` VARCHAR(15),
`codDirector` VARCHAR(12),
PRIMARY KEY (`codDepto`)
);

CREATE TABLE IF NOT EXISTS `empleados` (
`nDiEmp` VARCHAR(12) NOT NULL,
`nomEmp` VARCHAR(30),
`sexEmp` VARCHAR(1),
`fecNac` DATE,
`fecIncorporacion` DATE,
`salEmp` FLOAT,
`comisionE` FLOAT,
`cargoE` VARCHAR(15),
`jefeID` VARCHAR(12),
`codDepto` VARCHAR(4),
PRIMARY KEY (`nDiEmp`),
CONSTRAINT `FK_jefeID` FOREIGN KEY (`jefeID`) REFERENCES `empleados` (`nDIEmp`),
CONSTRAINT `FK_codDepto` FOREIGN KEY (`codDepto`) REFERENCES `departamentos` (`codDepto`)
);

ALTER TABLE `departamentos`
ADD CONSTRAINT `FK_codDirector` FOREIGN KEY (`codDirector`) REFERENCES `empleados` (`nDiEmp`) 
;

INSERT INTO `departamentos` (`codDepto`, `nombreDpto`, `ciudad`, `codDirector`) VALUES ('0001', 'Informatica', 'BsAs', NULL);
INSERT INTO `departamentos` (`codDepto`, `nombreDpto`, `ciudad`, `codDirector`) VALUES ('0002', 'Administracion', 'CABA', NULL);
INSERT INTO `departamentos` (`codDepto`, `nombreDpto`, `ciudad`, `codDirector`) VALUES ('0003', 'Expedicion', 'Rosario', NULL);

INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('1001', 'JUAN MARCELO MENDEZ', 'M', '1971-04-06', '2020-01-03', '60000', '1000', 'Operaciones', NULL, '0003'), ('1002', 'GRACIELA INES MORLA', 'F', '1979-04-28', '2018-08-01', '75000', '1000', 'Sistemas', NULL, '0001'), ('1003', 'CARLOS ARDINAN', 'M', '1966-09-29', '2016-03-01', '66000', '1000', 'Contador', NULL, '0002');

INSERT INTO `empleados` (`nDiEmp`, `nomEmp`, `sexEmp`, `fecNac`, `fecIncorporacion`, `salEmp`, `comisionE`, `cargoE`, `jefeID`, `codDepto`) VALUES ('1004', 'RODOLFO MONTENEGRO', 'M', '1987-10-23', '2020-04-03', '66000', '1000', 'Sistemas', NULL, '0001'), ('1005', 'CARLA BIZICONTI', 'F', '1999-06-09', '2020-06-10', '66000', '1000', 'Administracion', NULL, '0002');
