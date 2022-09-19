-- Show Customers (their full names, customer ID, and country) who are not in the US. (Hint: != or <> can be used to say "is not equal to").

SELECT CustomerId , FirstName || ' ' || LastName AS "Full Name", Country  FROM customers
    WHERE Country != 'USA'

  -- Show only the Customers from Brazil.
  SELECT * FROM customers
    WHERE Country = 'Brazil';

-- Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.
SELECT * FROM customers AS c
    INNER JOIN invoices AS i
        ON c.CustomerId = i.CustomerId
    WHERE Country = 'Brazil';

-- Show the Employees who are Sales Agents.
SELECT * FROM employees
    WHERE Title = 'Sales Support Agent';

-- Find a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT(BillingCountry) FROM invoices
    ORDER BY BillingCountry;

-- Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.
SELECT e.firstname , e.lastname , invoiceid FROM customers AS c
    INNER JOIN invoices AS i
        ON c.customerid = i.customerid
    INNER JOIN employees AS e
        ON c.supportrepid = e.employeeid;

-- Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.
SELECT c.firstname ||' ' || c.lastname AS "Customer Full Name", c.country , e.firstname || ' ' ||e.lastname AS "Sales Rep", invoiceid , total FROM customers AS c
    INNER JOIN invoices AS i
        ON c.customerid = i.customerid
    INNER JOIN employees AS e
        ON c.supportrepid = e.employeeid

-- How many Invoices were there in 2009?
SELECT * FROM invoices
    WHERE invoicedate BETWEEN '2009-01-01' AND '2009-12-31';

-- What are the total sales for 2009?
SELECT SUM(total) AS "Total Sales for 2009" FROM invoices
    WHERE invoicedate BETWEEN '2009-01-01' AND '2009-12-31';

-- Write a query that includes the purchased track name with each invoice line item.
SELECT i.invoiceid , t.name , quantity  FROM invoices AS i
    INNER JOIN invoice_items AS ii
        ON i.invoiceid = ii.invoiceid
    INNER JOIN tracks AS t
        ON ii.trackid = t.trackid

-- Write a query that includes the purchased track name AND artist name with each invoice line item.
SELECT i.invoiceid , t.name , t.composer  , quantity   FROM invoices AS i
    INNER JOIN invoice_items AS ii
        ON i.invoiceid = ii.invoiceid
    INNER JOIN tracks AS t
        ON ii.trackid = t.trackid


-- Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.
SELECT t.name , t.composer , a.title , m.name AS "File Type" , g.name AS "Genre" FROM tracks AS t
    INNER JOIN albums AS a USING (albumid)
    INNER JOIN media_types AS m USING (mediatypeid)
    INNER JOIN genres AS g USING (genreid)


-- Show the total sales made by each sales agent.
SELECT e.firstname , e.lastname , ROUND(SUM(total),2) AS "Total sales" FROM invoices AS i
    INNER JOIN customers AS c USING (customerid)
    INNER JOIN employees AS e
        ON c.supportrepid = e.employeeid
    GROUP BY e.firstname , e.lastname
-- Which sales agent made the most in sales in 2009?
SELECT e.firstname , e.lastname , ROUND(SUM(i.total),2) FROM invoices AS i
    INNER JOIN customers AS c
        ON i.customerid = c.customerid
    INNER JOIN employees AS e
        ON c.supportrepid = e.employeeid
    WHERE i.invoicedate LIKE '2009%' AND title = 'Sales Support Agent'
    GROUP BY e.firstname , e.lastname
    ORDER BY ROUND(SUM(i.total),2) DESC
    LIMIT 1
