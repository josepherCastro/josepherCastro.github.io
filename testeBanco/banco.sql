

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema web2_2020
-- -----------------------------------------------------

CREATE SCHEMA `web2_2020` DEFAULT CHARACTER SET utf8 ;
USE `web2_2020` ;

-- -----------------------------------------------------
-- Table `web2_2020`.`tb_cursos`
-- -----------------------------------------------------
CREATE TABLE `web2_2020`.`tb_cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `area_eixo` VARCHAR(100) NOT NULL,
  `nivel` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `web2_2020`.`tb_turmas`
-- -----------------------------------------------------
CREATE TABLE `web2_2020`.`tb_turmas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `ano` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `web2_2020`.`tb_alunos`
-- -----------------------------------------------------
CREATE TABLE `web2_2020`.`tb_alunos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `curso` INT NOT NULL,
  `turma` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_alunos_tb_cursos_idx` (`curso`),
  INDEX `fk_tb_alunos_tb_turmas1_idx` (`turma`),
  CONSTRAINT `fk_tb_alunos_tb_cursos`
    FOREIGN KEY (`curso`)
    REFERENCES `web2_2020`.`tb_cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_alunos_tb_turmas1`
    FOREIGN KEY (`turma`)
    REFERENCES `web2_2020`.`tb_turmas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
