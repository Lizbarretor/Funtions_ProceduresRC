-- MySQL Workbench Synchronization
-- Generated: 2023-05-17 11:01
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: ROZO

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`Caracteristicas_fisicas` (
  `idCaracteristicas_fisicas` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`idCaracteristicas_fisicas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Caracteristicas_quimicas` (
  `idCaracteristicas_quimicas` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`idCaracteristicas_quimicas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`clima` (
  `idclima` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `temporada_inicio` DATE NULL DEFAULT NULL,
  `temporada_final` DATE NULL DEFAULT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`idclima`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`cultivo` (
  `idcultivo` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`idcultivo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`terreno` (
  `idterreno` INT(11) NOT NULL,
  `id_tipo_terreno` INT(11) NULL DEFAULT NULL,
  `id_cultivo` INT(11) NULL DEFAULT NULL,
  `id_clima` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idterreno`),
  INDEX `id_clima_idx` (`id_clima` ASC) VISIBLE,
  INDEX `id_cultivo_idx` (`id_cultivo` ASC) VISIBLE,
  CONSTRAINT `id_clima`
    FOREIGN KEY (`id_clima`)
    REFERENCES `mydb`.`clima` (`idclima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_cultivo`
    FOREIGN KEY (`id_cultivo`)
    REFERENCES `mydb`.`cultivo` (`idcultivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`tamaño_rueda` (
  `idtamaño_rueda` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idtamaño_rueda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`ruedas` (
  `idruedas` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `tamaño_cm` DECIMAL(2) NULL DEFAULT NULL,
  `peso_kg` DECIMAL(2) NULL DEFAULT NULL,
  `id_tamaño` INT(11) NULL DEFAULT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`idruedas`),
  INDEX `id_tamaño_idx` (`id_tamaño` ASC) VISIBLE,
  CONSTRAINT `id_tamaño`
    FOREIGN KEY (`id_tamaño`)
    REFERENCES `mydb`.`tamaño_rueda` (`idtamaño_rueda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`rover` (
  `idrover` INT(11) NOT NULL,
  `id_estructura` INT(11) NULL DEFAULT NULL,
  `id_ruedas` INT(11) NULL DEFAULT NULL,
  `peso` DECIMAL(2) NULL DEFAULT NULL,
  PRIMARY KEY (`idrover`),
  INDEX `id_ruedas_idx` (`id_ruedas` ASC) VISIBLE,
  INDEX `id_estructura_idx` (`id_estructura` ASC) VISIBLE,
  CONSTRAINT `id_ruedas`
    FOREIGN KEY (`id_ruedas`)
    REFERENCES `mydb`.`ruedas` (`idruedas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_estructura`
    FOREIGN KEY (`id_estructura`)
    REFERENCES `mydb`.`estructura` (`idestructura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`estructura` (
  `idestructura` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `peso_kg` DECIMAL(2) NULL DEFAULT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`idestructura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`desplazamiento` (
  `iddesplazamiento` INT(11) NOT NULL,
  `id_eje_x` INT(11) NULL DEFAULT NULL,
  `id_eje_y` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`iddesplazamiento`),
  INDEX `id_eje_x_idx` (`id_eje_x` ASC) VISIBLE,
  INDEX `id_eje_y_idx` (`id_eje_y` ASC) VISIBLE,
  CONSTRAINT `id_eje_x`
    FOREIGN KEY (`id_eje_x`)
    REFERENCES `mydb`.`eje x` (`ideje x`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_eje_y`
    FOREIGN KEY (`id_eje_y`)
    REFERENCES `mydb`.`eje y` (`ideje y`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`eje x` (
  `ideje x` INT(11) NOT NULL,
  `inicio` DECIMAL(2) NULL DEFAULT NULL,
  `final` DECIMAL(2) NULL DEFAULT NULL,
  PRIMARY KEY (`ideje x`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`eje y` (
  `ideje y` INT(11) NOT NULL,
  `inicio` DECIMAL(2) NULL DEFAULT NULL,
  `final` DECIMAL(2) NULL DEFAULT NULL,
  PRIMARY KEY (`ideje y`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`simulacion` (
  `idsimulacion` INT(11) NOT NULL,
  `id_usuario` INT(11) NULL DEFAULT NULL,
  `id_rover` INT(11) NULL DEFAULT NULL,
  `id_terreno` INT(11) NULL DEFAULT NULL,
  `fecha_simulacion` DATE NULL DEFAULT NULL,
  `tiempo_simulacion` TIME NULL DEFAULT NULL,
  `id_desplazamiento` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idsimulacion`),
  INDEX `id_rover_idx` (`id_rover` ASC) VISIBLE,
  INDEX `id_terreno_idx` (`id_terreno` ASC) VISIBLE,
  INDEX `id_desplazamiento_idx` (`id_desplazamiento` ASC) VISIBLE,
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_rover`
    FOREIGN KEY (`id_rover`)
    REFERENCES `mydb`.`rover` (`idrover`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_terreno`
    FOREIGN KEY (`id_terreno`)
    REFERENCES `mydb`.`terreno` (`idterreno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_desplazamiento`
    FOREIGN KEY (`id_desplazamiento`)
    REFERENCES `mydb`.`desplazamiento` (`iddesplazamiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `identificacion` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `id_profesion` INT(11) NULL DEFAULT NULL,
  `id_genero` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`identificacion`),
  INDEX `id_profesion_idx` (`id_profesion` ASC) VISIBLE,
  INDEX `id_genero_idx` (`id_genero` ASC) VISIBLE,
  CONSTRAINT `id_profesion`
    FOREIGN KEY (`id_profesion`)
    REFERENCES `mydb`.`profesion` (`idprofesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_genero`
    FOREIGN KEY (`id_genero`)
    REFERENCES `mydb`.`genero` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`genero` (
  `idgenero` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`profesion` (
  `idprofesion` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idprofesion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`tipo_terreno` (
  `idtipo_terreno` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `id_caracteristicas_fis` INT(11) NULL DEFAULT NULL,
  `id_caracteristicas_qui` INT(11) NULL DEFAULT NULL,
  `fertilidad` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idtipo_terreno`),
  INDEX `id_carac_fis_idx` (`id_caracteristicas_fis` ASC) VISIBLE,
  INDEX `id_carac_qui_idx` (`id_caracteristicas_qui` ASC) VISIBLE,
  CONSTRAINT `id_carac_fis`
    FOREIGN KEY (`id_caracteristicas_fis`)
    REFERENCES `mydb`.`Caracteristicas_fisicas` (`idCaracteristicas_fisicas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_carac_qui`
    FOREIGN KEY (`id_caracteristicas_qui`)
    REFERENCES `mydb`.`Caracteristicas_quimicas` (`idCaracteristicas_quimicas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



*/PROCEDIMIENTO ALMACENADO PARA CREAR USUARIO Y CONTRASEÑA*/

DELIMITER $$
create procedure UsuarioContraseña(in id int, in nombre varchar(45), in apellido varchar(45))
begin 
select concat(upper(substr(nombre,1,4)),upper(substr(apellido, 1,2)),substr(id, 1,3))"usuario",
concat(substr(id, 1,4),".",upper(substr(apellido, 1,2)))"contraseña";
end $$

FUNCIONES 
*/Funcion para saber la edad del usuario */
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `usuario`( id int, nombre varchar(45), apellido varchar(45)) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
begin 
	declare usuario varchar(10);
    select concat(substr(nombre, 1, 2),"_", substr(apellido, 1, 2),substr(id, 7,3)) into usuario;
	return usuario;
end ;;
DELIMITER ;


*/Funcion para calcular el peso del rover*/
DELIMITER //

CREATE FUNCTION `calcularPesoRover`(id_estructura INT, id_rueda INT) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE pesoE, pesoR, pesoF FLOAT;
    SET pesoE = (SELECT peso FROM estructura WHERE id = id_estructura);
    SET pesoR = (SELECT peso FROM rueda WHERE id = id_rueda);
	SET pesoF = ROUND(pesoE + pesoR,2);
    RETURN pesoF;
END;
//
