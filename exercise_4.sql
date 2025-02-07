--zadanie1
CREATE OR REPLACE FUNCTION generate_fibonacci(n INT)
RETURNS TABLE (fib_value BIGINT) --funkcja zwróci table fib_value
AS $$
DECLARE --inicjalizacja zmiennych na początku
--zaczynamy ciąg od dwóch 1 
    a BIGINT := 1;
    b BIGINT := 1;
    i INT := 1;
BEGIN
    WHILE i <= n LOOP --pętla dopóki i bedzie <= n
        fib_value := a;
        RETURN NEXT;

		a := b; --przypisanie b do a, kolejnego do poprzedniego
        b := a + fib_value; -- dodawanie 2 poprzednich
        i := i + 1; --zwikeszmay i o 1 bo przechodizmy do kolejnego wyrazu
    END LOOP; --kończy pętle
END;
$$ LANGUAGE plpgsql;
--wywołanie procedury 
SELECT * FROM generate_fibonacci(10); --wywołanie fibonnaciego dla 10 wyrazów



--za pomocą procedury
CREATE OR REPLACE PROCEDURE print_fib(n INT)
LANGUAGE plpgsql
AS $$ 
DECLARE
counter INT :=1;
fib_number BIGINT;
BEGIN
WHILE counter<=n LOOP
fib_number:=generate_fibonacci(counter);
RAISE NOTICE 'Fib numver %: %',counter,fib_number;
counter:=counter+!;
END LOOP;
END
$$
--zadanie2

CREATE OR REPLACE FUNCTION uppercase_lastname()
RETURNS TRIGGER AS $$
BEGIN
  NEW.lastname := UPPER(NEW.lastname); --zmiana nowo wstawionegop nazwiska na nazwisko dużymi literami
  RETURN NEW; --zwraca zmodyfikoway rekord
  --NEW zawiera wartość nowego rekordu
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER uppercase_lastname_trigger
BEFORE INSERT OR UPDATE ON person.person
FOR EACH ROW --trigger jest wyzwalany dla każdego wstawionego lub aktualizowanego rekordu 
EXECUTE FUNCTION uppercase_lastname(); --wtedy wywołuje funkcje zmieniajaca litery na duże


--zadanie3
--Przygotuj trigger ‘taxRateMonitoring’, który wyświetli komunikat o błędzie, jeżeli nastąpi zmiana wartości w polu ‘TaxRate’ o więcej niż 30%.

CREATE OR REPLACE FUNCTION CheckTaxChange() RETURNS TRIGGER AS $$
DECLARE
--deklaracja nowych zmiennych
    oldTaxRate DECIMAL(18,2);
    newTaxRate DECIMAL(18,2);
    percentageChange DECIMAL(5,2);
BEGIN
    oldTaxRate := OLD.TaxRate; --stara wartość TaxRate
    newTaxRate := NEW.TaxRate; --nowa wartość

    --procentową zmianę 
    percentageChange := ABS((newTaxRate - oldTaxRate) / oldTaxRate) * 100;

    -- wyświetlić  komunikat o błędzie jesli >30%
    IF percentageChange > 30 THEN
        RAISE EXCEPTION 'Zmiana wartości pola TaxRate przekracza 30%%'; -- trzeba %% bo sam % traktuje jak znak specjalny
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--przypisanie funkcji do triggera
CREATE TRIGGER taxRateMonitoring
BEFORE UPDATE ON sales.salestaxrate
FOR EACH ROW --dla każdego wiersza
EXECUTE FUNCTION CheckTaxChange();