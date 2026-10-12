# Bank SQL Practice

Beginner SQL learning project using fictional customers, accounts, invoices and payments.
Prepared with AI assistance as a guided learning exercise. This is not professional banking experience or a production banking system.

## Purpose
Practise table relationships, primary and foreign keys, JOIN, LEFT JOIN, SUM, GROUP BY, HAVING and COALESCE. Outstanding amounts here represent unpaid invoices, not account balances.

## How to run in Microsoft SQL Server
1. Open SQL Server Management Studio and select an empty practice database.
2. Run `01_schema.sql` once to create the tables.
3. Run `02_sample_data.sql` once to insert fictional data.
4. Run each query in `03_queries.sql` and compare it with the results below.
Do not run these files against a real company database. Running schema or sample inserts twice will fail because the tables and IDs already exist.

## Relationships
One customer can have several accounts. One account can have several invoices. One invoice can have several payments. Foreign keys connect these tables.

## Expected results
Q1 returns accounts 101, 102 and 103 with their customers.

Q2:
| Invoice | Customer | Invoiced | Paid | Outstanding |
|---|---|---:|---:|---:|
| 1001 | Customer A | 300 | 300 | 0 |
| 1002 | Customer A | 200 | 50 | 150 |
| 1003 | Customer B | 400 | 400 | 0 |
| 1004 | Customer C | 150 | 0 | 150 |

Q3 returns Customer A: 150 AZN and Customer C: 150 AZN.

## Important SQL detail
Invoice 1001 has two payments. Directly joining invoices to payments and summing invoice amounts would count its 300 AZN twice. The queries first group payments by invoice and then join that result to invoices. LEFT JOIN includes invoices with no payments; COALESCE replaces their missing payment total with zero.

## Validation and limitations
The same schema, sample inserts and queries were executed using SQLite to check relationships and expected outputs. Native Microsoft SQL Server execution has not yet been verified. The SQL uses syntax supported by SQL Server, but SQLite does not enforce decimal precision like SQL Server. SQL Server testing remains a learner task.
This example does not implement interest, fees, refunds, payment dates, currency conversion or controls against overpayment. It must not be used as a real banking ledger.

## Exercises
1. Add a 150 AZN payment to invoice 1002 using a new PaymentID. Customer A should disappear from Q3.
2. Add a new customer and account with no invoices. Explain why they do not appear in Q3.
3. Explain the difference between WHERE and HAVING in Q3.
4. Explain why Q2 needs LEFT JOIN and COALESCE.
