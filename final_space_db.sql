
DROP SCHEMA IF EXISTS final_space_db ;

CREATE SCHEMA IF NOT EXISTS final_space_db ;
USE final_space_db ;

CREATE TABLE IF NOT EXISTS final_space_db.Location (
  Location_id INT NOT NULL AUTO_INCREMENT,
  Location_Name VARCHAR(45) NOT NULL,
  Location_Type VARCHAR(45) NOT NULL,
  PRIMARY KEY (Location_id));

CREATE TABLE IF NOT EXISTS final_space_db.Specie (
  Specie_id INT NOT NULL AUTO_INCREMENT,
  Specie_Name VARCHAR(45) NOT NULL,
  PRIMARY KEY (Specie_id));

CREATE TABLE IF NOT EXISTS final_space_db.Character (
  Character_id INT NOT NULL AUTO_INCREMENT,
  First_Name VARCHAR(45) NOT NULL,
  Last_Name VARCHAR(45) NULL,
  Origin INT NULL,
  Specie INT NULL,
  PRIMARY KEY (Character_id),
    FOREIGN KEY (Origin)
    REFERENCES final_space_db.Location (Location_id),
    FOREIGN KEY (Specie)
    REFERENCES final_space_db.Specie (Specie_id));

INSERT INTO final_space_db.Location( 
  Location_id,
  Location_Name,
  Location_Type)
    VALUES
      (1, 'Earth', 'Planet'),
		  (2, 'Final Space', 'Dimension'),
      (3, 'Tera Con Prime', 'Destroyed planet'),
		  (4, 'Inner Space', 'Dimension'),
      (5, 'Yarno', 'Planet'),
      (6, 'Dark Zone', 'Black hole'),
      (7, 'Deathcropolis', 'Gladiatorial Colosseum'),
      (8, 'Lazarus Trap', 'Trap'),
      (9, 'The Order of the Twelve', 'Temple'),
      (10, 'Serepentis', 'Planet'),
      (11, 'Ventrexia', 'Planet'),
      (12, 'Invictus Prison', 'Dimension');
    
INSERT INTO final_space_db.Specie(Specie_id, Specie_Name)
  VALUES
    (1, 'Human'),
    (2, 'Ventrexian'),
    (3, 'Robot'),
    (4, 'Serepentian'),
    (5, 'Tryvuulian'),
    (6, 'Artificial Intelligence')
    (7, 'Titan'),
    (8, 'Cosmic Entity'),
    (9, 'Energy being'),
    (10, 'Alien'),
    (11, 'Hooblot'),
    (12, 'Cyborg'),
    (13, 'Fire Snake');