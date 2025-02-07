--CWL 4
--tworzenie schematu
-- CREATE SCHEMA ksiegowosc;

--tworzenie tabel
CREATE TABLE ksiegowosc.pracownicy
(
id_pracownika INT PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100) NOT NULL,
telefon VARCHAR(15) 
);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela przechowująca informacje o pracownikach';


CREATE TABLE ksiegowosc.godziny
(
id_godziny INT PRIMARY KEY,
data DATE NOT NULL,
liczba_godzin DECIMAL(10,2) NOT NULL,
id_pracownika INT NOT NULL
);
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela przechowująca informacje o godzinach';


CREATE TABLE ksiegowosc.pensje
(
id_pensji INT PRIMARY KEY, 
 stanowisko VARCHAR(50) NOT NULL,
 kwota DECIMAL(10,2) NOT NULL
);
COMMENT ON TABLE ksiegowosc.pensje IS 'Tabela przechowująca informacje o pensjach';


CREATE TABLE ksiegowosc.premie
(
	id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(50) ,
	kwota DECIMAL(10,2)
);
COMMENT ON TABLE ksiegowosc.premie IS 'Tabela przechowująca informacje o premiach pracownikow';


CREATE TABLE ksiegowosc.wynagrodzenie
(
id_wynagrodzenia INT PRIMARY KEY,
data DATE NOT NULL,
id_pracownika INT NOT NULL,
id_pensji INT NOT NULL,
id_premii INT
);
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela przechowująca informacje o wynagrodzeniach pracownikow';


-- dodanie kluczy obcych
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

--wypelnienie 10 rekordami tabel
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


-- Pracownik 1
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

-- Pracownik 2
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

-- Pracownik 3
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

--RESZTA PRACOWNIKOW
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



--a.wyswietlenie id_pracownika i nazwiska 
SELECT ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy

--b.wyswietlenie id_pracowników ktorych płaca>1000
SELECT ksiegowosc.pracownicy.id_pracownika--, ksiegowosc.pensje.kwota
FROM ksiegowosc.pracownicy -- bierzemy ta tabele jako nasza główną
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
--Łączymy tabelę ksiegowosc.pracownicy z tabelą ksiegowosc.wynagrodzenie na podstawie identyfikatora pracownika (id_pracownika). To oznacza, że zapytanie uwzględnia tylko te wiersze,
--które mają pasujące identyfikatory pracownika w obu tabelach.
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji --kolejne połaczenie 2 tabel za pomoca identyfikatora id_pensji
WHERE ksiegowosc.pensje.kwota > 1000;

--DRUGI SPOSOB
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
WHERE id_pensji IN ( --tworzymy wewnetrzne zapytanie 
	SELECT id_pensji
	FROM ksiegowosc.pensje
	WHERE kwota > 1000
);


--c.wyswietlenie id_pracownikow nieposiadajych premi, ktorych placa>2000
SELECT ksiegowosc.pracownicy.id_pracownika--, ksiegowosc.pensje.kwota --to bedziemy wyswietlac
FROM ksiegowosc.pracownicy --glowna tabelka
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
-- polaczenie tabelki pracownicy z wynagrodzenie za pomoca klucza od_pracownicy
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
--polaczenie tabelki wynagrodzenie z tabelka pensje za pomoca id_pensjii
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
-- polaczenie tabelki premie i wynagrodzenie
--left join daje nam to ze bedzie wyswietlac wszytskie rekordy z tabelii wynagrodznie (z lewej strony )
-- nawet jesli nie ma odpowieadjacych rekordow w tabelii premie 
WHERE ksiegowosc.pensje.kwota > 2000 AND COALESCE(ksiegowosc.premie.kwota,0) =0;
-- COALESCE Warunek ten sprawdza, czy kwota premii wynosi 0 lub jest NULL, co oznacza brak premii.


-- d.wyswietlenie pracownikow ktorych pierwsza litera imienia zaczyna sie od J
SELECT *
FROM ksiegowosc.pracownicy 
WHERE imie LIKE 'J%';

--e. wyswietlenie pracownikow ktorych  nazwisko zawiera litere n a imie konczy sie na a
SELECT *
FROM ksiegowosc.pracownicy 
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';

