-- MySQL Script generated by MySQL Workbench
-- 04/04/16 21:40:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema negocios2011
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `negocios2011` ;

-- -----------------------------------------------------
-- Schema negocios2011
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `negocios2011` DEFAULT CHARACTER SET latin1 ;
USE `negocios2011` ;

-- -----------------------------------------------------
-- Table `negocios2011`.`cargos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`cargos` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`cargos` (
  `idcargo` INT(11) NOT NULL,
  `descar` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idcargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`categorias` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`categorias` (
  `idcategoria` INT(11) NOT NULL,
  `nomcategoria` VARCHAR(40) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`paises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`paises` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`paises` (
  `idpais` CHAR(3) NOT NULL,
  `nombrepais` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`clientes` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`clientes` (
  `idcliente` CHAR(5) NOT NULL,
  `nomcliente` VARCHAR(40) NOT NULL,
  `dircliente` VARCHAR(80) NOT NULL,
  `idpais` CHAR(3) NOT NULL,
  `fonocliente` VARCHAR(15) NULL DEFAULT NULL,
  `Descuento` DECIMAL(4,2) NULL DEFAULT NULL,
  `paises_idpais` CHAR(3) NOT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_clientes_paises_idx` (`paises_idpais` ASC),
  CONSTRAINT `fk_clientes_paises`
    FOREIGN KEY (`paises_idpais`)
    REFERENCES `negocios2011`.`paises` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`distritos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`distritos` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`distritos` (
  `iddistrito` INT(11) NOT NULL,
  `nomdistrito` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`iddistrito`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`empleados` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`empleados` (
  `idempleado` INT(11) NOT NULL,
  `nomempleado` VARCHAR(50) NOT NULL,
  `apeempleado` VARCHAR(50) NOT NULL,
  `fecnac` DATETIME NOT NULL,
  `dirempleado` VARCHAR(100) NOT NULL,
  `iddistrito` INT(11) NOT NULL,
  `fonoempleado` VARCHAR(15) NULL DEFAULT NULL,
  `idcargo` INT(11) NOT NULL,
  `feccontrata` DATETIME NOT NULL,
  `Salario` DECIMAL(10,2) NULL DEFAULT NULL,
  `cargos_idcargo` INT(11) NOT NULL,
  `distritos_iddistrito` INT(11) NOT NULL,
  PRIMARY KEY (`idempleado`),
  INDEX `fk_empleados_cargos1_idx` (`cargos_idcargo` ASC),
  INDEX `fk_empleados_distritos1_idx` (`distritos_iddistrito` ASC),
  CONSTRAINT `fk_empleados_cargos1`
    FOREIGN KEY (`cargos_idcargo`)
    REFERENCES `negocios2011`.`cargos` (`idcargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_distritos1`
    FOREIGN KEY (`distritos_iddistrito`)
    REFERENCES `negocios2011`.`distritos` (`iddistrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`proveedores` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`proveedores` (
  `idproveedor` INT(11) NOT NULL,
  `nomproveedor` VARCHAR(80) NOT NULL,
  `dirproveedor` VARCHAR(100) NOT NULL,
  `nomcontacto` VARCHAR(80) NOT NULL,
  `carcontacto` VARCHAR(50) NOT NULL,
  `idpais` CHAR(3) NOT NULL,
  `fonoproveedor` VARCHAR(15) NOT NULL,
  `faxproveedor` VARCHAR(15) NOT NULL,
  `paises_idpais` CHAR(3) NOT NULL,
  PRIMARY KEY (`idproveedor`),
  INDEX `fk_proveedores_paises1_idx` (`paises_idpais` ASC),
  CONSTRAINT `fk_proveedores_paises1`
    FOREIGN KEY (`paises_idpais`)
    REFERENCES `negocios2011`.`paises` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`productos` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`productos` (
  `idproducto` INT(11) NOT NULL,
  `nomproducto` VARCHAR(80) NOT NULL,
  `idproveedor` INT(11) NOT NULL,
  `idcategoria` INT(11) NOT NULL,
  `cantxunidad` VARCHAR(50) NOT NULL,
  `preciounidad` DECIMAL(10,2) NOT NULL,
  `unidadesenexistencia` SMALLINT(6) NOT NULL,
  `unienpedido` SMALLINT(6) NOT NULL,
  `categorias_idcategoria` INT(11) NOT NULL,
  `proveedores_idproveedor` INT(11) NOT NULL,
  PRIMARY KEY (`idproducto`, `categorias_idcategoria`),
  INDEX `fk_productos_categorias1_idx` (`categorias_idcategoria` ASC),
  INDEX `fk_productos_proveedores1_idx` (`proveedores_idproveedor` ASC),
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`categorias_idcategoria`)
    REFERENCES `negocios2011`.`categorias` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_proveedores1`
    FOREIGN KEY (`proveedores_idproveedor`)
    REFERENCES `negocios2011`.`proveedores` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`pedidosdeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`pedidosdeta` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`pedidosdeta` (
  `idpedido` INT(11) NOT NULL,
  `idproducto` INT(11) NOT NULL,
  `preciounidad` DECIMAL(10,2) NOT NULL,
  `cantidad` SMALLINT(6) NOT NULL,
  `descuento` DECIMAL(10,2) NOT NULL,
  `proveedores_idproveedor` INT(11) NOT NULL,
  `productos_idproducto` INT(11) NOT NULL,
  `productos_categorias_idcategoria` INT(11) NOT NULL,
  PRIMARY KEY (`idpedido`, `idproducto`),
  INDEX `fk_pedidosdeta_proveedores1_idx` (`proveedores_idproveedor` ASC),
  INDEX `fk_pedidosdeta_productos1_idx` (`productos_idproducto` ASC, `productos_categorias_idcategoria` ASC),
  CONSTRAINT `fk_pedidosdeta_proveedores1`
    FOREIGN KEY (`proveedores_idproveedor`)
    REFERENCES `negocios2011`.`proveedores` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidosdeta_productos1`
    FOREIGN KEY (`productos_idproducto` , `productos_categorias_idcategoria`)
    REFERENCES `negocios2011`.`productos` (`idproducto` , `categorias_idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `negocios2011`.`pedidoscabe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `negocios2011`.`pedidoscabe` ;

CREATE TABLE IF NOT EXISTS `negocios2011`.`pedidoscabe` (
  `idpedido` INT(11) NOT NULL,
  `idcliente` CHAR(5) NOT NULL,
  `idempleado` INT(11) NOT NULL,
  `fechapedido` DATETIME NULL DEFAULT NULL,
  `fechaentrega` DATETIME NULL DEFAULT NULL,
  `fechaenvio` DATETIME NULL DEFAULT NULL,
  `enviopedido` CHAR(1) NOT NULL,
  `destinatario` VARCHAR(60) NOT NULL,
  `dirdestinatario` VARCHAR(100) NOT NULL,
  `pedidosdeta_idpedido` INT(11) NOT NULL,
  `pedidosdeta_idproducto` INT(11) NOT NULL,
  `clientes_idcliente` CHAR(5) NOT NULL,
  `empleados_idempleado` INT(11) NOT NULL,
  PRIMARY KEY (`idpedido`, `pedidosdeta_idpedido`, `pedidosdeta_idproducto`, `clientes_idcliente`),
  INDEX `fk_pedidoscabe_pedidosdeta1_idx` (`pedidosdeta_idpedido` ASC, `pedidosdeta_idproducto` ASC),
  INDEX `fk_pedidoscabe_clientes1_idx` (`clientes_idcliente` ASC),
  INDEX `fk_pedidoscabe_empleados1_idx` (`empleados_idempleado` ASC),
  CONSTRAINT `fk_pedidoscabe_pedidosdeta1`
    FOREIGN KEY (`pedidosdeta_idpedido` , `pedidosdeta_idproducto`)
    REFERENCES `negocios2011`.`pedidosdeta` (`idpedido` , `idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoscabe_clientes1`
    FOREIGN KEY (`clientes_idcliente`)
    REFERENCES `negocios2011`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoscabe_empleados1`
    FOREIGN KEY (`empleados_idempleado`)
    REFERENCES `negocios2011`.`empleados` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
