DELIMITER //
CREATE FUNCTION stock(id_product INT)
	RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	DECLARE cantidad INT;
	DECLARE mensaje VARCHAR(100);
    SELECT stock INTO cantidad FROM products WHERE id = id_product;
	IF cantidad < 5 THEN
		SET mensaje = "Pocas unidades en existencia.";
        RETURN mensaje;
	ELSE
		SET mensaje = "Unidades disponibles.";
        RETURN CONCAT(cantidad, " ", mensaje);
	END IF;
END //

DELIMITER ;

SELECT stock(3);
