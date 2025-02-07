-- Creating schema
-- CREATE SCHEMA ksiegowosc;

-- Creating tables
CREATE TABLE ksiegowosc.pracownicy
(
id_pracownika INT PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100) NOT NULL,
telefon VARCHAR(15) 
);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Table storing employee information';


CREATE TABLE ksiegowosc.godziny
(
id_godziny INT PRIMARY KEY,
data DATE NOT NULL,
liczba_godzin DECIMAL(10,2) NOT NULL,
id_pracownika INT NOT NULL
);
COMMENT ON TABLE ksiegowosc.godziny IS 'Table storing working hours information';


CREATE TABLE ksiegowosc.pensje
(
id_pensji INT PRIMARY KEY, 
 stanowisko VARCHAR(50) NOT NULL,
 kwota DECIMAL(10,2) NOT NULL
);
COMMENT ON TABLE ksiegowosc.pensje IS 'Table storing salary information';


CREATE TABLE ksiegowosc.premie
(
	id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(50) ,
	kwota DECIMAL(10,2)
);
COMMENT ON TABLE ksiegowosc.premie IS 'Table storing employee bonuses information';


CREATE TABLE ksiegowosc.wynagrodzenie
(
id_wynagrodzenia INT PRIMARY KEY,
data DATE NOT NULL,
id_pracownika INT NOT NULL,
id_pensji INT NOT NULL,
id_premii INT
);
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela przechowująca informacje o wynagrodzeniach pracownikow';


-- Adding foreign keys
 ALTER TABLE ksiegowosc.wynagrodzenie 
 ADD FOREIGN KEY (id_pracownika) 
 REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie 
ADD FOREIGN KEY (id_pensji) 
REFERENCES ksiegowosc.pensje(id_pensji);

 ALTER TABLE ksiegowosc.wynagrodzenie 
ADD FOREIGN KEY (id_premii) 
REFERENCES ksiegowosc.premie(id_premii);

ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika);

-- Inserting 10 records into tables
INSERT INTO ksiegowosc.pracownicy(id_pracownika, imie, nazwisko,
adres, telefon)
VALUES
(1,'Roksana','Jandura', 'Kwiatowa','11111111'),
(2, 'Weronika', 'Wojciechowska', 'Kwiatowa', '111222333'),
(3, 'Katarzyna', 'Wojciechowska', ' Kwiatowa ', '110220333'),
(4, 'Michał', 'Nowakowski', ' Słoneczna ', '444555666'),
(5, 'Anna', 'Kowalczyk', ' Lipowa ', '777888999'),
(6, 'Roberta', 'Zielinski', 'Brzozowa ', '000111222'),
(7, 'Monika', 'Wójcik', ' Różana ', '333444555'),
(8, 'Jan', 'Kaczmarek', ' Jesienna ', '666777888'),
(9, 'Julia', 'Witkowska', 'Topolowa ', '999000111'),
(10, 'Anna', 'Szymanski', 'Polna ', '222333444'),
(11,'Jola','Makowej','ul.POlna','00000000');



INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2023-11-01', 12, 1),
(2, '2023-11-02', 12, 1),
(3, '2023-11-03', 12, 1),
(4, '2023-11-04', 12, 1),
(5, '2023-11-05', 12, 1),
(6, '2023-11-06', 12, 1),
(7, '2023-11-07', 12, 1),
(8, '2023-11-08', 12, 1),
(9, '2023-11-09', 12, 1),
(10, '2023-11-10', 12, 1),
(11, '2023-11-11', 12, 1),
(12, '2023-11-12', 12, 1),
(13, '2023-11-13', 12, 1),
(14, '2023-11-14', 12, 1),
(15, '2023-11-15', 12, 1);


INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(16, '2023-11-01', 16, 2),
(17, '2023-11-02', 16, 2),
(18, '2023-11-03', 16, 2),
(19, '2023-11-04', 16, 2),
(20, '2023-11-05', 16, 2),
(21, '2023-11-06', 16, 2),
(22, '2023-11-07', 16, 2),
(23, '2023-11-08', 16, 2),
(24, '2023-11-09', 16, 2),
(25, '2023-11-10', 16, 2),
(26, '2023-11-11', 16, 2),
(27, '2023-11-12', 16, 2);


INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(28, '2023-11-01', 8, 3),
(29, '2023-11-02', 8, 3),
(30, '2023-11-03', 12, 3),
(31, '2023-11-04', 10, 3),
(32, '2023-11-05', 7, 3),
(33, '2023-11-06', 8, 3),
(34, '2023-11-07', 8, 3),
(35, '2023-11-08', 10, 3),
(36, '2023-11-09', 8, 3);


INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(37, '2023-11-01', 8, 4),
(38, '2023-11-02', 8, 5),
(39, '2023-11-03', 12, 6),
(40, '2023-11-04', 10, 7),
(41, '2023-11-05', 7, 8),
(42, '2023-11-06', 8, 9),
(43, '2023-11-07', 8, 10),
(100,'2023-11-01',140,11),
(101,'2023-11-02',21,11);



INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES 
(1, 'Kierownik', 5000.00),
(2, 'Pracownik', 3000.00),
(3, 'Kierownik', 2000.00),
(4, 'Pracownik magazyn', 2500.00),
(5, 'Kierownik HR', 5555.99),
(6, 'Pracownik PR', 3000.00),
(7, 'Pracownik HR', 4499.00),
(8, 'Pracownik biuro', 3000.00),
(9, 'Pracownik biuro', 5000.00),
(10, 'Pracownik biuro', 300.00),
(11,'Kierownik',20000);



INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES 
(1, 'Premia za wyniki', 1000.00),
(2, 'Premia świąteczna', 500.00),
(3, 'Premia za projekt nr5', 1300.00),
(4, 'Premia urodzinowa', 200.00),
(5, 'Premia za wyniki', 100.00),
(6, 'Brak premii',0),
(7, 'Premia za nadgodizny', 4000.00),
(8, 'Premia za zaangazowanie', 50.00),
(9, 'Premia za wyniki', 1000.00),
(10, 'Premia świąteczna', 500.00),
(11, 'Premia za nic',0);


INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_pensji, id_premii)
VALUES
(1, '2023-11-01', 1, 1, 1),
(2, '2023-11-02', 2,  2, 2),
(3, '2023-11-03', 3, 3, 3),
(4, '2023-11-04', 4,  4, 4),
(5, '2023-11-05', 5,  5, 5),
(6, '2023-11-07', 6,  6, NULL),
(7, '2023-11-08', 7,  7, 7),
(8, '2023-11-09', 8, 8, 8),
(9, '2023-11-10', 9,  9, 9),
(10,'2023-11-10',10,10,10),
(11,'2023-11-09',11,11,11);



-- Display employee ID and last name
SELECT ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy

-- Display employee IDs where salary > 1000
SELECT ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota > 1000;

--second option
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
WHERE id_pensji IN ( --tworzymy wewnetrzne zapytanie 
	SELECT id_pensji
	FROM ksiegowosc.pensje
	WHERE kwota > 1000
);


-- Display employees with no bonus and salary > 2000
SELECT ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
WHERE ksiegowosc.pensje.kwota > 2000 AND COALESCE(ksiegowosc.premie.kwota,0) = 0;

-- Display employees whose first name starts with 'J'
SELECT *
FROM ksiegowosc.pracownicy 
WHERE imie LIKE 'J%';

-- Display employees whose last name contains 'n' and first name ends with 'a'
SELECT *
FROM ksiegowosc.pracownicy 
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';

-- Display employees whose working hours exceeded 160h and calculate overtime
SELECT ksiegowosc.pracownicy.imie,
		ksiegowosc.pracownicy.nazwisko,
		GREATEST((SUM(ksiegowosc.godziny.liczba_godzin)-160),0) AS overtime_hours
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika
GROUP BY ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
HAVING (SUM(ksiegowosc.godziny.liczba_godzin)-160) >0;

---second option
SELECT ksiegowosc.pracownicy.imie,
		ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy 
WHERE pracownicy.id_pracownika IN  (
SELECT ksiegowosc.godziny.id_pracownika
FROM ksiegowosc.godziny
GROUP BY ksiegowosc.godziny.id_pracownika
HAVING (SUM(godziny.liczba_godzin) - 160) > 0 );


--Display employees whose salary is  <1500,3000>
SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota --, ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota >= 1500 AND ksiegowosc.pensje.kwota <= 3000;

-- Display first name and last name of employees who worked overtime but did not receive a bonus
SELECT
    ksiegowosc.pracownicy.imie,
    ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy -- main table
JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
-- joining the "godziny" (hours) table with "pracownicy" (employees) using id_pracownika
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.godziny.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
-- joining the "wynagrodzenie" (salary payments) table with "godziny" (hours)
-- even employees who do not have records in the "wynagrodzenie" table
-- but meet the overtime condition will be included
JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
-- joining the "premie" (bonuses) table with "wynagrodzenie" using id_premii
WHERE ksiegowosc.premie.kwota=0
GROUP BY ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
-- grouping by first name, last name, and employee ID to allow calculations on working hours and bonus amount
HAVING
    SUM(ksiegowosc.godziny.liczba_godzin) > 160;
