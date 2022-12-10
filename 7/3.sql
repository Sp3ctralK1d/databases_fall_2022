CREATE PROCEDURE increase_salary_with_discount(IN employee_id INT)
BEGIN
  DECLARE experience INT;
  DECLARE salary DECIMAL(10,2);
  DECLARE discount DECIMAL(10,2);

  SELECT experience, salary INTO experience, salary
  FROM employees
  WHERE id = employee_id;

  IF experience >= 5 THEN
    discount := 0.11;
  ELSE
    discount := 0.1;
  END IF;

  salary := salary + (salary * experience * 0.1) * (1 - discount);

  UPDATE employees
  SET salary = salary
  WHERE id = employee_id;
END;


CREATE PROCEDURE increase_salary_for_senior(IN employee_id INT)
BEGIN
  DECLARE age INT;
  DECLARE experience INT;
  DECLARE salary DECIMAL(10,2);
  DECLARE new_salary DECIMAL(10,2);

  SELECT age, experience, salary INTO age, experience, salary
  FROM employees
  WHERE id = employee_id;

  new_salary := salary + (salary * 0.15);

  IF age >= 40 THEN
    salary := new_salary;
    IF experience > 8 THEN
      salary := salary + (new_salary * 0.15 * (1 - 0.2));
    END IF;
  END IF;

  UPDATE employees
  SET salary = salary
  WHERE id = employee_id;
END;
