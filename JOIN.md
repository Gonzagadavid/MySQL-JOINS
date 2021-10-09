# SQL JOIN
##  *INNER JOIN, LEFT JOIN, RIGHT JOIN, SELF JOIN, UNION e SUBQUERY*

---
&nbsp;

# Sumário

- [O que vamos aprender?](#o-que-vamos-aprender)  
  - [Você será capaz de:](#você-será-capaz-de)  
- [Porque isso é importante?](#porque-isso-é-importante)  
- [Conteúdos](#conteúdos)  
  - [INNER JOIN](#inner-join)  
  - [LEFT JOIN](#left-join)  
  - [RIGHT JOIN](#right-join)  
  - [SELF JOIN](#self-join)  
  - [UNION](#union)  
  - [SUBQUERY](#subquery)  
- [Vamos praticar!](#vamos-praticar!)  
- [Recursos Adicionais](#recursos-adicionais)  

---
&nbsp;

# O que vamos aprender?

Hoje você aprenderá a usar diversas formas de **Joins** no **MySQL**, unindo informações de **duas ou mais tabelas** com **informações relacionadas** entre si ou até mesmo da **mesma tabela** usando uma **determinada condição** de organização.  
*Vamos lá!* :rocket:

---

## Você será capaz de:  
- Escrever queries unindo informações de duas tabelas utilizando o INNER JOIN;
- Escrecer queries unindo duas tabelas, porém preservando todas as informções de uma delas, utilizando LEFT JOIN ou RIGHT JOIN;
- Escrever queries utilizando os dados da mesma tabela como se fosse duas tabelas distintas;
- Escrever queries que uni todas informações de duas tabelas utilizando o UNION ou UNION ALL;
- Escrever subqueries dentro de uma query.

---
&nbsp;

# Porque isso é importante?

Como você viu anteriormante o banco de dados relacional possui varias tabelas que relaciona os dados entre si, usando indicadores como referência, sendo assim, muitas vezes as informações da qual você precisará para sua consulta poderá estar em mais de uma tabela, surgindo a necessidade de unir duas ou mais tabelas em uma mesma query.

--- 
&nbsp;

# Conteúdos

## INNER JOIN

### Situação a qual será aplicado o INNER JOIN entre duas tabelas

Imagine uma situação onde você precisará consultar o telefone de clientes através do nome, e essas informações estão em tabelas separadas em seu banco de dados, da seguinte forma:

**Tabela Cliente:** 
| Cliente_id | Nome             |
| :---------:| :--------------: |
| 1          | Edgar Frank      |
| 2          | David Axmark     |
| 3          | Allan Larsson    |
| 4          | Michael Widenius |

&nbsp;

**Tabela Telefone:**
| Cliente_id | Numero           |
| :---------:| :--------------: |
| 1          | (19) 16044-3249  |
| 2          | (73) 45578-8629  |
| 3          | (23) 57692-8688  |
| 4          | (62) 19832-5762  |

&nbsp;

Dessa forma seria difíci associar o numero de telefone com o nome da pessoa.

### Primeiros passos para o uso do INNER JOIN

Ao trabalhar com duas ou mais tabelas você precisará se atentar com as colunas que possuem o mesmo nome, nesse caso seria a coluna Cliente_id, caso você não informe de qual tabela será extraida essa informação, um erro de ambiguidade será gerado. 
```shell
  Error Code: 1052. Column 'Cliente_id' in field list is ambiguous
```

Para evitar isso, informe a qual tabela essa coluna pertence, da seguinte forma: *Cliente.Cliente_id* para tabela Cliente e *Telefone.Cliente_id* para a tabela Telefone.  
**Apesar das colunas Numero e Nome não gerar esse erro, por não existir nas duas tabelas, É UMA BOA PRÁTICA informar de qual tabela essas informações estão sendo extraídas. Isso tornará sua query mais legível e de fácil entendimento para manutenções ou mudanças futuras feitas por você ou por outra pessoa**

&nbsp;

Sendo assim, o ínicio da sua query, onde é informado as colunas a serem exibidas, ficaria assim:  
```mysql
  SELECT 
    Cliente.Cliente_id, Cliente.Nome, Telefone.Numero
```
&nbsp;

### Usando o INNER JOIN com duas tabelas

Para unir as duas tabelas através das informações a qual a mesmas se relacionam é necessário usar uma condição através do WHERE informando qual das colunas devem ser usadas como referencia para a união dessas informações, nesse caso seria a coluna Cliente_id.

&nbsp;

Sendo assim, sua query ficaria assim:  
```mysql
 SELECT 
    Cliente.Cliente_id, Cliente.Nome, Telefone.Numero
FROM
    Cliente
        INNER JOIN
    Telefone
WHERE
    Cliente.Cliente_id = Telefone.Cliente_id;
```
&nbsp;

Retornando a seguinte tabela:

| Cliente_id | Nome             | Numero           |
| :---------:| :--------------: | :--------------: |
| 1          | Edgar Frank      | (19) 16044-3249  |
| 2          | David Axmark     | (73) 45578-8629  |
| 3          | Allan Larsson    | (23) 57692-8688  |
| 4          | Michael Widenius | (62) 19832-5762  |

## AS - Alias para tabelas

No bloco passado *(bloco 19)*, você aprendeu a usar o alias(AS) para nomear colunas em suas queries, porém ele também pode ser usado para nomear tabelas, se tornado um bom uso para essa situação, tornando sua query menos verbosa:

&nbsp;

```mysql
SELECT 
    C.Cliente_id, C.Nome, T.Numero
FROM
    Cliente AS C
        INNER JOIN
    Telefone AS T
WHERE
    C.Cliente_id = T.Cliente_id;
```
*Usar a primeira letra ou uma abreviação do nome da tabela como alias é muito comum e uma ótima opção*

&nbsp;

Obtendo o mesmo resultado:

| Cliente_id | Nome             | Numero           |
| :---------:| :--------------: | :--------------: |
| 1          | Edgar Frank      | (19) 16044-3249  |
| 2          | David Axmark     | (73) 45578-8629  |
| 3          | Allan Larsson    | (23) 57692-8688  |
| 4          | Michael Widenius | (62) 19832-5762  |

&nbsp;

### Situação a qual será aplicado o INNER JOIN com mais de duas tabelas

Imagine uma situação onde você precisará consultar o telefone e o email de clientes através do nome, e essas informações estão em 3 tabelas distintas, da seguinte forma:

**Tabela Cliente:** 
| Cliente_id | Nome             |
| :---------:| :--------------: |
| 1          | Edgar Frank      |
| 2          | David Axmark     |
| 3          | Allan Larsson    |
| 4          | Michael Widenius |

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
| 1          | frankcodd@codddate.com    |
| 2          | axmark@mariadb.com        |
| 3          | larssonallan@mysqlab.com  |
| 4          | Widenius@tcx.com          |

&nbsp;