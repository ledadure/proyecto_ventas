DELIMITER //

CREATE FUNCTION CalcularStockTotal(
    p_id_producto INT
)
RETURNS INT
BEGIN
    DECLARE stock_total INT;

    SELECT STOCK INTO stock_total
    FROM Productos
    WHERE ID = p_id_producto;

    RETURN stock_total;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION CalcularMontoTotalPedido(
    p_id_pedido INT
)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT SUM(CANTIDAD * PRECIOUNITARIO) INTO total
    FROM DetallesPedido
    WHERE IDPEDIDO = p_id_pedido;

    RETURN total;
END //

DELIMITER ;