--f.wyswietl imie i nazwisko pracownikow, ich liczbe nadgodzin, jesli czas pracy przekroczyl 160h
SELECT ksiegowosc.pracownicy.imie,
		ksiegowosc.pracownicy.nazwisko,
		GREATEST((SUM(ksiegowosc.godziny.liczba_godzin)-160),0) AS il_nadgodziny 
		--oblicza roznice sum godzin pracy  a 160 h , ale nie ponizej 0!
		--jeśli różnica (SUM(liczba_godzin) - 160) jest mniejsza niż zero (czyli mniej niż 160 godzin pracy), to wartość końcowa to zero, co oznacza brak nadgodzin. 
		--Jeśli różnica jest większa niż zero, to zostanie zwrócona właśnie ta różnica, co oznacza ilość nadgodzin.
FROM ksiegowosc.pracownicy --glowna tabela
INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika
--laczy tabele godziny z pracownicy za pomoca id_pracownika
GROUP BY ksiegowosc.pracownicy.imie,ksiegowosc.pracownicy.nazwisko
--grupuje wg imie, nazwisko,id, dzieki temu bedzie mozliwe obliczenie nadgodzin dla kazdego pracownika
HAVING (SUM(ksiegowosc.godziny.liczba_godzin)-160) >0; --warunek na to zeby wysietlało tylko nadgodziny

---DRUGIE ROZWIAZANIE F
SELECT ksiegowosc.pracownicy.imie,
		ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy 
WHERE pracownicy.id_pracownika IN  (
SELECT ksiegowosc.godziny.id_pracownika
FROM ksiegowosc.godziny
GROUP BY ksiegowosc.godziny.id_pracownika
HAVING (SUM(godziny.liczba_godzin) - 160) > 0 );


--g.wyswietl imie i nazwiskom pracownikow ktorych pensja jest <1500,3000>
SELECT ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota --, ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy --glowna tabelka
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
--polaczenie tabelki wynagrodzenie z pracownicy poprzez id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
--polaczenie tabelki pensje z wynagrodzenie poprzez id_pensji
WHERE ksiegowosc.pensje.kwota >= 1500 AND ksiegowosc.pensje.kwota <= 3000;

--h.wyswietl imie i nazwisko pracownikow ktorzy mieli nadgodziny ale nie dostali premii
SELECT
    ksiegowosc.pracownicy.imie,
    ksiegowosc.pracownicy.nazwisko
FROM ksiegowosc.pracownicy --glowna tabelka
JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
--polaczenie tabelki godziny z pracownicy poprzez id_pracownika
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.godziny.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
--polaczenie wynagrodzenia z godiznami, nawet pracownicy ktorzy nie maja wpisu w tabelii wynagrodzenie
--a selniaja warunki (nadgodziny)tez zostana uwzglednieni
JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
--polaczenie tabelki premie z wynagrodzenie poprzez id_pracownika
WHERE ksiegowosc.premie.kwota=0
GROUP BY ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
--grupuje wg imie,nazwisko,id_pracownika umożliwiajac obliczenia na godzianch pracy i kwocie premii
HAVING
    SUM(ksiegowosc.godziny.liczba_godzin) > 160;
-- -- HAVING filtruje wyniki i sprawdza czy suma godzin >160 

--DRUGI SPOSÓB
SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
WHERE p.id_pracownika IN(
SELECT id_pracownika 
FROM ksiegowosc.godziny
GROUP BY id_pracownika
HAVING SUM(liczba_godzin)>160)
AND 
p.id_pracownika
IN(
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
WHERE id_premii is NULL);


--i.uszereguj pracownikow wg pensji --rosnąco??
SELECT ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.pensje.kwota --wybieramy id_pr z tabeli wynagrodzen oraz kwota z tabeli pensje
FROM ksiegowosc.wynagrodzenie , ksiegowosc.pensje 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji -- przyrownuje id_pensji z dwóch tabel aby połączyc te 2 tabele
GROUP BY ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.pensje.kwota--grupuje wg id i kwoty
ORDER BY ksiegowosc.pensje.kwota; --sortuje wg kwoty

--2 SPOSOB 
SELECT pr.id_pracownika, pr.imie,pr.nazwisko,pen.kwota
FROM ksiegowosc.pracownicy pr
JOIN ksiegowosc.wynagrodzenie w ON pr.id_pracownika=w.id_pracownika
JOIN ksiegowosc.pensje pen ON w.id_pensji=pen.id_pensji
ORDER BY pen.kwota ASC; ---wynikki posortowan rosnaco

