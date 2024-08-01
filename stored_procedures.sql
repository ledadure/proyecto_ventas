DELIMITER //

CREATE PROCEDURE InsertarProducto(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_precio DECIMAL(10, 2),
    IN p_stock INT
)
BEGIN
    INSERT INTO Productos (NOMBRE, DESCRIPCION, PRECIO, STOCK)
    VALUES (p_nombre, p_descripcion, p_precio, p_stock);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE ActualizarEstadoPedido(
    IN p_id INT,
    IN p_estado VARCHAR(50)
)
BEGIN
    UPDATE Pedidos
    SET ESTADO = p_estado
    WHERE ID = p_id;
END //

DELIMITER ;




