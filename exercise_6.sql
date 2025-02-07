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


-- Task 2

-- a. Write a query that starts a transaction, updates the price of the product with ProductID = 680 
-- in the Production.Product table by increasing it by 10%, and then commits the transaction.

BEGIN TRANSACTION; -- start transaction

UPDATE production.product
SET listprice = listprice + 0.1 * listprice  -- increases price by 10%
WHERE productid = 680;

COMMIT TRANSACTION; -- confirm transaction

-- Verification: check if the price has increased
SELECT *
FROM production.product
WHERE productid = 680;

-- b. Write a query that starts a transaction, deletes the product with ProductID = 707
-- from the Production.Product table, but then rolls back the transaction instead of committing it.

BEGIN WORK; -- start transaction

DELETE FROM production.product
WHERE productid = 707; -- delete record with ProductID = 707

ROLLBACK; -- rollback transaction instead of confirming it


-- c. Write a query that starts a transaction and adds a new product to the table

BEGIN TRANSACTION; -- start transaction

INSERT INTO production.product (
    name, productnumber, makeflag, finishedgoodsflag, color, safetystocklevel, reorderpoint, 
    standardcost, listprice, size, sizeunitmeasurecode, weightunitmeasurecode, weight, 
    daystomanufacture, productline, class, style, productsubcategoryid, productmodelid, 
    sellstartdate, sellenddate, discontinueddate, rowguid, modifieddate
)
VALUES (
    'Nowy Produkt', 'NP001', true, true, 'silver', 100, 75.00, 308, 564, 
    43, 'CM', 'LB', 27, 4, 'M', 'L', 'U', 1, 23, 
    '2023-08-08', NULL, NULL, NEWID(), GETDATE()
);

COMMIT TRANSACTION; -- confirm transaction


-- Alternative version
BEGIN TRANSACTION; -- start transaction

INSERT INTO Production.Product (
    name, productnumber, makeflag, finishedgoodsflag, color, safetystocklevel, reorderpoint, 
    standardcost, listprice, size, sizeunitmeasurecode, weightunitmeasurecode, weight, 
    daystomanufacture, productline, class, style, productsubcategoryid, productmodelid, 
    sellstartdate, sellenddate, discontinueddate, rowguid, modifieddate
) 
VALUES (
    'Nowy Produkt', 'NP001', 1, 0, 'Red', 10, 5, 10.00, 20.00, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    GETDATE(), NULL, NULL, NEWID(), GETDATE()
);

COMMIT TRANSACTION; -- confirm transaction