--j.uszereguj pracownikow wg pensji i premii malejąco
SELECT
    ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,
	SUM(ksiegowosc.pensje.kwota) + COALESCE(SUM(ksiegowosc.premie.kwota), 0) AS suma_wynagrodzenia --pensja plus premia
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
--LAczenie tabelii na podstawie kluczy (bedzie wyswietlac nawet jak nie ma rekordow po praawej stronie-pensje/premie)
GROUP BY  ksiegowosc.pracownicy.id_pracownika,ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
--grupuje wynik wg tego 
--oznacza, że wyniki będą agregowane dla każdego pracownika, umożliwiając obliczenia sumy wynagrodzenia dla każdego pracownika
ORDER BY 
    --COALESCE(SUM(ksiegowosc.pensje.kwota), 0) + COALESCE(SUM(ksiegowosc.premie.kwota), 0) DESC;
	suma_wynagrodzenia DESC;
-- okresla porzadek sortowania -wg malejacej sumy wynagrodzen bo DESC


--k.zlicz i pogrupuj pracownikow wg pola stanowisko
SELECT stanowisko, COUNT(*) AS ilosc_pracownikow --zlicza i zapisuje pod nazwa ilosc_pracownikow
FROM ksiegowosc.pensje
GROUP BY stanowisko; --grupuje

--l.policz srednia, min i max płace dla stanowiska kierownik (lub dowolne inne)
SELECT 
    AVG(kwota) AS srednia_placa,
    MIN(kwota) AS minimalna_placa,
    MAX(kwota) AS maksymalna_placa --zapisuje sr,min,max pod tymi nazwami
FROM ksiegowosc.pensje
WHERE stanowisko = 'Pracownik biuro';

--m.policz sume wynagrodzen
SELECT SUM(ksiegowosc.pensje.kwota) + COALESCE(SUM(ksiegowosc.premie.kwota), 0)  AS suma_wynagrodzen --suma pensji i premi
FROM  ksiegowosc.wynagrodzenie --glowna tabelka
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii;
-- --polaczenie tabel pensji i premii z wynagrodzenie nawet jesli w pensji/premii nie było by rekordów zapisanych bo LEFT JOIN

--n.policz sume wynagrodzen w ramach 1 stanowiska
SELECT ksiegowosc.pensje.stanowisko, SUM(ksiegowosc.pensje.kwota) + COALESCE(SUM(premie.kwota), 0) AS suma_wynagrodzen --bedzie wyswietalo stanowisko i sume jako suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie --glowna tabelka
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
--polaczenie tabel pensji i premii z wynagrodzenie nawet jesli w pesnji/premii nie było by rekordów zapisanych bo LEFT JOIN
GROUP BY ksiegowosc.pensje.stanowisko; --grupuje te sumy przez stanowisko

--o.wyznacz liczbe premi przyznanych dla prcownikow danego stanowiska
SELECT ksiegowosc.pensje.stanowisko, COUNT(ksiegowosc.premie.id_premii) AS liczba_premii --wyznaczanie liczby premii as liczba_premii i stanowisko wyswietlenie
FROM ksiegowosc.wynagrodzenie  --wskazujemy ze glowna tabela to wynagrodzenie
JOIN ksiegowosc.premie  ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii --polacznie tabeli premie i wynagorodzenia przed id_premii
JOIN ksiegowosc.pensje  ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji --polaczenie tabeli pensje i wynagrodzenia poprzez id_pensji
GROUP BY stanowisko; --grupowanie wg stanowiskam( czyli zliczy )

--p.usun pracownikow majacyhc pensje <1200
DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (
    SELECT ksiegowosc.pracownicy.id_pracownika
    FROM ksiegowosc.pracownicy 
	JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika 
    JOIN ksiegowosc.pensje  ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota < 1200
);

-- Aktualizacja tabeli "wynagrodzenie" w przypadku, gdy pracownik został usunięty z tabeli "pracownicy"
DELETE FROM ksiegowosc.wynagrodzenie
WHERE id_pracownika NOT IN (
    SELECT id_pracownika
    FROM ksiegowosc.pracownicy
);
