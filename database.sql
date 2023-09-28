-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lang_app
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lang_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lang_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lang_app` ;

-- -----------------------------------------------------
-- Table `lang_app`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lang_app`.`languages` (
  `lang_id` INT NOT NULL AUTO_INCREMENT,
  `lang_name` VARCHAR(45) NOT NULL,
  `course_id` INT NULL DEFAULT NULL,
  `capital letter` VARCHAR(100) NOT NULL,
  `small letter` VARCHAR(100) NULL,
  PRIMARY KEY (`lang_id`),
  UNIQUE INDEX `lang_name_UNIQUE` (`lang_name` ASC) VISIBLE,
  UNIQUE INDEX `lang_id_UNIQUE` (`lang_id` ASC) VISIBLE,
  INDEX `course_id` (`course_id` ASC) VISIBLE,
  UNIQUE INDEX `letter_UNIQUE` (`capital letter` ASC) VISIBLE,
  CONSTRAINT `languages_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `lang_app`.`course` (`u_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lang_app`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lang_app`.`users` (
  `u_id` INT NOT NULL AUTO_INCREMENT,
  `u_name` VARCHAR(45) NOT NULL,
  `email_id` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `course_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE INDEX `u_id_UNIQUE` (`u_id` ASC) VISIBLE,
  UNIQUE INDEX `u_name_UNIQUE` (`u_name` ASC) VISIBLE,
  UNIQUE INDEX `email_id_UNIQUE` (`email_id` ASC) VISIBLE,
  INDEX `course_id` (`course_id` ASC) VISIBLE,
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `lang_app`.`course` (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lang_app`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lang_app`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `level` VARCHAR(32) NOT NULL,
  `u_id` INT NOT NULL,
  `lang_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `u_id_idx` (`u_id` ASC) VISIBLE,
  INDEX `lang_id_idx` (`lang_id` ASC) VISIBLE,
  CONSTRAINT `lang_id`
    FOREIGN KEY (`lang_id`)
    REFERENCES `lang_app`.`languages` (`lang_id`),
  CONSTRAINT `u_id`
    FOREIGN KEY (`u_id`)
    REFERENCES `lang_app`.`users` (`u_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lang_app`.`forum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lang_app`.`forum` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(45) NOT NULL,
  `timestamp` VARCHAR(45) NOT NULL,
  `u_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  UNIQUE INDEX `post_id_UNIQUE` (`post_id` ASC) VISIBLE,
  INDEX `u_id_idx` (`u_id` ASC) VISIBLE,
  CONSTRAINT `forum_ibfk_1`
    FOREIGN KEY (`u_id`)
    REFERENCES `lang_app`.`users` (`u_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lang_app`.`lesson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lang_app`.`lesson` (
  `lesson_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `u_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`lesson_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lang_app`.`quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lang_app`.`quiz` (
  `quiz_id` INT NOT NULL AUTO_INCREMENT,
  `questions` VARCHAR(250) NOT NULL,
  `options` VARCHAR(45) NOT NULL,
  `course_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  INDEX `course_id` (`course_id` ASC) VISIBLE,
  CONSTRAINT `quiz_ibfk_1`
    FOREIGN KEY (`course_id`)
    REFERENCES `lang_app`.`course` (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
