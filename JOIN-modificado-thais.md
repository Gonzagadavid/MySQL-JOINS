# SQL JOIN
##  *INNER JOIN, LEFT JOIN, RIGHT JOIN e SELF JOIN*

---
&nbsp;

# Sumário

- [O que vamos aprender?](#o-que-vamos-aprender)  
  - [Você será capaz de:](#você-será-capaz-de)  
- [Porque isso é importante?](#porque-isso-é-importante)  
- [JOIN](#join)  
- [INNER JOIN](#inner-join)  
- [LEFT JOIN e RIGHT JOIN](#left-join-e-right-join)  
- [SELF JOIN](#self-join)  
- [Vamos praticar!](#vamos-praticar!)  
- [Recursos Adicionais](#recursos-adicionais)  

---
&nbsp;

# O que vamos aprender?

Hoje, você aprenderá a utilizar os principais **Joins** no **MySQL**, associando **duas ou mais tabelas**  que tenham **dados relacionados** entre si, inclusive da **mesma tabela**, usando uma **determinada condição** de organização.  *Vamos lá!* :rocket:







---

## Você será capaz de:  
- Escrever queries combinando informações de duas tabelas utilizando o INNER JOIN;
- Escrever queries combinando duas tabelas e preservando todas as informções de uma delas, utilizando LEFT JOIN ou RIGHT JOIN;
- Escrever queries utilizando os dados da mesma tabela como se fosse duas tabelas distintas;

---
&nbsp;

# Porque isso é importante?

O **banco de dados relacional** armazena diversas tabelas que **relaciona os dados entre si** e utiliza indicadores como referência. Sendo assim, as informações da qual você precisará para sua consulta, poderá estar em mais de uma tabela, surgindo a necessidade de unir duas ou mais tabelas em uma mesma query.

---
&nbsp;

# JOIN

  O JOIN  tem um grande papel no banco de dados relacionais, sendo utilizado no SQL para trabalhar com dados de duas tabelas ou mais.

Quer acompanhar os exemplos na sua maquina? 

Execute o SQLScript abaixo no seu MYSQL Workbench!



  ```mysql
DROP SCHEMA IF EXISTS ComicCenter ;

CREATE SCHEMA IF NOT EXISTS ComicCenter ;
USE ComicCenter ;

CREATE TABLE IF NOT EXISTS ComicCenter.Cliente (
  Cliente_id INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (Cliente_id));
  
CREATE TABLE IF NOT EXISTS ComicCenter.Telefone (
  Cliente_id INT NOT NULL,
  Numero VARCHAR(45) NOT NULL,
  PRIMARY KEY (Numero),
    FOREIGN KEY (Cliente_id)
    REFERENCES ComicCenter.Cliente (Cliente_id)
  );

CREATE TABLE IF NOT EXISTS ComicCenter.Email (
  Cliente_id INT NOT NULL,
  Cliente_email VARCHAR(45) NOT NULL,
  PRIMARY KEY (Cliente_email),
    FOREIGN KEY (Cliente_id)
    REFERENCES ComicCenter.Cliente (Cliente_id)
  );
    
CREATE TABLE IF NOT EXISTS ComicCenter.Funcionario (
  Funcionario_id INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (Funcionario_id));
  
CREATE TABLE IF NOT EXISTS ComicCenter.Revista (
  Revista_id INT NOT NULL,
  Titulo VARCHAR(45) NOT NULL,
  Editora VARCHAR(45) NOT NULL,
  PRIMARY KEY (Revista_id));

INSERT INTO ComicCenter.Cliente (Cliente_id, Nome) 
  VALUES (1, 'Sheldon Cooper'), 
         (2, 'Amy Farrah Fowler	'),
         (3, 'Leonard Hofstadter'),
         (4, 'Bernadette Maryann');

INSERT INTO ComicCenter.Telefone (Cliente_id, Numero) 
  VALUES (1, '(19) 16044-3249'),
         (2, '(73) 45578-8629'),
         (3, '(23) 57692-8688'),
         (4, '(62) 19832-5762');

INSERT INTO ComicCenter.Email (Cliente_id, Cliente_email) 
  VALUES (1, 'protoncooper@scemail.com'),
         (2, 'badgirl@scemail.com'), 
         (3, 'luckyman@scemail.com'), 
         (4, 'candybern@mbmail.com');

INSERT INTO ComicCenter.Funcionario (Funcionario_id, Nome)
  VALUES (1, 'Stuart Bloom'),
         (2, 'Sheldon Cooper'),
         (3, 'Leonard Hofstadter'),
         (4, 'Raj Koothrappali');

INSERT INTO ComicCenter.Revista (Revista_id, Titulo, Editora) 
  VALUES (1, 'Vingadores', 'Marvel'),
         (2, 'Liga da Justiça', 'DC Comics'),
         (3, 'Batman', 'DC Comics'),
         (4, 'X-Men', 'Marvel'),
         (5, 'Homem Aranha', 'Marvel'),
         (6, 'Mulher Maravilha', 'Dc Comics');
  ```


---
&nbsp;

# INNER JOIN

## 1) INNER JOIN entre DUAS tabelas

Imagine que você precisará consultar o telefone de pessoas clientes através do nome e essas informações(nome e telefone) estão em tabelas diferentes em seu banco de dados, dessa forma:

**Tabela Cliente:** 

| Cliente_id | Nome               |
| :---------:| :----------------: |
| 1          | Sheldon Cooper     |
| 2          | Amy Farrah Fowler  |
| 3          | Leonard Hofstadter |
| 4          | Bernadette Maryann |

&nbsp;

**Tabela Telefone:**

| Cliente_id | Numero           |
| :---------:| :--------------: |
| 1          | (19) 16044-3249  |
| 2          | (73) 45578-8629  |
| 3          | (23) 57692-8688  |
| 4          | (62) 19832-5762  |

&nbsp;

Agora, consegue visualizar a dificuldade de associar o número de telefone ao nome da pessoa?

## Primeiros passos para o uso do INNER JOIN

Ao trabalhar com duas ou mais tabelas você precisará se atentar com as colunas que possuem o mesmo nome, nesse caso seria a coluna Cliente_id. Se não informar de qual tabela será extraida essa informação, um erro de ambiguidade será gerado!  

```shell
  Error Code: 1052. Column 'Cliente_id' in field list is ambiguous
```

Para evitar isso, informe da seguinte forma a qual tabela essa coluna pertence: 

*Cliente.Cliente_id* para tabela Cliente e *Telefone.Cliente_id* para a tabela Telefone.  
**Gerando erro ou não, será UMA BOA PRÁTICA informar de qual tabela as informações estão sendo extraídas. Com isso, tornará sua query mais legível e de fácil entendimento para manutenções ou mudanças futuras**

&nbsp;

Dessa forma, o ínicio da sua query, onde é informado as colunas a serem exibidas, ficará dessa forma:  
```mysql
  SELECT 
    Cliente.Cliente_id, Cliente.Nome, Telefone.Numero
```
&nbsp;

## Usando o INNER JOIN com duas tabelas

Para unir as duas tabelas através das informações a qual a mesmas se relacionam é necessário informar qual das colunas devem ser usadas como referencia para a união dessas informações através do ON ,  nesse caso seria a coluna Cliente_id.

&nbsp;

Sendo assim, sua query ficaria assim:  
```mysql
USE ComicCenter;

 SELECT 
    Cliente.Cliente_id, Cliente.Nome, Telefone.Numero
FROM
    Cliente
        INNER JOIN
    Telefone
ON
    Cliente.Cliente_id = Telefone.Cliente_id;
```
&nbsp;

Retornando a seguinte tabela:

| Cliente_id | Nome               | Numero           |
| :---------:| :-----------------:| :--------------: |
| 1          | Sheldon Cooper     | (19) 16044-3249  |
| 2          | Amy Farrah Fowler  | (73) 45578-8629  |
| 3          | Leonard Hofstadter | (23) 57692-8688  |
| 4          | Bernadette Maryann | (62) 19832-5762  |

## AS - Alias para tabelas

No bloco passado *(bloco 19)*, você aprendeu a usar o alias(AS) para nomear colunas em suas queries, porém ele também pode ser usado para nomear tabelas, se tornado um bom uso para essa situação, tornando sua query menos verbosa:

&nbsp;

```mysql
USE ComicCenter;

SELECT 
    C.Cliente_id, C.Nome, T.Numero
FROM
    Cliente AS C
        INNER JOIN
    Telefone AS T
ON
    C.Cliente_id = T.Cliente_id;
```
*Usar a primeira letra ou uma abreviação do nome da tabela como alias é muito comum e uma ótima opção*

&nbsp;

Obtendo o mesmo resultado:

| Cliente_id | Nome               | Numero           |
| :---------:| :----------------: | :--------------: |
| 1          | Sheldon Cooper     | (19) 16044-3249  |
| 2          | Amy Farrah Fowler  | (73) 45578-8629  |
| 3          | Leonard Hofstadter | (23) 57692-8688  |
| 4          | Bernadette Maryann | (62) 19832-5762  |

&nbsp;

## 2) INNER JOIN com MAIS de duas tabelas

Imagine que você precisará consultar o telefone e o e-mail de pessoas clientes através do nome, e essas informações estão em três tabelas distintas da seguinte forma:

**Tabela Cliente:** 

| Cliente_id | Nome               |
| :---------:| :----------------: |
| 1          | Sheldon Cooper     |
| 2          | Amy Farrah Fowler  |
| 3          | Leonard Hofstadter |
| 4          | Bernadette Maryann |

&nbsp;

**Tabela Telefone:**

| Cliente_id | Numero           |
| :---------:| :--------------: |
| 1          | (19) 16044-3249  |
| 2          | (73) 45578-8629  |
| 3          | (23) 57692-8688  |
| 4          | (62) 19832-5762  |

&nbsp;

**Tabela Email:**

| Cliente_id | Cliente_email             |
| :---------:| :-----------------------: |
| 1          | protoncooper@scemail.com  |
| 2          | badgirl@scemail.com       |
| 3          | luckyman@scemail.com      |
| 4          | candybern@mbmail.com      |

&nbsp;

## Usando o INNER JOIN com mais de duas tabelas

Para usar mais de um INNER JOIN na mesma query, basta adiciona-lo logo depois do primeiro, usando no **ON** a coluna relacionada a uma coluna de qualquer tabela declarada anteriormente.

&nbsp;

```mysql
USE ComicCenter;

SELECT 
    C.Cliente_id, C.Nome, T.Numero, E.Cliente_email
FROM
    Cliente AS C
        INNER JOIN
    Telefone AS T
ON
    C.Cliente_id = T.Cliente_id
            INNER JOIN
    Email AS E
ON E.Cliente_id = C.Cliente_id;
```
&nbsp;

Retornando o seguinte resultado:

| Cliente_id | Nome               | Numero           | Cliente_email             |
| :---------:| :----------------: | :--------------: | :-----------------------: |
| 1          | Sheldon Cooper     | (19) 16044-3249  | protoncooper@scemail.com  |
| 2          | Amy Farrah Fowler  | (73) 45578-8629  | badgirl@scemail.com       |
| 3          | Leonard Hofstadter | (23) 57692-8688  | luckyman@scemail.com      |
| 4          | Bernadette Maryann | (62) 19832-5762  | candybern@mbmail.com      |



---
&nbsp;

# 3) LEFT JOIN e RIGHT JOIN

Para entender LEFT JOIN e RIGHT JOIN, observe as duas tabelas a seguir: 

**Tabela Cliente:** 

| Cliente_id | Nome               |
| :---------:| :----------------: |
| 1          | Sheldon Cooper     |
| 2          | Amy Farrah Fowler  |
| 3          | Leonard Hofstadter |
| 4          | Bernadette Maryann |



**Tabela Funcionario:** 

| Funcionario_id | Nome               |
| :-------------:| :----------------: |
| 1              | Stuart Bloom       |
| 2              | Sheldon Cooper     |
| 3              | Leonard Hofstadter |
| 4              | Raj Koothrappali   |

Note que algumas pessoas que estão na tabela Cliente, também estão na tabela Funcionário.

Para indentificar essas pessoas basta utilizar o INNER JOIN:

&nbsp;

```mysql
USE ComicCenter;

SELECT 
        C.Cliente_id, C.Nome, F.Funcionario_id, F.Nome
FROM
        Cliente AS C
                INNER JOIN
        Funcionario AS F
ON
        C.Nome = F.Nome;
```
&nbsp;


| Cliente_id | Nome               | Funcionario_id | Nome               |
| :---------:| :----------------: | :-------------:| :----------------: |
| 1          | Sheldon Cooper     | 2              | Sheldon Cooper     |
| 3          | Leonard Hofstadter | 3              | Leonard Hofstadter |

&nbsp;

Observe que o INNER JOIN retornou apenas as pessoas presentes nas duas tabelas.

## Aplicação de LEFT JOIN

Agora, imagine que você precise de uma consulta que retorne os dados de todas as pessoas clientes, pessoa funcionaria ou não.  Caso seja pessoa funcionaria, você deseja que os dados da tabela Funcionario dessa pessoa sejam exibidos. 

## Usando o LEFT JOIN

Para essa situação é utilizado o LEFT JOIN, pois manterá TODOS os dados da **primeira tabela** declarada, mesmo que algum dado não exista na segunda tabela, sendo preenchido com a palavra NULL.  
*(O posicionamento das colunas não influenciam, apenas a ordem em que as tabelas são declaradas no LEFT JOIN)*

&nbsp;

```mysql
USE ComicCenter;

SELECT 
        C.Cliente_id, C.Nome, F.Funcionario_id, F.Nome
FROM
        Cliente AS C
                LEFT JOIN
        Funcionario AS F
ON
        C.Nome = F.Nome;
```
&nbsp;

| Cliente_id | Nome               | Funcionario_id | Nome               |
| :---------:| :----------------: | :-------------:| :----------------: |
| 1          | Sheldon Cooper     | 2              | Sheldon Cooper     |
| 2          | Amy Farrah Fowler  | NULL           | NULL               |
| 3          | Leonard Hofstadter | 3              | Leonard Hofstadter |
| 4          | Bernadette Maryann | NULL           | NULL               |

&nbsp;

## Aplicação de RIGHT JOIN

Imagine que você queira que sua consulta retorne os dados de todas as pessoas funcionarias, pessoa cliente ou não. Caso seja pessoa cliente, você deseja que os dados da tabela Ciente dessa pessoa sejam exibidos.

## Usando o RIGHT JOIN

Para essa situação pode ser utilizado o RIGHT JOIN, pois ele manterá TODOS os dados da **segunda tabela** declarada, mesmo que algum dado não exista na primeira tabela, sendo preenchido com a palavra NULL. 
*(O posicionamento das colunas não influenciam, apenas a ordem em que as tabelas são declaradas no RIGHT JOIN)*

&nbsp;

```mysql
USE ComicCenter;

SELECT 
        C.Cliente_id, C.Nome, F.Funcionario_id, F.Nome
FROM
        Cliente AS C
                RIGHT JOIN
        Funcionario AS F
ON
        C.Nome = F.Nome;
```

&nbsp;

| Cliente_id | Nome               | Funcionario_id | Nome               |
| :---------:| :----------------: | :-------------:| :----------------: |
| NULL       | NULL               | 1              | Stuart Bloom       |
| 1          | Amy Farrah Fowler  | 2              | Sheldon Cooper     |
| 3          | Leonard Hofstadter | 3              | Leonard Hofstadter |
| NULL       | NULL               | 4              | Raj Koothrappali   |

---
&nbsp;

# 4)SELF JOIN

## Situação a qual será aplicado o SELF JOIN

Para entender melhor o SELF JOIN, utilizaremos a seguinte tabela:

**Tabela Revista:**
| Revista_id | Titulo           | Editora   |
| :--------- | :--------------- | :-------- |
| 1          | Vingadores       | Marvel    |
| 2          | Liga da Justiça  | DC Comics |
| 3          | Batman           | DC Comics |
| 4          | X-Men            | Marvel    |
| 5          | Homem Aranha     | Marvel    |
| 6          | Mulher Maravilha | DC Comics |

Agora, imagine que na sua consulta você precisará exibir todas as revistas da mesma editora para cada revista presente na tabela.

## Usando o SELF JOIN

Para situações como essa pode ser usado o SELF JOIN, pois você irá **relacionar informações de uma tabela com informações contidas na mesma**.
Diferente dos outros JOINS o SELF JOIN, não precisará declarar na query. Basta declarar a mesma tabela duas vezes separando por uma virgula e usar alias(AS) diferente para as duas, usando um WHERE para informar os dados a serem relacionados.

&nbsp;

```mysql
USE ComicCenter;

SELECT 
    R1.Titulo, R1.Editora, R2.Titulo, R2.Editora
FROM
    Revista AS R1,
    Revista AS R2
WHERE
    R1.Editora = R2.Editora;
```
&nbsp;

| Titulo           | Editora   | Titulo           | Editora   |
| :--------------- | :-------- | :--------------- | :-------- |
| Homem Aranha     | Marvel    | Vingadores       | Marvel    |
| X-Men            | Marvel    | Vingadores       | Marvel    |
| Vingadores       | Marvel    | Vingadores       | Marvel    |
| Mulher Maravilha | DC Comics | Liga da Justiça  | DC Comics |
| Batman           | DC Comics | Liga da Justiça  | DC Comics |
| Liga da Justiça  | DC Comics | Liga da Justiça  | DC Comics |
| Mulher Maravilha | DC Comics | Batman           | DC Comics |
| Batman           | DC Comics | Batman           | DC Comics |
| Liga da Justiça  | DC Comics | Batman           | DC Comics |
| Homem Aranha     | Marvel    | X-Men            | Marvel    |
| X-Men            | Marvel    | X-Men            | Marvel    |
| Vingadores       | Marvel    | X-Men            | Marvel    |
| Homem Aranha     | Marvel    | Homem Aranha     | Marvel    |
| X-Men            | Marvel    | Homem Aranha     | Marvel    |
| Vingadores       | Marvel    | Homem Aranha     | Marvel    |
| Mulher Maravilha | DC Comics | Mulher Maravilha | DC Comics |
| Batman           | DC Comics | Mulher Maravilha | DC Comics |
| Liga da Justiça  | DC Comics | Mulher Maravilha | DC Comics |

&nbsp;

Note que os Titulos que repetiram foram o do segundo alias(AS) declarado, ou seja, R2. Também poderá perceber que os dados da mesma revista de comparam consigo mesmo, isso porque o comportamento da tabela no SELF JOIN é semelhante a de duas tabelas distintas.
Para tornar a consulta com uma melhor visualização, você poderá alterar a ordem do alias(AS), utilizar o WHERE para que uma informação não seja exibida consigo propria.

&nbsp;

```mysql
USE ComicCenter;

SELECT 
    R1.Titulo, R1.Editora, R2.Titulo, R2.Editora
FROM
    Revista AS R2,
    Revista AS R1
WHERE
    R1.Editora = R2.Editora
        AND R1.Titulo <> R2.Titulo;
```
&nbsp;

| Titulo           | Editora   | Titulo           | Editora   |
| :--------------- | :-------- | :--------------- | :-------- |
| Vingadores       | Marvel    | Homem Aranha     | Marvel    |
| Vingadores       | Marvel    | X-Men            | Marvel    |
| Liga da Justiça  | DC Comics | Mulher Maravilha | DC Comics |
| Liga da Justiça  | DC Comics | Batman           | DC Comics |
| Batman           | DC Comics | Mulher Maravilha | DC Comics |
| Batman           | DC Comics | Liga da Justiça  | DC Comics |
| X-Men            | Marvel    | Homem Aranha     | Marvel    |
| X-Men            | Marvel    | Vingadores       | Marvel    |
| Homem Aranha     | Marvel    | X-Men            | Marvel    |
| Homem Aranha     | Marvel    | Vingadores       | Marvel    |
| Mulher Maravilha | DC Comics | Batman           | DC Comics |
| Mulher Maravilha | DC Comics | Liga da Justiça  | DC Comics |