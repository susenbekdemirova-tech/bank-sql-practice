-- All names and amounts are fictional. Currency: AZN.
INSERT INTO Customers VALUES (1, 'Customer A'), (2, 'Customer B'), (3, 'Customer C');
INSERT INTO Accounts VALUES (101,1,'Current'), (102,2,'Current'), (103,3,'Current');
INSERT INTO Invoices VALUES (1001,101,300.00), (1002,101,200.00), (1003,102,400.00), (1004,103,150.00);
INSERT INTO Payments VALUES (1,1001,100.00), (2,1001,200.00), (3,1002,50.00), (4,1003,400.00);
