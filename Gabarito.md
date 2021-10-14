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

**1** - Escreva uma query que retorne **uma coluna** com o **nome dos personagens** e **uma coluna** com o **nome de sua espécie**.  

*Dica: Quando queremos usar uma palavra reservada do mysql para referenciar a uma tabela, devemos colocar a palavra entre o acento grave (`) .  Por exemplo, o banco de dados fornecido para os exercícios de fixação possui uma tabela com o nome de Character, uma palavra reservada, então ao referencia-lá   escrevemos:*  &#96;*Character*&#96;.
```mysql
USE final_space_db;

SELECT 
    C.Name, S.Specie_Name
FROM
    `Character` AS C
        INNER JOIN
    Specie AS S ON C.Specie = S.Specie_id;

```

&nbsp;

**2** - Escreva uma querie que retorne **uma coluna** com os **nomes dos personagens** e **uma coluna** com o **nome do seu local de origem**.

```mysql
USE final_space_db;

SELECT 
    C.Name, L.Location_Name
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id;

```
&nbsp;

**3** - Agora, retorne o **nome do personagem**, **sua espécie** e o **lugar de origem** em uma query.

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
&nbsp;

**4** - Escreva uma query que retornará **uma coluna** com o **nome da espécie**, nomeie como `Especie,` e **uma coluna** com a **quantidade de personagens daquela espécie**, nomeie como `Quantidade`. Por fim,  **organize a lista** de forma **ascendente** pela a quantidade.

```mysql
  USE final_space_db;

SELECT 
    S.Specie_Name AS `Especie`, COUNT(C.Name) AS `Quantidade`
FROM
    `Character` AS C
        INNER JOIN
    Specie AS S ON C.Specie = S.Specie_id
GROUP BY S.Specie_Name
ORDER BY Quantidade;
```
&nbsp;

**5** - Escreva uma query que retorne **uma coluna** com o **nome do Local**, nomeie como `Local de origem,` e **uma coluna** com **quantidade de personagens** que tenham origem desse local, nomeie como `Quantidade`. Por fim, **organize a lista** de forma **decrescente** pela a quantidade.

```mysql
USE final_space_db;

SELECT 
    L.Location_Name AS `Local`, COUNT(C.Name) AS `Quantidade`
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id
GROUP BY L.Location_Name
ORDER BY Quantidade DESC;

```
&nbsp;

**6** - Escreva uma query que **retorne os nomes dos personagens** que tem como **local de origem 'Earth'**. Por fim, **organize** os nomes em **ordem alfabética**.

```mysql
USE final_space_db;

SELECT 
    C.Name
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id
WHERE
    L.Location_Name = 'Earth'
ORDER BY C.Name;

```
&nbsp;

**7** - Escreva uma query que retorne **nome** e **local de origem** de todos personagens que são **de espécie 'Ventrexian'**. Por fim, **ordene** os nome de forma **alfabética-invertida**.

```mysql
USE final_space_db;

SELECT 
    C.Name, L.Location_name
FROM
    `Character` AS C
        INNER JOIN
    Location AS L ON C.Origin = L.Location_id
        INNER JOIN
    Specie AS S ON C.Specie = S.Specie_id
WHERE
    S.Specie_Name = 'Ventrexian'
ORDER BY C.Name DESC;

```
---
&nbsp;

# LEFT JOIN e RIGHT JOIN

**1** - Escreva uma query que exiba os **nomes de todos os personagem e sua espécie**. 
*Observação: O nome de todos os personagens deve aparecer,  inclusive os que não tem uma espécie definida.*

```mysql
USE final_space_db;

SELECT 
    C.Name, S.Specie_Name
FROM
    `Character` AS C
        LEFT JOIN
    Specie AS S ON C.Specie = S.Specie_id;

```
&nbsp;

**2** - Escreva uma query que exiba os **nomes de todos os personagem** e seu **local de origem**.
*Observação: O nome de todos os personagens deve aparecer, inclusive os que não tem um local de origem definido.*

```mysql
USE final_space_db;

SELECT 
    C.Name, L.Location_Name
FROM
    `Character` AS C
        LEFT JOIN
    Location AS L ON C.Origin = L.Location_id;

```
**3** - Escreva uma query que mostre **nome do personagem** e  **nome de todas as espécies**, mesmo as que não possuem personagem com aquela espécie.

```mysql
USE final_space_db;

SELECT 
    C.Name, S.Specie_Name
FROM
    `Character` AS C
        LEFT JOIN
    Specie AS S ON C.Specie = S.Specie_id;

```
&nbsp;

**4** - Escreva uma query que retorne **nome do personagem** e  **nome de todos locais de origem**, inclusive os personagens sem origem desse local.

```mysql
USE final_space_db;

SELECT 
    C.Name, L.Location_Name
FROM
    `Character` AS C
        RIGHT JOIN
    Location AS L ON C.Origin = L.Location_id;

```
&nbsp;

**5** - Escreva uma query que exiba **nomes de todos os personagem** e **sua espécie**. Se o personagem não tiver espécie definida, o campo da espécie deverá mostrar 'Unknown'. Por fim, nomeie a coluna espécie de 'Specie' e a coluna nomes dos personagens de 'Character'.

```mysql
USE final_space_db;

SELECT 
    C.Name AS 'Character',
    IFNULL(S.Specie_Name, 'Unknown') AS 'Specie'
FROM
    `Character` AS C
        LEFT JOIN
    Specie AS S ON C.Specie = S.Specie_id;

```
&nbsp;

**6** - Escreva uma query que retorne **nome do personagem**  e  **nome de todos locais de origem**. Nomeie  coluna nome do personagem de 'Character' e coluna do local de 'Local'. 
Caso não houver personagem com origem do local, o campo que apresentaria no nome do personagem deve mostrar 'Unknown'.

```mysql
USE final_space_db;

SELECT 
    IFNULL(C.Name, 'Unknown') AS 'Character',
    L.Location_Name AS 'Local'
FROM
    `Character` AS C
        RIGHT JOIN
    Location AS L ON C.Origin = L.Location_id;

```
---
&nbsp;

# SELF JOIN

**1** - Escreva uma query que exiba **nomes dos personagens** em uma coluna e **nomes dos personagens** com **mesmo local de origem** na coluna ao lado;

```mysql
USE final_space_db;

SELECT 
    C1.Name, C2.Name
FROM
    `Character` AS C1,
    `Character` AS C2
WHERE
    C1.Origin = C2.Origin;

```
&nbsp;

**2** - Escreva uma query que exiba **nomes dos personagens** em uma coluna e **nomes dos personagens** com **mesmo local de origem** na coluna ao lado. Agora, sem que nome do personagem apareça duas vezes na mesma linha.

```mysql
USE final_space_db;

SELECT 
    C1.Name, C2.Name
FROM
    `Character` AS C1,
    `Character` AS C2
WHERE
    C1.Origin = C2.Origin
        AND C1.Name <> C2.Name;

```
&nbsp;

**3** - Escreva uma query que exiba **nomes dos personagens** em uma coluna e **nomes dos personagens das mesma espécie** na coluna ao lado.

```mysql
USE final_space_db;

SELECT 
    C1.Name, C2.Name
FROM
    `Character` AS C1,
    `Character` AS C2
WHERE
    C1.Specie = C2.Specie;

```
&nbsp;

**4** - Escreva uma query que exiba **nomes dos personagens** em uma coluna e **nomes dos personagens das mesma espécie** na coluna ao lado. Agora, sem que nome do personagem apareça duas vezes na mesma linha.

```mysql
USE final_space_db;

SELECT 
    C1.Name, C2.Name
FROM
    `Character` AS C1,
    `Character` AS C2
WHERE
    C1.Specie = C2.Specie
        AND C1.Name <> C2.Name;

```

---
&nbsp;

# Vamos praticar!

## Exercícios

Para resolver os exercícios será o usado o banco de dados academia:

```mysql
```

**1** - Crie uma query que retorne **uma coluna** nomeada como 'Nome Completo' com o **nome completo** das pessoas associadas a academia, **uma coluna** com o **logradouro**  e outra com o **numero**. Utilize as tabelas Pessoa_Associada e Endereco.

```mysql
```

**2** - Crie uma query que retorne **uma coluna** nomeada como 'Nome Completo' com o **nome completo** das pessoas intrutoras da academia, **uma coluna** com o **logradouro**  e outra com o **numero**. Utilize as tabelas Pessoa_Treinadora e Endereco.

```mysql
```

**3** - Escreva uma query que retorne **uma coluna** nomeada como 'Nome Completo' com o **nome completo** das pessoas associadas a academia, **uma coluna** com **o nome do plano** dessa pessoa. Utilize as tabelas Pessoa_Associada e Plano.

```mysql
```

**4** - Escreva uma query que retorne **uma coluna** nomeada como 'Nome Completo' com o **nome completo** das pessoas associadas a academia, **uma coluna** com **telefone** e outra com o **cep** dessa pessoa. Utilize as tabelas Pessoa_Associada, Telefone e Endereco.

```mysql
```

**5** - Crie uma query que retorne **uma coluna** nomeada como 'Nome Completo' com o **nome completo** de **todas** as pessoas associadas a academia, e **uma coluna** com o **telefone de emergência** dessa pessoa, caso a pessoa não tiver telefone de emergencia, exiba 'PENDENTE'. Utilize as tabelas Pessoa_Associada e Telefone.

```mysql
```

**6** - Crie uma query que retorne **uma coluna** com o **nome** outra que com o **nome** da pessoa assoaciada que possui o mesmo **endereço**.

```mysql
```

**7** - Crie uma query que retorne **uma coluna** com o **nome** outra que com o **nome** da pessoa associada que treinam no mesmo **periodo**. Porém não deixe que o mesmo nome se repita na mesma linha.

```mysql
```

**8** - Crie uma query que retorne **uma coluna** com o **nome** outra que com o **nome** da pessoa treinadora que possui o mesmo **endereço**. Porém não deixe que o mesmo nome se repita na mesma linha.

```mysql
```

**9** - Crie uma query que retorne **uma coluna** nomeada como 'Nome Completo' com o **nome completo** das pessoas associadas a academia, e **uma coluna** com o **periodo** dessa pessoa. Utilize as tabelas Pessoa_Associada, Aula e Horario.

```mysql
```

**10** - Crie uma query que retorne **uma coluna** nomeada como 'Nome Completo' com o **nome completo** de **todas** as pessoas associadas a academia, e **uma coluna** com o **periodo** dessa pessoa, caso a pessoa não tiver periodo estipulado, exiba 'LIVRE'. Utilize as tabelas Pessoa_Associada, Aula e Horario.

```mysql
```
