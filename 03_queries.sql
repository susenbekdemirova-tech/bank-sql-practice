-- Q1: Link each account to its customer.
SELECT a.AccountID, c.FullName, a.AccountType
FROM Accounts a
JOIN Customers c ON c.CustomerID = a.CustomerID
ORDER BY a.AccountID;

-- Q2: Calculate outstanding amounts per invoice.
-- Aggregate payments first so multiple payments cannot duplicate invoice amounts.
SELECT i.InvoiceID, c.FullName, i.Amount AS InvoiceAmount,
       COALESCE(p.PaidAmount, 0) AS PaidAmount,
       i.Amount - COALESCE(p.PaidAmount, 0) AS OutstandingAmount
FROM Invoices i
JOIN Accounts a ON a.AccountID = i.AccountID
JOIN Customers c ON c.CustomerID = a.CustomerID
LEFT JOIN (
    SELECT InvoiceID, SUM(Amount) AS PaidAmount
    FROM Payments
    GROUP BY InvoiceID
) p ON p.InvoiceID = i.InvoiceID
ORDER BY i.InvoiceID;

-- Q3: Show only customers who have an outstanding amount.
SELECT c.CustomerID, c.FullName,
       SUM(i.Amount - COALESCE(p.PaidAmount, 0)) AS TotalOutstanding
FROM Customers c
JOIN Accounts a ON a.CustomerID = c.CustomerID
JOIN Invoices i ON i.AccountID = a.AccountID
LEFT JOIN (
    SELECT InvoiceID, SUM(Amount) AS PaidAmount
    FROM Payments
    GROUP BY InvoiceID
) p ON p.InvoiceID = i.InvoiceID
GROUP BY c.CustomerID, c.FullName
HAVING SUM(i.Amount - COALESCE(p.PaidAmount, 0)) > 0
ORDER BY c.CustomerID;
