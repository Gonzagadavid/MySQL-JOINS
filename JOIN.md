# SQL JOIN
##  *INNER JOIN, LEFT JOIN, RIGHT JOIN, SELF JOIN, UNION e SUBQUERY*

---
$ ~ $

# Sumário

- [O que vamos aprender?](#o-que-vamos-aprender)  
  - [Você será capaz de:](#você-será-capaz-de)  
- [Porque isso é importante?](#porque-isso-é-importante)  
- [Conteúdos](#conteudos)  
  - [INNER JOIN](#inner-join)  
  - [LEFT JOIN](#left-join)  
  - [RIGHT JOIN](#right-join)  
  - [SELF JOIN](#self-join)  
  - [UNION](#union)  
  - [SUBQUERY](#subquery)  
- [Vamos praticar!](#vamos-praticar!)  
- [Recursos Adicionais](#recursos-adicionais)  

---
$ ~ $

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
$ ~ $

# Porque isso é importante?

Como você viu anteriormante um banco de dados relacionais possui varias tabelas que relaciona os dados entre si, usando indicadores como referência, sendo assim, muitas vezes as informções da qual você precisará para sua consulta poderá estar em mais de uma tabela, surgindo a necessidade de unir duas ou mais tabelas em uma mesma query.

--- 
$ ~ $

# Conteúdo

## INNER JOIN

### Situação a qual será aplicado o INNER JOIN entre duas tabelas

Imagine uma situação onde você precisará consultar o telefone de clientes, e essas informações estão em tabelas separadas em seu banco de dados, da seguinte forma:

**Tabela Cliente:** 
| Cliente_id | Nome             |
| :---------:| :--------------: |
| 1          | Edgar Frank      |
| 2          | David Axmark     |
| 3          | Allan Larsson    |
| 4          | Michael Widenius |

$ ~ $

**Tabela Telefone:**
| Cliente_id | Nome             |
| :---------:| :--------------: |
| 1          | (19) 16044-3249  |
| 2          | (73) 45578-8629  |
| 3          | (23) 57692-8688  |
| 4          | (62) 19832-5762  |

$ ~ $

Dessa forma seria difíci associar o numero de telefone com o nome.

### Primeiros passos com o INNER JOIN

