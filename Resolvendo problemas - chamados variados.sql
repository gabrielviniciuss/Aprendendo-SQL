SELECT
    SUM(Pontos)
FROM
    Fidelidade



SELECT
    COUNT(*) AS TIPO_DE_PAGAMENTO,
    Tipo
FROM
    Forma_Pagamento
GROUP BY
    Tipo



SELECT
    SUM (Valor) AS VENDAS_POR_MES,
    MONTH(DATA) AS MES
FROM
    Pedido_Venda
GROUP BY
    MONTH(DATA)


SELECT
    CASE
        WHEN Estado = 'SP' THEN 'Cliente de São Paulo'
        ELSE 'Cliente fora de São Paulo'
    END AS Localidade_Do_Cliente,
    Nome,
    Estado
FROM
    Cliente

SELECT
    CASE
        WHEN Tipo like 'Cart%' Then 'Cartão'
        WHEN Tipo like 'Tic%' Then 'Refeição'
        ELSE 'Outra forma de pagamento'
    END AS Tipos_De_Pagamento,
    Nome
FROM
    Forma_Pagamento



SELECT * FROM Forma_Pagamento