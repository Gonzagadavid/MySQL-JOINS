# Gabarito


## Exercícios de Fixação

Para a resolver os exercícios de fixação, será usado o banco de dados final_space_db, execute o script abaixo no seu MySQL Workbench:

```mysql
DROP SCHEMA IF EXISTS final_space_db ;

CREATE SCHEMA IF NOT EXISTS final_space_db ;
USE final_space_db ;

CREATE TABLE IF NOT EXISTS final_space_db.Location (
    Location_id INT NOT NULL AUTO_INCREMENT,
    Location_Name VARCHAR(45) NOT NULL,
    Location_Type VARCHAR(45) NOT NULL,
    PRIMARY KEY (Location_id)
);

CREATE TABLE IF NOT EXISTS final_space_db.Specie (
    Specie_id INT NOT NULL AUTO_INCREMENT,
    Specie_Name VARCHAR(45) NOT NULL,
    PRIMARY KEY (Specie_id)
);

CREATE TABLE IF NOT EXISTS final_space_db.Character (
    Character_id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Origin INT NULL,
    Specie INT NULL,
    PRIMARY KEY (Character_id),
    FOREIGN KEY (Origin)
        REFERENCES final_space_db.Location (Location_id),
    FOREIGN KEY (Specie)
        REFERENCES final_space_db.Specie (Specie_id)
);

INSERT INTO final_space_db.Location( 
  Location_id,
  Location_Name,
  Location_Type
  )
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
      (12, 'Invictus Prison', 'Dimension'),
      (13, 'Tryvuulian', 'Planet'),
      (14, 'Hatched', 'Planet');
    
INSERT INTO final_space_db.Specie(Specie_id, Specie_Name)
  VALUES
    (1, 'Human'),
    (2, 'Ventrexian'),
    (3, 'Robot'),
    (4, 'Serepentian'),
    (5, 'Tryvuulian'),
    (6, 'Artificial Intelligence'),
    (7, 'Titan'),
    (8, 'Cosmic Entity'),
    (9, 'Energy being'),
    (10, 'Alien'),
    (11, 'Hooblot'),
    (12, 'Cyborg'),
    (13, 'Fire Snake'),
    (14, 'Tiger Tiger');
    
INSERT INTO final_space_db.Character(
  Character_id,
  Name,
  Origin,
  Specie
)
  VALUES
    (1, 'Gary Goodspeed', 1, 1),
    (2, 'Mooncake', NULL, NULL),
    (3, 'Quinn Ergon', 1, 1),
    (4, 'Little Cato', 11, 2),
    (5, 'Avocato', 11, 2),
    (6, 'KVN', 1, 3),
    (7, 'Ash Graven', 10, 4),
    (8, 'Fox', 13, 5),
    (9, 'H.U.E', NULL, 6),
    (10, 'Tribore Menendez',14, NULL),
    (11, 'Clarence', NULL, NULL),
    (12, 'Biskit', NULL, 14),
    (13, 'Quatronostro Menendez', 14, NULL),
    (14, 'Lord Commander', NULL, NULL),
    (15, 'Sheryl Goodspeed', 1, 1),
    (16, 'Bolo', 2, 7),
    (17, 'Invictus', 2, 7),
    (18, 'John Goodspeed', 1, 1),
    (19, 'A.V.A', NULL, 6),
    (20, 'Evra', 2, 9),
    (21, 'Queen of Ventrexia', 11, 2),
    (22, 'King of Ventrexia', 11, 2),
    (23, 'Mega-KVN', 1, 3),
    (24, 'Melanie Dewinter',3, 11),
    (25, 'Harp Graven', 10, 4),
    (26, 'Shannon Thunder', 1, 1),
    (27, 'David Dewinter', 3, 11),
    (28, 'Meowlapeño', 3, 2),
    (29, 'Fraskenhaur', NULL, 10),
    (30, 'Oreskis"',2, 7 );
    
```
---
&nbsp;

# INNER JOIN

1. Escreva uma query que retorne uma coluna com o nome dos personagem e uma coluna com o nome da sua espécie.  
*Dica: Quando queremos usar uma palavra reservada do mysql para referenciar uma tabela, podemos usar a crase, como no caso desse banco que está sendo usado para os exercicios de fixação, ele possui uma tabela com o nome de Character, porém CHARACTER é uma palavra reservada, então usamos* &#96;*Character*&#96; *para referenciar a tabela*

```mysql
USE final_space_db;

SELECT 
    C.Name, S.Specie_Name
FROM
    `Character` AS C
        INNER JOIN
    Specie AS S ON C.Specie = S.Specie_id;

```
*Note que para ter relação entre as colunas das tabelas os nomes não precisam ser iguais*

2. Escreva uma querie que retorne uma coluna com os nomes dos personagens e uma coluna com o nome do seu local de origem.

```mysql
USE final_space_db;

SELECT 
    C.Name, L.Location_Name
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id;

```

3. Em uma query retorne o nome do personagem, sua espécie e o lugar de origem.

```mysql
USE final_space_db;

SELECT 
    C.Name, S.Specie_Name, L.Location_name
FROM
    `Character` AS C
        INNER JOIN
    Specie AS S ON C.Specie = S.Specie_id
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id;

```
4. Escreva uma query que retornara uma coluna com o nome da espécie, nomeie essa coluna como `Especie` e uma coluna com a quantidade de personagens daquela espécie, nomeie essa coluna como `Quantidade`.

```mysql
  USE final_space_db;

SELECT 
    S.Specie_Name AS `Especie`, COUNT(C.Name) AS `Quantidade`
FROM
    `Character` AS C
        INNER JOIN
    Specie AS S ON C.Specie = S.Specie_id
GROUP BY S.Specie_Name;

```

5. Escreva uma query que retornara uma coluna com o nome do Local, nomeie essa coluna como `Local de origem` e uma coluna com a quantidade de personagens que possuem origem desse local, nomeie essa coluna como `Quantidade`.

```mysql
USE final_space_db;

SELECT 
    L.Location_Name AS `Local`, COUNT(C.Name) AS `Quantidade`
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id
GROUP BY L.Location_Name

```

