## ETL Decisions

### Decision 1 — Date Standardization

**Problem:** The raw dataset contained inconsistent date formats (e.g., `DD-MM-YYYY`, `MM/DD/YYYY`, mixed textual formats), which would break joins with the `dim_date` table and lead to incorrect time-based aggregations.
**Resolution:** All dates were parsed and converted into a consistent **ISO format (`YYYY-MM-DD`)** during transformation. Invalid or ambiguous date entries were validated and corrected where possible. A clean, standardized date field was then used to populate `dim_date` and act as a foreign key in `fact_sales`.

---

### Decision 2 — Category Normalization

**Problem:** Product categories had inconsistent casing and naming (e.g., `electronics`, `Electronics`, `ELECTRONICS`, `grocery`, `Groceries`). This would fragment aggregations and produce incorrect results in category-level reporting.
**Resolution:** Categories were standardized using a controlled vocabulary: **Electronics, Clothing, Groceries**. All incoming values were transformed using case normalization and mapping rules before loading into `dim_product`, ensuring consistent grouping in analytical queries.

---

### Decision 3 — Handling NULL and Incomplete Values

**Problem:** Certain fields (e.g., `unit_price`, `quantity`, or foreign keys like `store_id`) contained NULL or missing values, which could violate NOT NULL constraints and distort revenue calculations.
**Resolution:** Records with critical missing keys (e.g., `product_id`, `store_id`, `date`) were **excluded** from fact loading to maintain referential integrity. For numerical fields:

* Missing `quantity` or `unit_price` values were either imputed (if logically derivable) or filtered out
* `total_sales` was consistently recalculated as `unit_price × quantity` to ensure accuracy
  This ensured the fact table contained only **complete, reliable, and analysis-ready data**.

