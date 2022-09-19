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

-- Write a query that includes the purchased track name AND artist name with each invoice line item.

-- Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.

-- Show the total sales made by each sales agent.

-- Which sales agent made the most in sales in 2009?
