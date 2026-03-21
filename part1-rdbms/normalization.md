## Anomaly Analysis

1. Insert Anomaly

Definition: Inability to insert data about one entity without requiring unrelated data.

Example from dataset:

Columns involved: product_id, product_name, category, unit_price
Suppose you want to add a new product (e.g., a new product_id) into the system.
In the current structure, you cannot insert a product independently without also creating:
order_id
customer_id
sales_rep_id

Concrete reference:

Row 0 (order_id = ORD1027) contains:
product_id, product_name, category, unit_price
But these product attributes only exist because an order exists

Issue:

If no order has been placed for a new product, it cannot be stored in the database

2. Update Anomaly

Definition: Same data stored in multiple rows must be updated consistently.

Example from dataset:

Columns involved: product_id, product_name, unit_price

Concrete reference:

Row 0: product_id = PXXX (example from row 0)
Row 10, 13, 33, 35 → same product_id appears multiple times

From inspection:

The same product appears in:
Row 0
Row 10
Row 13
Row 33
Row 35

Issue:

If unit_price changes:
You must update all rows
If one row is missed:
Data inconsistency occurs (different prices for same product)

3. Delete Anomaly

Definition: Deleting a row unintentionally removes additional important data.

Example from dataset:

Columns involved: sales_rep_id, sales_rep_name, office_address

Concrete reference:

Row 1:
sales_rep_id associated with Mumbai HQ
If this is the only row for that sales rep (or office), deleting it will:
Remove all information about that sales rep and office

Issue:

Deleting a single order results in:
Loss of:
Sales rep details
Office location data