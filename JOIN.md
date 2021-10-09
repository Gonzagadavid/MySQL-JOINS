# SQL JOIN
##  *INNER JOIN, LEFT JOIN, RIGHT JOIN, SELF JOIN, UNION e SUBQUERY*
---
## Sumário

- [O que vamos aprender?](#o-que-vamos-aprender)  
  - [Você será capaz de:](#você-será-capaz-de)  
- [Porque isso é importante ?](#por-que-isso-e-importante)  
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
  
## O que vamos aprender ?

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

## Porque isso é importante

Como você viu anteriormante um banco de dados relacionais possui varias tabelas que relaciona os dados entre si, usando indicadores como referência, sendo assim, muitas vezes as informções da qual você precisará para sua consulta pode estar em mais de uma tabela, surgindo a necessidade de unir duas ou mais tabelas em uma mesma query.

--- 