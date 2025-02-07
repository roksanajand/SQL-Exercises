-- a) dodanie +48 do telefonu
-- musiałam rozszezyc dlugosc na 20 z 15
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon TYPE character varying(20);

UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48) ', telefon)
WHERE telefon IS NOT NULL;

-- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był
myślnikami wg wzoru: ‘555-222-333’
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT(
  SUBSTRING(telefon, 7, 3), '-', 
    SUBSTRING(telefon, 10, 3), '-', 
    SUBSTRING(telefon, 13)
	)
WHERE telefon IS NOT NULL;

-- c) Używając dużych liter, wyświetl dane pracownika, którego nazwisko jest najdłuższe
SELECT *
FROM ksiegowosc.pracownicy
ORDER BY LENGTH(nazwisko) DESC
LIMIT 1;

--d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
SELECT MD5(CONCAT(p.imie, p.nazwisko, p.adres,p.telefon,CAST(ksiegowosc.pensje.kwota AS VARCHAR))) AS zakodowane_dane
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje ON  w.id_pensji=ksiegowosc.pensje.id_pensji  

--e) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.
SELECT p.imie, p.nazwisko, ksiegowosc.pensje.kwota AS pensja, ksiegowosc.premie.kwota AS premia
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.premie ON w.id_premii = ksiegowosc.premie.id_premii
LEFT JOIN ksiegowosc.pensje  ON w.id_pensji = ksiegowosc.pensje.id_pensji;

--f) Wygeneruj raport (zapytanie), które zwróci jako wynik następującą treść dla
--każdego pracownika, według poniższego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7000 zł,
--gdzie wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł
SELECT 
    'Pracownik ' || p.imie || ' ' || p.nazwisko || ', w dniu ' || w.data || 
    ' otrzymał pensję całkowitą na kwotę ' || (pp.kwota + COALESCE(pre.kwota, 0)) || ' zł, ' ||
    'gdzie wynagrodzenie zasadnicze wynosiło: ' || pp.kwota || ' zł, premia: ' || COALESCE(pre.kwota, 0) || ' zł' AS raport
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.premie pre ON w.id_premii = pre.id_premii
LEFT JOIN ksiegowosc.pensje pp ON w.id_pensji = pp.id_pensji;