-- HAVING filters results to only show employees who worked more than 160 hours

-- SECOND METHOD
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
WHERE p.id_pracownika IN (
    SELECT id_pracownika 
    FROM ksiegowosc.godziny
    GROUP BY id_pracownika
    HAVING SUM(liczba_godzin) > 160)
AND 
p.id_pracownika IN (
    SELECT id_pracownika
    FROM ksiegowosc.wynagrodzenie
    WHERE id_premii IS NULL);

-- Sort employees by salary (ascending)
SELECT ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.pensje.kwota
-- selecting employee ID from the "wynagrodzenie" table and salary from the "pensje" table
FROM ksiegowosc.wynagrodzenie , ksiegowosc.pensje 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji 
-- linking both tables using id_pensji (salary ID)
GROUP BY ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.pensje.kwota
-- grouping by employee ID and salary amount
ORDER BY ksiegowosc.pensje.kwota; -- sorting by salary

-- SECOND METHOD
SELECT pr.id_pracownika, pr.imie, pr.nazwisko, pen.kwota
FROM ksiegowosc.pracownicy pr
JOIN ksiegowosc.wynagrodzenie w ON pr.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pen ON w.id_pensji = pen.id_pensji
ORDER BY pen.kwota ASC; -- sorting results in ascending order


--Sort employees by salary and bonus in descending order
SELECT
    ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,
    SUM(ksiegowosc.pensje.kwota) + COALESCE(SUM(ksiegowosc.premie.kwota), 0) AS total_salary -- salary plus bonus
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
-- Joining tables based on keys (will display even if there are no records on the right side - salaries/bonuses)
GROUP BY ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
-- Grouping results by employee (ensuring total salary is calculated for each employee)
ORDER BY 
    total_salary DESC;
-- Defines sorting order - by descending total salary (highest to lowest)

-- Count and group employees by job title
SELECT stanowisko, COUNT(*) AS employee_count -- counts and labels as employee_count
FROM ksiegowosc.pensje
GROUP BY stanowisko; -- groups by job title


-- Calculate average, minimum, and maximum salary for a given job title (e.g., 'Manager' or any other)
SELECT 
    AVG(kwota) AS average_salary,
    MIN(kwota) AS minimum_salary,
    MAX(kwota) AS maximum_salary -- labels avg, min, max under these names
FROM ksiegowosc.pensje
WHERE stanowisko = 'Pracownik biuro';

-- Calculate the total salaries paid
SELECT SUM(ksiegowosc.pensje.kwota) + COALESCE(SUM(ksiegowosc.premie.kwota), 0) AS total_salaries -- total salary and bonuses
FROM ksiegowosc.wynagrodzenie -- main table
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii;
-- joining salary and bonus tables with the salary payments table, 
-- even if there are no corresponding records in the salary/bonus tables (LEFT JOIN ensures this)

-- Calculate total salaries within each job title
SELECT ksiegowosc.pensje.stanowisko, SUM(ksiegowosc.pensje.kwota) + COALESCE(SUM(premie.kwota), 0) AS total_salaries -- displays job title and total salaries
FROM ksiegowosc.wynagrodzenie -- main table
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
-- joining salary and bonus tables with salary payments, even if there are no corresponding records (LEFT JOIN ensures this)
GROUP BY ksiegowosc.pensje.stanowisko; -- groups total salaries by job title


-- Determine the number of bonuses awarded to employees in each job position
SELECT ksiegowosc.pensje.stanowisko, COUNT(ksiegowosc.premie.id_premii) AS bonus_count -- calculates number of bonuses (AS bonus_count) and displays job position
FROM ksiegowosc.wynagrodzenie  -- specifies that the main table is "wynagrodzenie" (salary payments)
JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii -- joins the "premie" (bonuses) table with "wynagrodzenie" using id_premii
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji -- joins the "pensje" (salaries) table with "wynagrodzenie" using id_pensji
GROUP BY stanowisko; -- groups results by job position (counts bonuses per position)

--  Remove employees whose salary is less than 1200
DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (
    SELECT ksiegowosc.pracownicy.id_pracownika
    FROM ksiegowosc.pracownicy 
    JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
    JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
    WHERE ksiegowosc.pensje.kwota < 1200
);

-- Update the "wynagrodzenie" (salary payments) table if an employee was removed from the "pracownicy" (employees) table
DELETE FROM ksiegowosc.wynagrodzenie
WHERE id_pracownika NOT IN (
    SELECT id_pracownika
    FROM ksiegowosc.pracownicy
);
