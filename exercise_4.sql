-- Task 1
CREATE OR REPLACE FUNCTION generate_fibonacci(n INT)
RETURNS TABLE (fib_value BIGINT) -- function returns a table with fib_value
AS $$
DECLARE -- initialize variables at the beginning
-- starting the sequence with two 1s
    a BIGINT := 1;
    b BIGINT := 1;
    i INT := 1;
BEGIN
    WHILE i <= n LOOP -- loop while i is <= n
        fib_value := a;
        RETURN NEXT;

        a := b; -- assign b to a, moving to the next number in the sequence
        b := a + fib_value; -- sum of the two previous numbers
        i := i + 1; -- increment i by 1 to move to the next term
    END LOOP; -- end of the loop
END;
$$ LANGUAGE plpgsql;

-- Calling the function
SELECT * FROM generate_fibonacci(10); -- generating Fibonacci sequence for 10 terms



-- Using a procedure to print Fibonacci numbers
CREATE OR REPLACE PROCEDURE print_fib(n INT)
LANGUAGE plpgsql
AS $$ 
DECLARE
    counter INT := 1;
    fib_number BIGINT;
BEGIN
    WHILE counter <= n LOOP
        fib_number := (SELECT fib_value FROM generate_fibonacci(counter) LIMIT 1);
        RAISE NOTICE 'Fib number %: %', counter, fib_number;
        counter := counter + 1; 
    END LOOP;
END;
$$;

-- Task 2

-- Function to convert last names to uppercase before inserting/updating a record
CREATE OR REPLACE FUNCTION uppercase_lastname()
RETURNS TRIGGER AS $$
BEGIN
  NEW.lastname := UPPER(NEW.lastname); -- convert the new last name to uppercase
  RETURN NEW; -- return the modified record
  -- NEW contains the values of the new record
END;
$$ LANGUAGE plpgsql;

-- Trigger that executes the function before inserting or updating a record
CREATE TRIGGER uppercase_lastname_trigger
BEFORE INSERT OR UPDATE ON person.person
FOR EACH ROW -- the trigger is fired for each inserted or updated record
EXECUTE FUNCTION uppercase_lastname(); -- calls the function to convert last names to uppercase


-- Task 3
-- Create a trigger ‘taxRateMonitoring’ that displays an error message 
-- if the value in the ‘TaxRate’ field changes by more than 30%.

CREATE OR REPLACE FUNCTION CheckTaxChange() RETURNS TRIGGER AS $$
DECLARE
    -- Declare new variables
    oldTaxRate DECIMAL(18,2);
    newTaxRate DECIMAL(18,2);
    percentageChange DECIMAL(5,2);
BEGIN
    oldTaxRate := OLD.TaxRate; -- old TaxRate value
    newTaxRate := NEW.TaxRate; -- new TaxRate value

    -- Calculate percentage change
    percentageChange := ABS((newTaxRate - oldTaxRate) / oldTaxRate) * 100;

    -- Display an error message if the change exceeds 30%
    IF percentageChange > 30 THEN
        RAISE EXCEPTION 'Change in TaxRate exceeds 30%%'; -- %% is needed because % is treated as a special character
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Assign the function to a trigger
CREATE TRIGGER taxRateMonitoring
BEFORE UPDATE ON sales.salestaxrate
FOR EACH ROW -- triggers for each row
EXECUTE FUNCTION CheckTaxChange();
