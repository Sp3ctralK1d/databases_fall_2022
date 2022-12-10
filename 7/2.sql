CREATE OR REPLACE FUNCTION log_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO log_table (timestamp) VALUES (now());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_timestamp
AFTER INSERT OR UPDATE OR DELETE ON target_table
FOR EACH ROW EXECUTE PROCEDURE log_timestamp();


CREATE OR REPLACE FUNCTION compute_age()
RETURNS TRIGGER AS $$
BEGIN
  NEW.age := date_part('year', now()) - date_part('year', NEW.date_of_birth);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER compute_age
BEFORE INSERT OR UPDATE ON person_table
FOR EACH ROW EXECUTE PROCEDURE compute_age();


CREATE OR REPLACE FUNCTION add_tax()
RETURNS TRIGGER AS $$
BEGIN
  NEW.price := NEW.price * 1.12;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER add_tax
BEFORE INSERT ON item_table
FOR EACH ROW EXECUTE PROCEDURE add_tax();


CREATE OR REPLACE FUNCTION prevent_deletion()
RETURNS TRIGGER AS $$
BEGIN
  RAISE EXCEPTION 'Deletion from this table is not allowed.';
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_deletion
INSTEAD OF DELETE ON target_table
FOR EACH ROW EXECUTE PROCEDURE prevent_deletion();


CREATE OR REPLACE FUNCTION launch_functions()
RETURNS TRIGGER AS $$
BEGIN
  -- Launch function 1.d
  PERFORM prevent_deletion();

  -- Launch function 1.e
  PERFORM compute_age();

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER launch_functions
AFTER INSERT OR UPDATE ON target_table
FOR EACH ROW EXECUTE PROCEDURE launch_functions();
