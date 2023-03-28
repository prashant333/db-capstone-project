-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_capstone_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_capstone_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_capstone_project` DEFAULT CHARACTER SET utf8 ;
USE `db_capstone_project` ;

-- -----------------------------------------------------
-- Table `db_capstone_project`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone_project`.`Menu` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone_project`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone_project`.`staff` (
  `staffID` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  `RoleID` INT NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone_project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone_project`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `menu_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `staff_fk_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `menu_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `db_capstone_project`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_fk`
    FOREIGN KEY (`staffID`)
    REFERENCES `db_capstone_project`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone_project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone_project`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NOT NULL,
  `tableNo` INT NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `order_fk_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db_capstone_project`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone_project`.`Order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone_project`.`Order_delivery_status` (
  `DeliveryID` INT NOT NULL,
  `deliveryDate` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `staff_fk_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `delivery_staff_fk`
    FOREIGN KEY (`staffID`)
    REFERENCES `db_capstone_project`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone_project`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone_project`.`Customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `phone` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerID`),
  INDEX `booking_fk_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `booking_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `db_capstone_project`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
