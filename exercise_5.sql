-- Task 1
-- Retrieve information about the highest salary rate in an employee's salary history,
-- display their basic details (first name, last name, ID),
-- and then store the results in a temporary table TempEmployeeInfo.

WITH EmployeeCTE AS (
    SELECT
        e.businessentityid,
        p.firstname,
        p.lastname,
        MAX(e.rate) AS MaxRate -- highest salary rate
    FROM
        humanresources.employeepayhistory e
    JOIN
        person.person p ON e.businessentityid = p.businessentityid
    GROUP BY
        e.businessentityid, p.firstname, p.lastname
    -- grouping data by last name, first name, and ID to correctly calculate the maximum salary rate
)
SELECT
    businessentityid AS EmployeeID,
    firstname,
    lastname,
    MaxRate
INTO
    -- storing results in a temporary table
    TempEmployeeInfo
FROM
    -- data comes from the CTE expression
    EmployeeCTE;

-- verification
SELECT *
FROM TempEmployeeInfo;


-- Task 2
-- Build a query using a CTE expression that displays the customer ID, 
-- the territory ID where they operate, and the first and last name of the salesperson 
-- associated with the given Customer.TerritoryID.
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

