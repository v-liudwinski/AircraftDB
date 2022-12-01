-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TicketHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TicketHistory` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passenger` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `DateOfBirth` DATETIME NULL,
  `TicketHistory_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `TicketHistory_Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Passenger_TicketHistory1_idx` (`TicketHistory_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Passenger_TicketHistory1`
    FOREIGN KEY (`TicketHistory_Id`)
    REFERENCES `mydb`.`TicketHistory` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ticket` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `TicketHistory_Id` INT NOT NULL,
  `Passenger_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `TicketHistory_Id`, `Passenger_Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Ticket_TicketHistory1_idx` (`TicketHistory_Id` ASC) VISIBLE,
  INDEX `fk_Ticket_Passenger1_idx` (`Passenger_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_TicketHistory1`
    FOREIGN KEY (`TicketHistory_Id`)
    REFERENCES `mydb`.`TicketHistory` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Passenger1`
    FOREIGN KEY (`Passenger_Id`)
    REFERENCES `mydb`.`Passenger` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plane` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `MaxPassengersNumber` INT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Country` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Street` VARCHAR(45) NULL,
  `BuildingNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aeroport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aeroport` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Code` VARCHAR(45) NULL,
  `Address_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Address_Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Aeroport_Address_idx` (`Address_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Aeroport_Address`
    FOREIGN KEY (`Address_Id`)
    REFERENCES `mydb`.`Address` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ticket_has_Aeroport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ticket_has_Aeroport` (
  `Ticket_Id` INT NOT NULL,
  `Aeroport_Id` INT NOT NULL,
  `DepatureDate` DATETIME NULL,
  `ArrivalDate` DATETIME NULL,
  PRIMARY KEY (`Ticket_Id`, `Aeroport_Id`),
  INDEX `fk_Ticket_has_Aeroport_Aeroport1_idx` (`Aeroport_Id` ASC) VISIBLE,
  INDEX `fk_Ticket_has_Aeroport_Ticket1_idx` (`Ticket_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_has_Aeroport_Ticket1`
    FOREIGN KEY (`Ticket_Id`)
    REFERENCES `mydb`.`Ticket` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_has_Aeroport_Aeroport1`
    FOREIGN KEY (`Aeroport_Id`)
    REFERENCES `mydb`.`Aeroport` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ticket_has_Plain`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ticket_has_Plane` (
  `Ticket_Id` INT NOT NULL,
  `Plane_Id` INT NOT NULL,
  PRIMARY KEY (`Ticket_Id`, `Plane_Id`),
  INDEX `fk_Ticket_has_Plain_Plain1_idx` (`Plane_Id` ASC) VISIBLE,
  INDEX `fk_Ticket_has_Plain_Ticket1_idx` (`Ticket_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_has_Plain_Ticket1`
    FOREIGN KEY (`Ticket_Id`)
    REFERENCES `mydb`.`Ticket` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_has_Plain_Plain1`
    FOREIGN KEY (`Plane_Id`)
    REFERENCES `mydb`.`Plane` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
