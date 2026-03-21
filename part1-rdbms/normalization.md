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


## Normalization Justification

The argument that a single denormalized table is “simpler” holds only at very small scale; in this dataset it introduces concrete data integrity and maintenance risks. For example, the same `product_id` appears across multiple rows with repeated attributes (`product_name`, `category`, `unit_price`). If the price of a product changes, every occurrence must be updated; missing even one row leads to inconsistent pricing for identical products—an update anomaly. Similarly, customer details (`customer_email`, `customer_city`) are duplicated for each order line. If a customer updates their email, the change must be propagated across all historical rows, increasing the likelihood of stale or conflicting records.

Insert operations are also constrained. A new product cannot be recorded unless it is tied to an `order_id`, `customer_id`, and `sales_rep_id`, which is semantically incorrect and blocks valid business states (e.g., onboarding a product before its first sale). Delete operations are equally problematic: removing the only row containing a given `sales_rep_id` or `office_address` eliminates that master data entirely, even though it should persist independently of orders.

Normalizing to 3NF separates concerns into `customers`, `products`, `sales_reps`, `orders`, and `order_items`. This enforces single sources of truth (e.g., one row per product), eliminates redundancy, and uses foreign keys to maintain referential integrity. The result is not over-engineering; it is a minimal, well-structured design that prevents anomalies, simplifies updates, and scales reliably as data volume and business complexity grow.
