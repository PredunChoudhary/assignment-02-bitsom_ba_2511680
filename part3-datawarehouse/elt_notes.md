## ETL Decisions

### Decision 1 — Standardizing Date Formats

Problem: The raw dataset contained dates in multiple formats such as DD-MM-YYYY, MM/DD/YYYY, and text formats. This made it difficult to perform time-based analysis and sorting in the data warehouse.
Resolution: I converted all date values into a single standard format (YYYY-MM-DD) using SQL functions. This ensured consistency and allowed accurate filtering, grouping, and reporting based on dates.

### Decision 2 — Handling Missing Values

Problem: Some important fields such as store_city had missing or null values. This could lead to incorrect analysis and broken relationships between tables.
Resolution: I handled missing values by filling them with default values where appropriate. This improved data quality and ensured reliable analysis.

### Decision 3 — Removing Inconsistent Data

Problem: The dataset contained inconsistent data such as came category with different CASE like electronics-Electronics or different name like grocery-groceries which could lead to incorrect insights.
Resolution: I identified the issue and fixed using SQL queries by converting them into same CASE and same name. This ensured that each record was unique and improved the accuracy of reporting.
