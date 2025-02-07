EXPLAIN ANALYZE
SELECT
c.customerid,
c.personid,
c.storeid,
c.territoryid,
soh.salesorderid,
soh.orderdate,
soh.duedate,
soh.shipdate
FROM sales.customer c
INNER JOIN sales.salesorderheader soh ON c.customerid = soh.customerid
WHERE c.territoryid = 5

CREATE INDEX id_customerid ON sales.customer (customerid);
CREATE INDEX id_territoryid ON sales.customer (territoryid);
CREATE INDEX id_orderdate ON sales.salesorderheader (orderdate);


--zadanie 2
--a. Napisz zapytanie, które wykorzystuje transakcję (zaczyna ją), a następnie aktualizuje
--cenę produktu o ProductID równym 680 w tabeli Produc`on.Product o 10% i
--następnie zatwierdza transakcję.

BEGIN TRANSACTION; --zaczęcie transakcji

UPDATE production.product
SET listprice = listprice + 0.1*listprice  -- zwieksza cenę o 10%
WHERE productid = 680;

COMMIT TRANSACTION;

---sprawdzenie czy się zwiększyło
SELECT *
FROM production.product
WHERE productid = 680;

--b Napisz zapytanie, które zaczyna transakcję, usuwa produkt o ProductID równym 707
--z tabeli Produc`on. Product, ale następnie wycofuje transakcję.
BEGIN WORK;

DELETE FROM production.product
WHERE productid = 707; --usuniecie rekordu z id 707

ROLLBACK; --wycofaj transakcje zamiast jej potwierdzenia

--c Napisz zapytanie, które zaczyna transakcję, dodaje nowy produkt do tabeli
BEGIN TRANSACTION;

INSERT INTO production.product (name, productnumber,makeflag,finishedgoodsflag,color,safetystocklevel,reorderpoint, standardcost, listprice,size,sizeunitmeasurecode,weightunitmeasurecode,weight,daystomanufacture,productline,class,style,productsubcategoryid,productmodelid,sellstartdate,sellenddate,discontinueddate,rowguid,modifieddate)
VALUES ('Nowy Produkt', 'NP001', true,true,silver,100, 75.00,308,564,43,CM,LB,27,4,M,L,U,1,23,'2023-08-08', NULL, NULL, NEWID(), GETDATE());
--VALUES ('Nowy Produkt', 'NP001', 1, 1, 'silver', 100, 75.00, 308, 564, 43, 'CM', 'LB', 27, 4, 'M', 'L', 'U', 1, 23, '2023-08-08', NULL, NULL, NULL, NEWID(), GETDATE());

COMMIT TRANSACTION;

--c druga wersja 
BEGIN TRANSACTION;

INSERT INTO Production.Product ( name, productnumber,makeflag,finishedgoodsflag,color,safetystocklevel,reorderpoint, standardcost, listprice,size,sizeunitmeasurecode,weightunitmeasurecode,weight,daystomanufacture,productline,class,style,productsubcategoryid,productmodelid,sellstartdate,sellenddate,discontinueddate,rowguid,modifieddate) --dodanie nowego rekordu
VALUES ('Nowy Produkt', 'NP001', 1, 0, 'Czerwony', 10, 5, 10.00, 20.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, GETDATE(), NULL, NULL, NEWID(), GETDATE());

COMMIT TRANSACTION;