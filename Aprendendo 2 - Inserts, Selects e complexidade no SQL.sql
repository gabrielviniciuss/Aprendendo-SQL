SELECT
    Max (Valor)
FROM
    Pedido_Venda


SELECT
    Min (Data_Adesao)
FROM
    Fidelidade


BEGIN TRANSACTION

SELECT
    Min (Valor)
FROM
    Pedido_Venda
WHERE
    Codigo_Forma_Pagamento = 5


SELECT
    Max (Valor)
FROM
    Pedido_Venda
WHERE
    DAY(DATA) = 04
    
    

SELECT * FROM Pedido_Venda


