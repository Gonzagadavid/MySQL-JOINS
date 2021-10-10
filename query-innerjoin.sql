USE exemplos;

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

    