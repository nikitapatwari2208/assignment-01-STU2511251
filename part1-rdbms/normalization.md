## Anomaly Analysis

1. Insert Anomaly

Issue:
You cannot insert a new product or customer unless an order exists.

Example from dataset:

Columns involved: product_id, product_name, category, unit_price

Suppose you want to add a new product:

product_id = P999, product_name = "Tablet"
You cannot insert it unless you also create an order_id, customer_id, etc.

Why this is a problem:

Product information is tied to orders → no independent storage.
Leads to incomplete or forced dummy data insertion.

2. Update Anomaly

Issue:
The same data is repeated across multiple rows, and updating it requires changes in many places.

Example from dataset:

Columns involved: customer_id, customer_name, customer_email
Example rows:
Row 1 → customer_id = CUST101, customer_name = Rahul Sharma
Row 4 → same customer_id = CUST101, same details

If Rahul changes email:

You must update all rows where customer_id = CUST101

Problem:

If one row is missed → data inconsistency
Some rows show old email, some new → incorrect data

3. Delete Anomaly

Issue:
Deleting a row may unintentionally remove important data.

Example from dataset:

Columns involved: order_id, product_id, product_name

Suppose a product appears in only one order:

order_id = ORD1027, product_id = P205, product_name = "Headphones"
If this order is deleted:
→ Product information is completely lost

Problem:

Losing order = losing product/customer/sales rep info
Data that should exist independently gets deleted

Summary 

These anomalies occur because:

Data is denormalized (all in one table)
There is redundancy and dependency issues

Solution: Normalize into 3NF tables (Customers, Orders, Products, Sales Reps)