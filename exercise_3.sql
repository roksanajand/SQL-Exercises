-- a) Add country code (+48) to phone numbers
-- Increased column length from 15 to 20 to accommodate the prefix
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon TYPE character varying(20);

UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48) ', telefon)
WHERE telefon IS NOT NULL;

-- b) Modify the phone attribute in the "pracownicy" table to format numbers 
-- with hyphens in the pattern: ‘555-222-333’
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT(
  SUBSTRING(telefon, 7, 3), '-', 
  SUBSTRING(telefon, 10, 3), '-', 
  SUBSTRING(telefon, 13)
)
WHERE telefon IS NOT NULL;

-- c) Display employee data with the longest last name in uppercase
SELECT *
FROM ksiegowosc.pracownicy
ORDER BY LENGTH(nazwisko) DESC
LIMIT 1;


-- d) Display employee data and their salaries encrypted using the MD5 algorithm
SELECT MD5(CONCAT(p.imie, p.nazwisko, p.adres, p.telefon, 
                  CAST(ksiegowosc.pensje.kwota AS VARCHAR))) AS encrypted_data
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje ON w.id_pensji = ksiegowosc.pensje.id_pensji;

-- e) Display employees, their salaries, and bonuses using a left join
SELECT p.imie, p.nazwisko, ksiegowosc.pensje.kwota AS salary, ksiegowosc.premie.kwota AS bonus
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.premie ON w.id_premii = ksiegowosc.premie.id_premii
LEFT JOIN ksiegowosc.pensje ON w.id_pensji = ksiegowosc.pensje.id_pensji;

-- f) Generate a report (query) that returns the following result for each employee 
-- according to the template below:
-- Example output:
-- Employee Jan Nowak, on 7.08.2017 received a total salary of 7000 PLN, 
-- where the base salary was: 5000 PLN, bonus: 2000 PLN

SELECT 
    'Employee ' || p.imie || ' ' || p.nazwisko || ', on ' || w.data || 
    ' received a total salary of ' || (pp.kwota + COALESCE(pre.kwota, 0)) || ' PLN, ' ||
    'where the base salary was: ' || pp.kwota || ' PLN, bonus: ' || COALESCE(pre.kwota, 0) || ' PLN' AS report
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.premie pre ON w.id_premii = pre.id_premii
LEFT JOIN ksiegowosc.pensje pp ON w.id_pensji = pp.id_pensji;
