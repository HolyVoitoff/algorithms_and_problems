-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema FinalProject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FinalProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FinalProject` DEFAULT CHARACTER SET utf8 ;
USE `FinalProject` ;

-- -----------------------------------------------------
-- Table `FinalProject`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`players` (
  `player_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`player_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`organizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`organizations` (
  `organization_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`organization_id`),
  INDEX `name` (`name`(4) ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`gifts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`gifts` (
  `gift_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `cost` FLOAT NOT NULL DEFAULT 0.01,
  `sale_date` DATE NOT NULL,
  `buyer_id` INT NOT NULL,
  `donated_to_org_id` INT NOT NULL,
  `donater_player_id` INT NOT NULL,
  PRIMARY KEY (`gift_id`, `buyer_id`, `donated_to_org_id`, `donater_player_id`),
  INDEX `fk_gifts_organizations_idx` (`donated_to_org_id` ASC),
  INDEX `fk_gifts_customers1_idx` (`buyer_id` ASC),
  INDEX `fk_gifts_players1_idx` (`donater_player_id` ASC),
  CONSTRAINT `fk_gifts_organizations`
    FOREIGN KEY (`donated_to_org_id`)
    REFERENCES `FinalProject`.`organizations` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gifts_customers1`
    FOREIGN KEY (`buyer_id`)
    REFERENCES `FinalProject`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gifts_players1`
    FOREIGN KEY (`donater_player_id`)
    REFERENCES `FinalProject`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`staff` (
  `guide_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NULL,
  PRIMARY KEY (`guide_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`tours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`tours` (
  `tour_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `ticket_cost` FLOAT NOT NULL DEFAULT 1,
  `tour_organization_cost` FLOAT NOT NULL DEFAULT 5,
  `guide_id` INT NOT NULL,
  PRIMARY KEY (`tour_id`, `guide_id`),
  INDEX `fk_tours_staff1_idx` (`guide_id` ASC),
  CONSTRAINT `fk_tours_staff1`
    FOREIGN KEY (`guide_id`)
    REFERENCES `FinalProject`.`staff` (`guide_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`games` (
  `player_id` INT NOT NULL,
  `gifted` ENUM('1', '0') NOT NULL,
  `donated_date` DATE NOT NULL,
  `present_id` INT NOT NULL,
  PRIMARY KEY (`player_id`, `present_id`),
  INDEX `fk_players_has_gifts_gifts1_idx` (`present_id` ASC),
  INDEX `fk_players_has_gifts_players1_idx` (`player_id` ASC),
  CONSTRAINT `fk_players_has_gifts_players1`
    FOREIGN KEY (`player_id`)
    REFERENCES `FinalProject`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_players_has_gifts_gifts1`
    FOREIGN KEY (`present_id`)
    REFERENCES `FinalProject`.`gifts` (`gift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`customers_tours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`customers_tours` (
  `visitor_id` INT NOT NULL,
  `tour_id` INT NOT NULL,
  PRIMARY KEY (`visitor_id`, `tour_id`),
  INDEX `fk_customers_has_tours_tours1_idx` (`tour_id` ASC),
  INDEX `fk_customers_has_tours_customers1_idx` (`visitor_id` ASC),
  CONSTRAINT `fk_customers_has_tours_customers1`
    FOREIGN KEY (`visitor_id`)
    REFERENCES `FinalProject`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_has_tours_tours1`
    FOREIGN KEY (`tour_id`)
    REFERENCES `FinalProject`.`tours` (`tour_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`gift_specification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`gift_specification` (
  `gift_spec_id` INT NOT NULL AUTO_INCREMENT,
  `is_unique` ENUM('1', '0') NOT NULL,
  `is_sold` ENUM('1', '0') NOT NULL,
  `is_dotaned` ENUM('1', '0') NOT NULL,
  `gift_type` ENUM('0', '1', '2') NOT NULL,
  `gifts_gift_id` INT NOT NULL,
  PRIMARY KEY (`gift_spec_id`, `gifts_gift_id`),
  INDEX `fk_gift_specification_gifts1_idx` (`gifts_gift_id` ASC),
  CONSTRAINT `fk_gift_specification_gifts1`
    FOREIGN KEY (`gifts_gift_id`)
    REFERENCES `FinalProject`.`gifts` (`gift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FinalProject`.`organizations_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FinalProject`.`organizations_copy1` (
  `organization_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`organization_id`),
  INDEX `name` (`name`(4) ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
