-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema livraria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema livraria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `livraria` DEFAULT CHARACTER SET utf8 ;
USE `livraria` ;

-- -----------------------------------------------------
-- Table `livraria`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`estado` (
  `idestado` INT NOT NULL AUTO_INCREMENT,
  `nomeeestado` VARCHAR(45) NOT NULL,
  `siglaestado` CHAR(2) NOT NULL,
  `regiao` VARCHAR(45) NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `siglaestado_UNIQUE` ON `livraria`.`estado` (`siglaestado` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `livraria`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`cidade` (
  `idIBGE` VARCHAR(45) NOT NULL,
  `idcidadeIBGE` VARCHAR(45) NOT NULL,
  `nomecidade` VARCHAR(1150) NOT NULL,
  `idestado` INT NOT NULL,
  PRIMARY KEY (`idIBGE`),
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`idestado`)
    REFERENCES `livraria`.`estado` (`idestado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_cidade_estado_idx` ON `livraria`.`cidade` (`idestado` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `livraria`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`editora` (
  `ideditora` INT NOT NULL AUTO_INCREMENT,
  `nomeeditora` VARCHAR(100) NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NULL,
  `idIBGE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ideditora`),
  CONSTRAINT `fk_editora_cidade1`
    FOREIGN KEY (`idIBGE`)
    REFERENCES `livraria`.`cidade` (`idIBGE`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `cnpj_ix` ON `livraria`.`editora` (`cnpj` ASC) VISIBLE;

CREATE INDEX `fk_editora_cidade1_idx` ON `livraria`.`editora` (`idIBGE` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `livraria`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`livro` (
  `idlivro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `idioma` VARCHAR(15) NULL,
  PRIMARY KEY (`idlivro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livraria`.`edicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`edicao` (
  `ideditora` INT NOT NULL,
  `idlivro` INT NOT NULL,
  `ISBN` INT NOT NULL,
  `anoedicao` INT NOT NULL,
  `numedicao` INT NOT NULL,
  `numpaginas` INT NULL,
  PRIMARY KEY (`ISBN`),
  CONSTRAINT `fk_editora_livro_editora1`
    FOREIGN KEY (`ideditora`)
    REFERENCES `livraria`.`editora` (`ideditora`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_editora_livro_livro1`
    FOREIGN KEY (`idlivro`)
    REFERENCES `livraria`.`livro` (`idlivro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_editora_livro_livro1_idx` ON `livraria`.`edicao` (`idlivro` ASC) VISIBLE;

CREATE INDEX `fk_editora_livro_editora1_idx` ON `livraria`.`edicao` (`ideditora` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `livraria`.`estado`
-- -----------------------------------------------------
START TRANSACTION;
USE `livraria`;
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (11, 'Rondônia', 'RO', 'Norte');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (12, 'Acre', 'AC', 'Norte');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (13, 'Amazonas', 'AM', 'Norte');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (14, 'Roraima', 'RR', 'Norte');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (15, 'Pará', 'PA', 'Norte');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (16, 'Amapá', 'AP', 'Norte');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (17, 'Tocantins', 'TO', 'Norte');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (21, 'Maranhão', 'MA', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (22, 'Piauí', 'PI', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (23, 'Ceará', 'CE', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (24, 'Rio Grande do Norte', 'RN', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (25, 'Paraíba', 'PB', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (26, 'Pernambuco', 'PE', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (27, 'Alagoas', 'AL', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (28, 'Sergipe', 'SE', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (29, 'Bahia', 'BA', 'Nordeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (31, 'Minas Gerais', 'MG', 'Sudeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (32, 'Espírito Santo', 'ES', 'Sudeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (33, 'Rio de Janeiro', 'RJ', 'Sudeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (35, 'São Paulo', 'SP', 'Sudeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (41, 'Paraná', 'PR', 'Sul');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (42, 'Santa Catarina', 'SC', 'Sul');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (43, 'Rio Grande do Sul', 'RS', 'Sul');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (50, 'Mato Grosso do Sul', 'MS', 'Centro-Oeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (51, 'Mato Grosso', 'MT', 'Centro-Oeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (52, 'Goiás', 'GO', 'Centro-Oeste');
INSERT INTO `livraria`.`estado` (`idestado`, `nomeeestado`, `siglaestado`, `regiao`) VALUES (53, 'Distrito Federal', 'DF', 'Centro-Oeste');

COMMIT;

