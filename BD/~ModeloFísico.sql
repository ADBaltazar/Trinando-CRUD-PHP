-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cfsolenne
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cfsolenne
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cfsolenne` DEFAULT CHARACTER SET utf8 ;
USE `cfsolenne` ;

-- -----------------------------------------------------
-- Table `cfsolenne`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`departamento` (
  `codDep` INT(11) NOT NULL AUTO_INCREMENT,
  `Departamento` VARCHAR(100) NOT NULL,
  `Decricao` VARCHAR(100) NULL DEFAULT NULL,
  `Data_Criacao` DATE NOT NULL,
  `Data_Modif` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`codDep`),
  UNIQUE INDEX `Departamento` (`Departamento`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`cargo` (
  `codCargo` INT(11) NOT NULL AUTO_INCREMENT,
  `Funcao` VARCHAR(100) NOT NULL,
  `Decricao` VARCHAR(100) NULL DEFAULT NULL,
  `Data_Cadast` DATE NOT NULL,
  `IDDep` INT(11) NOT NULL,
  PRIMARY KEY (`codCargo`),
  UNIQUE INDEX `Funcao` (`Funcao` ASC) ,
  INDEX `IDDep` (`IDDep` ASC) ,
  CONSTRAINT `cargo_ibfk_1`
    FOREIGN KEY (`IDDep`)
    REFERENCES `cfsolenne`.`departamento` (`codDep`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`funcionario` (
  `codFunc` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Sobrenome` VARCHAR(100) NULL DEFAULT NULL,
  `Apelido` VARCHAR(100) NOT NULL,
  `Identidade` VARCHAR(14) NULL DEFAULT NULL,
  `genero` ENUM('M', 'F') NOT NULL,
  `Data_Nasc` DATE NOT NULL,
  `cargo_codCargo` INT(11) NOT NULL,
  PRIMARY KEY (`codFunc`),
  UNIQUE INDEX `Identidade` (`Identidade`) 
  INDEX `fk_funcionario_cargo1_idx` (`cargo_codCargo` ) ,
  CONSTRAINT `fk_funcionario_cargo1`
    FOREIGN KEY (`cargo_codCargo`)
    REFERENCES `cfsolenne`.`cargo` (`codCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`categoria` (
  `codCat` INT(11) NOT NULL AUTO_INCREMENT,
  `Categoria` VARCHAR(100) NOT NULL,
  `Decricao` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`codCat`),
  UNIQUE INDEX `Categoria` (`Categoria` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`curso` (
  `codCurso` INT(11) NOT NULL AUTO_INCREMENT,
  `Curso` VARCHAR(100) NOT NULL,
  `CargaHoraria` INT(11) NOT NULL,
  `preco` DECIMAL(10,0) NULL DEFAULT NULL,
  `Data_Cadast` DATE NOT NULL,
  `IDCat` INT(11) NOT NULL,
  PRIMARY KEY (`codCurso`),
  UNIQUE INDEX `Curso` (`Curso` ASC) ,
  INDEX `IDCat` (`IDCat` ASC) ,
  CONSTRAINT `curso_ibfk_1`
    FOREIGN KEY (`IDCat`)
    REFERENCES `cfsolenne`.`categoria` (`codCat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`cadformador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`cadformador` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `data_inscricao` DATE NOT NULL,
  `IDFunc` INT(11) NOT NULL,
  `IDCurso` INT(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `IDFunc` (`IDFunc` ASC) ,
  INDEX `IDCurso` (`IDCurso` ASC) ,
  CONSTRAINT `cadformador_ibfk_1`
    FOREIGN KEY (`IDFunc`)
    REFERENCES `cfsolenne`.`funcionario` (`codFunc`),
  CONSTRAINT `cadformador_ibfk_2`
    FOREIGN KEY (`IDCurso`)
    REFERENCES `cfsolenne`.`curso` (`codCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`formando`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`formando` (
  `codForm` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Sobrenome` VARCHAR(100) NULL DEFAULT NULL,
  `Apelido` VARCHAR(100) NOT NULL,
  `Identidade` VARCHAR(14) NULL DEFAULT NULL,
  `genero` ENUM('M', 'F') NOT NULL,
  `Data_Nasc` DATE NOT NULL,
  PRIMARY KEY (`codForm`),
  UNIQUE INDEX `Identidade` (`Identidade` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`contformando`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`contformando` (
  `codCont` INT(11) NOT NULL AUTO_INCREMENT,
  `Contato` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(100) NULL DEFAULT NULL,
  `IDForm` INT(11) NOT NULL,
  PRIMARY KEY (`codCont`),
  UNIQUE INDEX `Contato` (`Contato` ASC) ,
  INDEX `IDForm` (`IDForm` ASC) ,
  CONSTRAINT `contformando_ibfk_1`
    FOREIGN KEY (`IDForm`)
    REFERENCES `cfsolenne`.`formando` (`codForm`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`contfunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`contfunc` (
  `codCont` INT(11) NOT NULL AUTO_INCREMENT,
  `Contato` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(100) NULL DEFAULT NULL,
  `IDFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codCont`),
  UNIQUE INDEX `Contato` (`Contato` ASC) VISIBLE,
  INDEX `IDFunc` (`IDFunc` ASC) VISIBLE,
  CONSTRAINT `contfunc_ibfk_1`
    FOREIGN KEY (`IDFunc`)
    REFERENCES `cfsolenne`.`funcionario` (`codFunc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`docform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`docform` (
  `codDoc` INT(11) NOT NULL AUTO_INCREMENT,
  `Doc` VARCHAR(100) NOT NULL,
  `IDForm` INT(11) NOT NULL,
  PRIMARY KEY (`codDoc`),
  INDEX `IDForm` (`IDForm` ASC) VISIBLE,
  CONSTRAINT `docform_ibfk_1`
    FOREIGN KEY (`IDForm`)
    REFERENCES `cfsolenne`.`formando` (`codForm`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`docfunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`docfunc` (
  `codDoct` INT(11) NOT NULL AUTO_INCREMENT,
  `Doc` VARCHAR(100) NOT NULL,
  `IDFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codDoct`),
  INDEX `IDFunc` (`IDFunc` ASC) VISIBLE,
  CONSTRAINT `docfunc_ibfk_1`
    FOREIGN KEY (`IDFunc`)
    REFERENCES `cfsolenne`.`funcionario` (`codFunc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`enderecoformando`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`enderecoformando` (
  `codEnd` INT(11) NOT NULL AUTO_INCREMENT,
  `Bairro` VARCHAR(100) NOT NULL,
  `Rua` CHAR(1) NULL DEFAULT NULL,
  `Zona` INT(11) NULL DEFAULT NULL,
  `Cidade` VARCHAR(14) NULL DEFAULT NULL,
  `IDForm` INT(11) NOT NULL,
  PRIMARY KEY (`codEnd`),
  INDEX `IDForm` (`IDForm` ASC) ,
  CONSTRAINT `enderecoformando_ibfk_1`
    FOREIGN KEY (`IDForm`)
    REFERENCES `cfsolenne`.`formando` (`codForm`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`enderecofunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`enderecofunc` (
  `codEnd` INT(11) NOT NULL AUTO_INCREMENT,
  `Bairro` VARCHAR(100) NOT NULL,
  `Rua` CHAR(1) NULL DEFAULT NULL,
  `Zona` INT(11) NULL DEFAULT NULL,
  `Cidade` VARCHAR(14) NULL DEFAULT NULL,
  `IDFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codEnd`),
  INDEX `IDFunc` (`IDFunc` ASC) ,
  CONSTRAINT `enderecofunc_ibfk_1`
    FOREIGN KEY (`IDFunc`)
    REFERENCES `cfsolenne`.`funcionario` (`codFunc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`tipoformacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`tipoformacao` (
  `codTipo` INT(11) NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`codTipo`),
  UNIQUE INDEX `Tipo` (`Tipo` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`formacaofunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`formacaofunc` (
  `codFormacao` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome_formacao` VARCHAR(100) NOT NULL,
  `Nivel` VARCHAR(100) NULL DEFAULT NULL,
  `Instituicao` VARCHAR(100) NOT NULL,
  `IDFunc` INT(11) NOT NULL,
  `DITipoForm` INT(11) NOT NULL,
  PRIMARY KEY (`codFormacao`),
  INDEX `IDFunc` (`IDFunc` ASC) ,
  INDEX `DITipoForm` (`DITipoForm` ASC) ,
  CONSTRAINT `formacaofunc_ibfk_1`
    FOREIGN KEY (`IDFunc`)
    REFERENCES `cfsolenne`.`funcionario` (`codFunc`),
  CONSTRAINT `formacaofunc_ibfk_2`
    FOREIGN KEY (`DITipoForm`)
    REFERENCES `cfsolenne`.`tipoformacao` (`codTipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`incrição`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`incrição` (
  `codInscricao` INT(11) NOT NULL AUTO_INCREMENT,
  `ValorCurso1` DECIMAL(10,0) NULL DEFAULT NULL,
  `ValorCurso2` DECIMAL(10,0) NULL DEFAULT NULL,
  `ValorMaterial` DECIMAL(10,0) NULL DEFAULT NULL,
  `ValorCartao` DECIMAL(10,0) NOT NULL,
  `data_inscricao` DATE NOT NULL,
  `IDForm` INT(11) NOT NULL,
  `IDFunc` INT(11) NOT NULL,
  `IDCurso` INT(11) NOT NULL,
  PRIMARY KEY (`codInscricao`),
  INDEX `IDForm` (`IDForm` ASC) ,
  INDEX `IDFunc` (`IDFunc` ASC) ,
  INDEX `IDCurso` (`IDCurso` ASC) ,
  CONSTRAINT `incrição_ibfk_1`
    FOREIGN KEY (`IDForm`)
    REFERENCES `cfsolenne`.`formando` (`codForm`),
  CONSTRAINT `incrição_ibfk_2`
    FOREIGN KEY (`IDFunc`)
    REFERENCES `cfsolenne`.`funcionario` (`codFunc`),
  CONSTRAINT `incrição_ibfk_3`
    FOREIGN KEY (`IDCurso`)
    REFERENCES `cfsolenne`.`curso` (`codCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`perfilacesso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne`.`perfilacesso` (
  `codPerfil` INT(11) NOT NULL AUTO_INCREMENT,
  `USuario` VARCHAR(100) NULL DEFAULT NULL,
  `Senha` VARCHAR(100) NULL DEFAULT NULL,
  `Estado` VARCHAR(100) NULL DEFAULT NULL,
  `Privilegio` VARCHAR(100) NOT NULL,
  `funcionario_codFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codPerfil`),
  INDEX `fk_perfilacesso_funcionario1_idx` (`funcionario_codFunc` ASC) ,
  CONSTRAINT `fk_perfilacesso_funcionario1`
    FOREIGN KEY (`funcionario_codFunc`)
    REFERENCES `cfsolenne`.`funcionario` (`codFunc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
