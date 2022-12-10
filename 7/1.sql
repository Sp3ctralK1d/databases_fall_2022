-- a
CREATE OR REPLACE FUNCTION increment_value(value INT)
RETURNS INT AS $$
BEGIN
  value := value + 1;
  RETURN value;
END;
$$ LANGUAGE plpgsql;

-- b
CREATE OR REPLACE FUNCTION sum_two_numbers(num1 INT, num2 INT)
RETURNS INT AS $$
BEGIN
  RETURN num1 + num2;
END;
$$ LANGUAGE plpgsql;

-- c
CREATE OR REPLACE FUNCTION is_even(num INT)
RETURNS BOOLEAN AS $$
BEGIN
  IF num % 2 = 0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- d
CREATE OR REPLACE FUNCTION is_valid_password(password VARCHAR(255))
RETURNS BOOLEAN AS $$
BEGIN
  IF length(password) >= 8 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- e
CREATE OR REPLACE FUNCTION double_output(input INT)
RETURNS TABLE (output1 INT, output2 INT) AS $$
BEGIN
  RETURN QUERY SELECT input, input * 2;
END;
$$ LANGUAGE plpgsql;
