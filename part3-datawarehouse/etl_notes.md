## ETL Decisions

### Decision 1 — Standardized Date Formats
Problem: The raw transaction data contained dates in inconsistent formats, which would make grouping by month and joining to a date dimension unreliable.
Resolution: I converted all dates into a single `YYYY-MM-DD` format before loading them into the warehouse. This ensured consistency and made month-based reporting accurate.

### Decision 2 — Normalized Category Casing
Problem: Product categories appeared in inconsistent letter casing such as `electronics`, `Electronics`, and `ELECTRONICS`, which would split the same category into multiple reporting groups.
Resolution: I standardized category values into title case before inserting them into `dim_product`, so all records for the same category were grouped together correctly.

### Decision 3 — Handled NULL and Missing Values
Problem: Some rows contained NULL or incomplete values in important analytical fields such as quantity, price, or category.
Resolution: I either removed unusable records or replaced missing values based on sensible cleaned examples so that fact rows remained complete and analytical queries did not produce misleading totals.