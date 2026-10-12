-- Educational dataset only. Run in an empty practice database.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(80) NOT NULL
);
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountType VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    Amount DECIMAL(12,2) NOT NULL CHECK (Amount > 0),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    InvoiceID INT NOT NULL,
    Amount DECIMAL(12,2) NOT NULL CHECK (Amount > 0),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);
