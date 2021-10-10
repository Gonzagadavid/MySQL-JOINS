
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `exemplos` ;

-- -----------------------------------------------------
-- Schema exemplos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exemplos` ;
USE `exemplos` ;

-- -----------------------------------------------------
-- Table `exemplos`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplos`.`Cliente` (
  `Cliente_id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cliente_id`));



-- -----------------------------------------------------
-- Table `exemplos`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplos`.`Telefone` (
  `Cliente_id` INT NOT NULL,
  `Numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero`),
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `exemplos`.`Cliente` (`Cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `exemplos`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exemplos`.`Email` (
  `Cliente_id` INT NOT NULL,
  `Cliente_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cliente_email`),
    FOREIGN KEY (`Cliente_id`)
    REFERENCES `exemplos`.`Cliente` (`Cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Data for table `exemplos`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `exemplos`;
INSERT INTO `exemplos`.`Cliente` (`Cliente_id`, `Nome`) VALUES (1, 'Edgar Frank');
INSERT INTO `exemplos`.`Cliente` (`Cliente_id`, `Nome`) VALUES (2, 'David Axmark');
INSERT INTO `exemplos`.`Cliente` (`Cliente_id`, `Nome`) VALUES (3, 'Allan Larsson');
INSERT INTO `exemplos`.`Cliente` (`Cliente_id`, `Nome`) VALUES (4, 'Michael Widenius');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exemplos`.`Telefone`
-- -----------------------------------------------------
START TRANSACTION;
USE `exemplos`;
INSERT INTO `exemplos`.`Telefone` (`Cliente_id`, `Numero`) VALUES (1, '(19) 16044-3249');
INSERT INTO `exemplos`.`Telefone` (`Cliente_id`, `Numero`) VALUES (2, '(73) 45578-8629');
INSERT INTO `exemplos`.`Telefone` (`Cliente_id`, `Numero`) VALUES (3, '(23) 57692-8688');
INSERT INTO `exemplos`.`Telefone` (`Cliente_id`, `Numero`) VALUES (4, '(62) 19832-5762');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exemplos`.`Email`
-- -----------------------------------------------------
START TRANSACTION;
USE `exemplos`;
INSERT INTO `exemplos`.`Email` (`Cliente_id`, `Cliente_email`) VALUES (1, 'frankcodd@codddate.com ');
INSERT INTO `exemplos`.`Email` (`Cliente_id`, `Cliente_email`) VALUES (2, 'axmark@mariadb.com ');
INSERT INTO `exemplos`.`Email` (`Cliente_id`, `Cliente_email`) VALUES (3, 'larssonallan@mysqlab.com ');
INSERT INTO `exemplos`.`Email` (`Cliente_id`, `Cliente_email`) VALUES (4, 'Widenius@tcx.com');

COMMIT;

