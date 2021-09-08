SELECT
    P.Nome AS Produto,
    SUM (IPV.Quantidade) AS Total_De_Vendas
FROM
    Produto AS P
    INNER JOIN Item_Pedido_Venda AS IPV ON IPV.Codigo_Produto = P.Codigo
GROUP BY
    P.Nome




SELECT
    D.Nome_FANTASIA AS Distribuidor,
        CASE 
            WHEN SUM (PC.Valor) IS NULL THEN 0
            ELSE SUM (PC.Valor)
        END AS Valor_De_Compra,
    D.Estado,
    D.Cidade
FROM   
    Distribuidor AS D
    LEFT JOIN Pedido_Compra AS PC ON D.Codigo = PC.Codigo_Distribuidor
GROUP BY
    D.Nome_Fantasia,
    D.Estado,
    D.Cidade
ORDER BY
    SUM (PC.Valor) DESC



SELECT
    P.Nome AS Produto,
    CASE
        WHEN SUM(IPV.Quantidade) IS NULL THEN 0
        ELSE SUM(IPV.Quantidade)
    END AS Quantidade_Vendida
FROM
    Produto AS P
    LEFT JOIN Item_Pedido_Venda AS IPV ON P.Codigo_Marca = IPV.Codigo_Produto
WHERE
    IPV.Quantidade IS NULL
GROUP BY
    P.Nome










SELECT * FROM Produto  
SELECT * FROM Item_Pedido_Venda
