-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: ejercicio_practica_copia
-- Source Schemata: ejercicio_practica_final
-- Created: Sat Oct 17 13:06:55 2020
-- Workbench Version: 8.0.21
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema ejercicio_practica_copia
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `ejercicio_practica_copia` ;
CREATE SCHEMA IF NOT EXISTS `ejercicio_practica_copia` ;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.clientes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`clientes` (
  `nif_Cliente` VARCHAR(9) NOT NULL,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `nombrePais` VARCHAR(20) NULL DEFAULT NULL,
  `nombreProvincia` VARCHAR(20) NULL DEFAULT NULL,
  `nombrePoblacion` VARCHAR(45) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  `codigoPostal` VARCHAR(5) NOT NULL,
  `telefono` VARCHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fechaAlta` DATE NOT NULL,
  `cllienteId_Recomendacion` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`nif_Cliente`),
  INDEX `FK_RECOMENDACION_ID_idx` (`cllienteId_Recomendacion` ASC) VISIBLE,
  CONSTRAINT `FK_RECOMENDACION_ID`
    FOREIGN KEY (`cllienteId_Recomendacion`)
    REFERENCES `ejercicio_practica_copia`.`clientes` (`nif_Cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.empleados
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`empleados` (
  `id_Empleado` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Empleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.facturacabecera
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`facturacabecera` (
  `numero_Factura` INT NOT NULL AUTO_INCREMENT,
  `fechaFactura` DATE NOT NULL,
  `nifCliente` VARCHAR(49) NOT NULL,
  `totalFactura` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`numero_Factura`),
  INDEX `FK_CLIENTE_NIF_idx` (`nifCliente` ASC) VISIBLE,
  CONSTRAINT `FK_CLIENTE_NIF`
    FOREIGN KEY (`nifCliente`)
    REFERENCES `ejercicio_practica_copia`.`clientes` (`nif_Cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.facturalinea
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`facturalinea` (
  `numero_Factura` INT NOT NULL,
  `gafa_Id` INT NOT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `pvp` DECIMAL(5,2) NULL DEFAULT NULL,
  `totalLinea` DECIMAL(5,2) NULL DEFAULT NULL,
  `empleado_Id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`numero_Factura`, `gafa_Id`),
  INDEX `FK_EMPLEADO_ID_idx` (`empleado_Id` ASC) VISIBLE,
  INDEX `FK_GAFA_ID_idx` (`gafa_Id` ASC) VISIBLE,
  CONSTRAINT `FK_EMPLEADO_ID`
    FOREIGN KEY (`empleado_Id`)
    REFERENCES `ejercicio_practica_copia`.`empleados` (`id_Empleado`),
  CONSTRAINT `FK_GAFA_ID`
    FOREIGN KEY (`gafa_Id`)
    REFERENCES `ejercicio_practica_copia`.`gafas` (`id_Gafa`),
  CONSTRAINT `FK_NUMERO_FACTURA`
    FOREIGN KEY (`numero_Factura`)
    REFERENCES `ejercicio_practica_copia`.`facturacabecera` (`numero_Factura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.gafas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`gafas` (
  `id_Gafa` INT NOT NULL AUTO_INCREMENT,
  `proveedor_Cif` VARCHAR(10) NOT NULL,
  `marca_Id` INT NOT NULL,
  `oiGraduacion` DECIMAL(2,1) NULL DEFAULT NULL,
  `odGraduacion` DECIMAL(2,1) NULL DEFAULT NULL,
  `montura_id` INT NULL DEFAULT NULL,
  `oiColor` VARCHAR(45) NULL DEFAULT NULL,
  `odColor` VARCHAR(45) NULL DEFAULT NULL,
  `pvp` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Gafa`, `marca_Id`, `proveedor_Cif`),
  INDEX `FK_PROVEEDOR_CIF_idx` (`proveedor_Cif` ASC) VISIBLE,
  INDEX `FK_MARCA_ID_idx` (`marca_Id` ASC) VISIBLE,
  INDEX `FK_MONTURA_ID_idx` (`montura_id` ASC) VISIBLE,
  CONSTRAINT `FK_MARCA_ID`
    FOREIGN KEY (`marca_Id`)
    REFERENCES `ejercicio_practica_copia`.`marcas` (`id_Marca`),
  CONSTRAINT `FK_MONTURA_ID`
    FOREIGN KEY (`montura_id`)
    REFERENCES `ejercicio_practica_copia`.`monturas` (`id_Montura`),
  CONSTRAINT `FK_PROVEEDOR_CIF`
    FOREIGN KEY (`proveedor_Cif`)
    REFERENCES `ejercicio_practica_copia`.`proveedores` (`cif_Proveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.marcas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`marcas` (
  `id_Marca` INT NOT NULL AUTO_INCREMENT,
  `proveedor_Cif` VARCHAR(10) NOT NULL,
  `nombreMarca` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Marca`, `proveedor_Cif`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.monturas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`monturas` (
  `id_Montura` INT NOT NULL AUTO_INCREMENT,
  `nombreMontura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Montura`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table ejercicio_practica_copia.proveedores
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio_practica_copia`.`proveedores` (
  `cif_Proveedor` VARCHAR(10) NOT NULL,
  `nombreProveedor` VARCHAR(45) NOT NULL,
  `nombrePais` VARCHAR(20) NULL DEFAULT NULL,
  `nombreProvincia` VARCHAR(20) NULL DEFAULT NULL,
  `nombrePoblacion` VARCHAR(45) NULL DEFAULT NULL,
  `codigoPostal` VARCHAR(5) NULL DEFAULT NULL,
  `calle` VARCHAR(45) NULL DEFAULT NULL,
  `numero` INT NULL DEFAULT NULL,
  `piso` VARCHAR(3) NULL DEFAULT NULL,
  `puerta` VARCHAR(2) NULL DEFAULT NULL,
  `telefono` VARCHAR(11) NOT NULL,
  `fax` VARCHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cif_Proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET FOREIGN_KEY_CHECKS = 1;
