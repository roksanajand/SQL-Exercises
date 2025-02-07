--zadanie 1
--informacje na temat najwyższej stawki w historii płac pracownika oraz wyświetli jego podstawowe dane (imie,
--nazwisko, id), a następnie zapisze je do tabeli tymczasowej TempEmployeeInfo
WITH EmployeeCTE AS (
	SELECT
        e.businessentityid,
        p.firstname,
        p.lastname,
        MAX(e.rate) AS MaxRate --najwyższa stawka
    FROM
        humanresources.employeepayhistory e
    JOIN
        person.person p ON e.businessentityid = p.businessentityid
    GROUP BY
        e.businessentityid, p.firstname, p.lastname
	--grupowanie danych wg nazwiska, imienia i id, dzięki temu wyliczy max stawkę
)
SELECT
    businessentityid AS EmployeeID,
    firstname,
    lastname,
    MaxRate
INTO
--zapisywanie wyników do tymczasowej tabelki
    TempEmployeeInfo
FROM
--dane pochodzą z wyrażenie CTE
    EmployeeCTE;

--sprawdzenie
SELECT *
FROM TempEmployeeInfo


--zadanie 2
--Zbuduj zapytanie wykorzystujące wyrażenie CTE, które wyświetli ID klienta, ID terytorium na
--którym prowadzi działalność, a także wyświetli imię i nazwisko salesperson powiązanej z
--danym Customer.TerritoryID.
WITH CustomerSalesCTE AS (
    SELECT
        sales.customer.customerid,
        sales.customer.territoryid AS customerterritoryid,
       person.person.firstname,
		person.person.lastname        
    FROM
        sales.salesperson 
    JOIN
        sales.salesterritory ON sales.salesperson.territoryid=sales.salesterritory.territoryid
	RIGHT JOIN
	sales.customer ON sales.salesterritory.territoryid=sales.customer.territoryid
	LEFT JOIN
	person.person ON sales.salesperson.businessentityid=person.person.businessentityid 
  )
SELECT
  CustomerSalesCTE.customerid,
  CustomerSalesCTE.customerterritoryid,
  CustomerSalesCTE.firstname || ' ' || CustomerSalesCTE.lastname AS SalesPersonInThisTerritory
FROM
    CustomerSalesCTE;

