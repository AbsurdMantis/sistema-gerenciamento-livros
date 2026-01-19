--Stored procedure de exemplo pra resgatar o número de empréstimo por usuário fornecido

CREATE FUNCTION TotalLoans(user_id_param INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total FROM Loans WHERE user_id = user_id_param;
    RETURN total;
END;
$$;