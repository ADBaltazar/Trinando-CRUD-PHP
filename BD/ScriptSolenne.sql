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
CREATE SCHEMA IF NOT EXISTS `cfsolenne2` DEFAULT CHARACTER SET utf8 ;
USE `cfsolenne` ;

-- -----------------------------------------------------
-- Table `cfsolenne`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS departamento (
  `codDep` INT(11) NOT NULL AUTO_INCREMENT,
  `Departamento` VARCHAR(100) NOT NULL,
  `Decricao` VARCHAR(100) NULL DEFAULT NULL,
  `Data_Criacao` DATE NOT NULL,
  `Data_Modif` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`codDep`),
  UNIQUE INDEX `Departamento` (`Departamento` ASC) 
  )DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cargo (
  `codCargo` INT(11) NOT NULL AUTO_INCREMENT,
  `Funcao` VARCHAR(100) NOT NULL,
  `Decricao` VARCHAR(100) NULL DEFAULT NULL,
  `Data_Cadast` DATE NOT NULL,
  `IDDep` INT(11) NOT NULL,
  PRIMARY KEY (`codCargo`),
  UNIQUE INDEX `Funcao` (`Funcao` ASC),
  INDEX `IDDep` (`IDDep` ASC),
   foreign key(IDDep) references Departamento(codDep)
  )
DEFAULT CHARACTER SET = utf8;

 
-- -----------------------------------------------------
-- Table `cfsolenne`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`funcionario` (
  `codFunc` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Sobrenome` VARCHAR(100) NULL DEFAULT NULL,
  `Apelido` VARCHAR(100) NOT NULL,
  `Identidade` VARCHAR(14) NULL DEFAULT NULL,
  `genero` ENUM('M', 'F') NOT NULL,
  `Data_Nasc` DATE NOT NULL,
  `cargo_codCargo` INT(11) NOT NULL,
  IDCargo int not null,
  PRIMARY KEY (`codFunc`),
  foreign key(IDCargo) references cargo(codCargo),
  UNIQUE INDEX `Identidade` (`Identidade` ASC) ,
  INDEX `IDCargo` (`IDCargo` ASC) 
  
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`categoria` (
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
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`curso` (
  `codCurso` INT(11) NOT NULL AUTO_INCREMENT,
  `Curso` VARCHAR(100) NOT NULL,
  `CargaHoraria` INT(11) NOT NULL,
  `preco` DECIMAL(10,0) NULL DEFAULT NULL,
  `Data_Cadast` DATE NOT NULL,
  `IDCat` INT(11) NOT NULL,
  PRIMARY KEY (`codCurso`),
  foreign key(IDCat) references Categoria(codCat),
  UNIQUE INDEX `Curso` (`Curso` ASC) ,
  INDEX `IDCat` (`IDCat` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`cadformador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`cadformador` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `data_inscricao` DATE NOT NULL,
  `IDFunc` INT(11) NOT NULL,
  `IDCurso` INT(11) NOT NULL,
  PRIMARY KEY (`codigo`),
   foreign key(IDFunc) references Funcionario(codFunc), 
    foreign key(IDCurso) references Curso(codCurso),
  INDEX `IDFunc` (`IDFunc` ASC) ,
  INDEX `IDCurso` (`IDCurso` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`formando`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`formando` (
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
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`contformando` (
  `codCont` INT(11) NOT NULL AUTO_INCREMENT,
  `Contato` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(100) NULL DEFAULT NULL,
  `IDForm` INT(11) NOT NULL,
  PRIMARY KEY (`codCont`),
   foreign key(IDForm) references Formando(codForm),
  UNIQUE INDEX `Contato` (`Contato` ASC) ,
  INDEX `IDForm` (`IDForm` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`contfunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`contfunc` (
  `codCont` INT(11) NOT NULL AUTO_INCREMENT,
  `Contato` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(100) NULL DEFAULT NULL,
  `IDFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codCont`),
  foreign key(IDFunc) references Funcionario(codFunc),
  UNIQUE INDEX `Contato` (`Contato` ASC) ,
  INDEX `IDFunc` (`IDFunc` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`docform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`docform` (
  `codDoc` INT(11) NOT NULL AUTO_INCREMENT,
  `Doc` VARCHAR(100) NOT NULL,
  `IDForm` INT(11) NOT NULL,
  PRIMARY KEY (`codDoc`),
   foreign key(IDForm) references Formando(codForm),
  INDEX `IDForm` (`IDForm` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`docfunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`docfunc` (
  `codDoct` INT(11) NOT NULL AUTO_INCREMENT,
  `Doc` VARCHAR(100) NOT NULL,
  `IDFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codDoct`),
  foreign key(IDFunc) references Funcionario(codFunc),
  INDEX `IDFunc` (`IDFunc` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`enderecoformando`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`enderecoformando` (
  `codEnd` INT(11) NOT NULL AUTO_INCREMENT,
  `Bairro` VARCHAR(100) NOT NULL,
  `Rua` CHAR(1) NULL DEFAULT NULL,
  `Zona` INT(11) NULL DEFAULT NULL,
  `Cidade` VARCHAR(14) NULL DEFAULT NULL,
  `IDForm` INT(11) NOT NULL,
  PRIMARY KEY (`codEnd`),
   foreign key(IDForm) references Formando(codForm),
  INDEX `IDForm` (`IDForm` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`enderecofunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`enderecofunc` (
  `codEnd` INT(11) NOT NULL AUTO_INCREMENT,
  `Bairro` VARCHAR(100) NOT NULL,
  `Rua` CHAR(1) NULL DEFAULT NULL,
  `Zona` INT(11) NULL DEFAULT NULL,
  `Cidade` VARCHAR(14) NULL DEFAULT NULL,
  `IDFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codEnd`),
  foreign key(IDFunc) references Funcionario(codFunc),
  INDEX `IDFunc` (`IDFunc` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`tipoformacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`tipoformacao` (
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
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`formacaofunc` (
  `codFormacao` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome_formacao` VARCHAR(100) NOT NULL,
  `Nivel` VARCHAR(100) NULL DEFAULT NULL,
  `Instituicao` VARCHAR(100) NOT NULL,
  `IDFunc` INT(11) NOT NULL,
  `DITipoForm` INT(11) NOT NULL,
  PRIMARY KEY (`codFormacao`),
  foreign key(IDFunc) references Funcionario(codFunc),
  foreign key(DITipoForm) references TipoFormacao (codTipo),
  INDEX `IDFunc` (`IDFunc` ASC),
  INDEX `DITipoForm` (`DITipoForm` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`incrição`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`incrição` (
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
   foreign key(IDForm) references Formando(codForm), 
    foreign key(IDFunc) references Funcionario(codFunc), 
    foreign key(IDCurso) references Curso(codCurso),
  INDEX `IDForm` (`IDForm` ASC) ,
  INDEX `IDFunc` (`IDFunc` ASC) ,
  INDEX `IDCurso` (`IDCurso` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cfsolenne`.`perfilacesso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cfsolenne2`.`perfilacesso` (
  `codPerfil` INT(11) NOT NULL AUTO_INCREMENT,
  `USuario` VARCHAR(100) NULL DEFAULT NULL,
  `Senha` VARCHAR(100) NULL DEFAULT NULL,
  `Estado` VARCHAR(100) NULL DEFAULT NULL,
  `Privilegio` VARCHAR(100) NOT NULL,
  `funcionario_codFunc` INT(11) NOT NULL,
  PRIMARY KEY (`codPerfil`),
  INDEX `fk_perfilacesso_funcionario1_idx` (`funcionario_codFunc` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
