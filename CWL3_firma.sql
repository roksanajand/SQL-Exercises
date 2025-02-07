--tworzenie bazy danych
CREATE DATABASE firma;

--trzeba dac użycie bazy 
USE firma;

--tworzenie schematu
CREATE SCHEMA firma.rozliczenia;


CREATE TABLE rozliczenia.pracownicy
(
id_pracownika INT PRIMARY KEY,
imie VARCHAR(40) NOT NULL,
nazwisko VARCHAR(40) NOT NULL,
adres VARCHAR(50) NOT NULL,
telefon INT NOT NULL /tutaj mogło być bez NOT NULL VARCHAR(15)
);

CREATE TABLE rozliczenia.godziny
(
id_godziny INT PRIMARY KEY,
data DATE NOT NULL,
liczba_godzin INT NOT NULL, /tutaj DECIMAL(5,2) NOT NULL
id_pracownika INT NOT NULL
);

-- CREATE TABLE rozliczenia.pensje
-- (
-- id_pensji INT PRIMARY KEY, 
--  stanowisko VARCHAR(40) NOT NULL,
--  kwota DECIMAL(10,2) NOT NULL, 
--  id_premii INT NOT NULL /moglo byc bez not null
-- );

-- CREATE TABLE rozliczenia.premie
-- (
-- 	id_premii INT PRIMARY KEY,
-- 	rodzaj VARCHAR(40) NOT NULL,
-- 	kwota DECIMAL(10,2) NOT NULL
-- )

dodanie kluczy obcych
ALTER TABLE rozliczenia.godziny 
ADD FOREIGN KEY (id_pracownika) 
REFERENCES rozliczenia.pracownicy(id_pracownika);

-- ALTER TABLE rozliczenia.pensje 
-- ADD FOREIGN KEY (id_premii)
-- REFERENCES rozliczenia.premie(id_premii);


INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko,
adres, telefon)
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


-- INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
-- VALUES 
-- (1, '2023-10-24', 8, 1),
-- (2, '2023-1-23', 6, 2),
-- (3, '2023-8-29', 2, 3),
-- (4, '2023-6-24', 10, 4),
-- (5, '2023-10-24', 7, 5),
-- (6, '2023-7-4', 6, 6),
-- (7, '2023-10-2', 8, 7),
-- (8, '2023-9-28', 8, 8),
-- (9, '2023-4-1', 8, 9),
-- (10, '2023-6-13', 12, 10);

-- INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
-- VALUES 
-- (1, 'Premia za wyniki', 1000.00),
-- (2, 'Premia świąteczna', 500.00),
-- (3, 'Premia za projekt nr5', 1300.00),
-- (4, 'Premia urodzinowa', 200.00),
-- (5, 'Premia za wyniki', 100.00),
-- (6, 'Premia świąteczna', 540),
-- (7, 'Premia za nadgodizny', 4000.00),
-- (8, 'Premia za zaangazowanie', 50.00),
-- (9, 'Premia za wyniki', 1000.00),
-- (10, 'Premia świąteczna', 500.00);

--INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
-- VALUES 
-- (1, 'Kierownik', 5000.00, 10),
-- (2, 'Pracownik', 3000.00, 9),
-- (3, 'Kierownik', 2000.00, 8),
-- (4, 'Pracownik magazyn', 2500.00, 6),
-- (5, 'Kierownik HR', 500.00, 7),
-- (6, 'Pracownik PR', 3000.00, 1),
-- (7, 'Pracownik HR', 5000.00, 2),
-- (8, 'Pracownik biuro', 3000.00, 3),
-- (9, 'Pracownik biuro', 5000.00, 5),
-- (10, 'Pracownik biuro', 300.00, 4);

--wyswitelenia nazwiska pracownikow i adresy
-- SELECT nazwisko, adres
-- FROM rozliczenia.pracownicy;

przekonwertowanie date (godziny) aby była informacja jaki to dzien tygodnia i miesiac 
SELECT 
  DATE_PART('dow', data) AS day_of_week, 
  DATE_PART('month', data) AS monthh
FROM rozliczenia.godziny;

zmiana atrybutu i dodanie nowego 
ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto DECIMAL(10, 2);

aktualizacja kwoty netto
UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto/1.23;

