-- Creating the database
CREATE DATABASE firma;

-- Using the database
USE firma;

-- Creating the schema
CREATE SCHEMA firma.rozliczenia;

CREATE TABLE rozliczenia.pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(40) NOT NULL,
    nazwisko VARCHAR(40) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    telefon INT NOT NULL 
);

CREATE TABLE rozliczenia.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin INT NOT NULL,
    id_pracownika INT NOT NULL
);

CREATE TABLE rozliczenia.pensje (
    id_pensji INT PRIMARY KEY, 
    stanowisko VARCHAR(40) NOT NULL,
    kwota DECIMAL(10,2) NOT NULL, 
    id_premii INT
);

CREATE TABLE rozliczenia.premie (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(40) NOT NULL,
    kwota DECIMAL(10,2) NOT NULL
);

-- Adding foreign keys
ALTER TABLE rozliczenia.godziny 
ADD FOREIGN KEY (id_pracownika) 
REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje 
ADD FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie(id_premii);

INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1,'Roksana','Jandura', 'Kwiatowa','11111111'),
(2, 'Weronika', 'Wojciechowska', 'Kwiatowa', '111222333'),
(3, 'Katarzyna', 'Wojciechowska', ' Kwiatowa ', '110220333'),
(4, 'Michał', 'Nowakowski', ' Słoneczna ', '444555666'),
(5, 'Anna', 'Kowalczyk', ' Lipowa ', '777888999'),
(6, 'Piotr', 'Zieliński', 'Brzozowa ', '000111222'),
(7, 'Monika', 'Wójcik', ' Różana ', '333444555'),
(8, 'Tomasz', 'Kaczmarek', ' Jesienna ', '666777888'),
(9, 'Magdalena', 'Witkowska', 'Topolowa ', '999000111'),
(10, 'Krzysztof', 'Szymański', 'Polna ', '222333444');

INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES 
(1, '2023-10-24', 8, 1),
(2, '2023-1-23', 6, 2),
(3, '2023-8-29', 2, 3),
(4, '2023-6-24', 10, 4),
(5, '2023-10-24', 7, 5),
(6, '2023-7-4', 6, 6),
(7, '2023-10-2', 8, 7),
(8, '2023-9-28', 8, 8),
(9, '2023-4-1', 8, 9),
(10, '2023-6-13', 12, 10);

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES 
(1, 'Performance bonus', 1000.00),
(2, 'Holiday bonus', 500.00),
(3, 'Project no. 5 bonus', 1300.00),
(4, 'Birthday bonus', 200.00),
(5, 'Performance bonus', 100.00),
(6, 'Holiday bonus', 540),
(7, 'Overtime bonus', 4000.00),
(8, 'Engagement bonus', 50.00),
(9, 'Performance bonus', 1000.00),
(10, 'Holiday bonus', 500.00);

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES 
(1, 'Manager', 5000.00, 10),
(2, 'Employee', 3000.00, 9),
(3, 'Manager', 2000.00, 8),
(4, 'Warehouse worker', 2500.00, 6),
(5, 'HR Manager', 500.00, 7),
(6, 'PR Employee', 3000.00, 1),
(7, 'HR Employee', 5000.00, 2),
(8, 'Office Employee', 3000.00, 3),
(9, 'Office Employee', 5000.00, 5),
(10, 'Office Employee', 300.00, 4);

-- Display employees' last names and addresses
SELECT nazwisko, adres
FROM rozliczenia.pracownicy;

-- Convert date (hours) to extract day of the week and month
SELECT 
  DATE_PART('dow', data) AS day_of_week, 
  DATE_PART('month', data) AS monthh
FROM rozliczenia.godziny;

-- Rename an attribute and add a new column
ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto DECIMAL(10, 2);

-- Update net salary amount
UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto/1.23;
