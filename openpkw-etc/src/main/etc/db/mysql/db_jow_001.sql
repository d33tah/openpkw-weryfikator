-- MySQL Script generated by MySQL Workbench
-- 07/22/15 22:43:07
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema openpkw_1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `openpkw_1` ;

-- -----------------------------------------------------
-- Schema openpkw_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `openpkw_1` DEFAULT CHARACTER SET latin2 ;
USE `openpkw_1` ;

-- -----------------------------------------------------
-- Table `openpkw_1`.`opm_protokol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openpkw_1`.`opm_protokol` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Nazwa` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 448
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;


-- -----------------------------------------------------
-- Table `openpkw_1`.`opm_pozycje_protokolu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openpkw_1`.`opm_pozycje_protokolu` (
  `id` INT(11) NOT NULL COMMENT '',
  `TrescPozycjiProtokolu` TEXT(256) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL COMMENT '',
  `ProtokolID` INT(11) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_opm_pozycje_protokolu_opm_protokol_idx` (`ProtokolID` ASC)  COMMENT '',
  CONSTRAINT `fk_opm_pozycje_protokolu_opm_protokol`
    FOREIGN KEY (`ProtokolID`)
    REFERENCES `openpkw_1`.`opm_protokol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;


-- -----------------------------------------------------
-- Table `openpkw_1`.`opm_obwodowa_komisja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openpkw_1`.`opm_obwodowa_komisja` (
  `id` INT(11) NOT NULL COMMENT '',
  `pkwId` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `name` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `address` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `type` VARCHAR(4) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `allowedToVote` INT(11) NULL DEFAULT NULL COMMENT '',
  `opm_okregowa_komisja_id` INT(11) NULL DEFAULT NULL COMMENT '',
  `KodTeryt` INT(11) NULL COMMENT '',
  `KodObwodu` INT(11) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `ind_pkwId` (`pkwId` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;


-- -----------------------------------------------------
-- Table `openpkw_1`.`opm_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openpkw_1`.`opm_user` (
  `id` INT(11) NOT NULL COMMENT '',
  `firstname` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `lastname` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `email` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `password` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `type` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `salt` VARCHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `active` TINYINT(4) NULL DEFAULT NULL COMMENT '',
  `username` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `username_UNIQUE` (`username` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;


-- -----------------------------------------------------
-- Table `openpkw_1`.`opm_wynik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openpkw_1`.`opm_wynik` (
  `id` INT(11) NOT NULL COMMENT '',
  `PytanieId` INT(11) NULL DEFAULT NULL COMMENT '',
  `opm_obwodowa_komisja_id` INT(11) NULL DEFAULT NULL COMMENT '',
  `WynikOdpowiedzi` VARCHAR(45) NULL COMMENT '',
  `StepelCzasowy` TIMESTAMP NULL COMMENT '',
  `OpmUserID` INT(11) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_opw_wynik_opw_obwodowa_komisja_idx` (`opm_obwodowa_komisja_id` ASC)  COMMENT '',
  INDEX `fk_opw_wynik_opm_pytania_idx` (`PytanieId` ASC)  COMMENT '',
  UNIQUE INDEX `fk_opm_wynik_unique` (`PytanieId` ASC, `opm_obwodowa_komisja_id` ASC)  COMMENT '',
  INDEX `fk_opw_wynik_opm_user_idx` (`OpmUserID` ASC)  COMMENT '',
  CONSTRAINT `fk_opw_wynik_opw_obwodowa_komisja`
    FOREIGN KEY (`opm_obwodowa_komisja_id`)
    REFERENCES `openpkw_1`.`opm_obwodowa_komisja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_opw_wynik_opm_pytania`
    FOREIGN KEY (`PytanieId`)
    REFERENCES `openpkw_1`.`opm_pozycje_protokolu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_opw_wynik_opm_user`
    FOREIGN KEY (`OpmUserID`)
    REFERENCES `openpkw_1`.`opm_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;


-- -----------------------------------------------------
-- Table `openpkw_1`.`opm_zdjecie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `openpkw_1`.`opm_zdjecie` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `opm_obwodowa_komisja_pkwId` VARCHAR(64) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `timeStamp` TIMESTAMP NULL DEFAULT NULL COMMENT '',
  `opm_user_id` INT(11) NULL DEFAULT NULL COMMENT '',
  `userFileName` VARCHAR(300) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `token` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NULL DEFAULT NULL COMMENT '',
  `file_type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_polish_ci' NOT NULL COMMENT '',
  `protokolID` INT(11) NULL COMMENT '',
  `komisjaID` INT(11) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `opw_zdjecie_opw_obwodowa_komisja_idx` (`opm_obwodowa_komisja_pkwId` ASC)  COMMENT '',
  INDEX `opw_zdjecie_opw_user_idx` (`opm_user_id` ASC)  COMMENT '',
  INDEX `opm_zdjecie_token` (`token` ASC)  COMMENT '',
  INDEX `fk_opm_zdjecie_opm_protokol_idx` (`protokolID` ASC)  COMMENT '',
  INDEX `fk_opm_zdjecie_opm_obwodowa_komisja_idx` (`komisjaID` ASC)  COMMENT '',
  CONSTRAINT `fk_opm_zdjecie_opm_protokol`
    FOREIGN KEY (`protokolID`)
    REFERENCES `openpkw_1`.`opm_protokol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_opm_zdjecie_opm_obwodowa_komisja`
    FOREIGN KEY (`komisjaID`)
    REFERENCES `openpkw_1`.`opm_obwodowa_komisja` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_opm_zdjecie_opm_user`
    FOREIGN KEY (`opm_user_id`)
    REFERENCES `openpkw_1`.`opm_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 448
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_polish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
