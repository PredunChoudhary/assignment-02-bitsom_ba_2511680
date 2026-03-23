## Normalization Justification

I would respectfully disagree with the idea of keeping everything in one table, as normalization is important for maintaining data quality and efficiency.

If all data is stored in a single table, it can lead to duplication. For example, if customer details (name, address) are stored along with every order, the same customer information will be repeated multiple times. This increases storage usage and can create inconsistencies if the data is not updated everywhere.

Normalization solves this by splitting data into multiple related tables. For instance, a separate Customers table can store customer details, and an Orders table can store order information with a customer_id reference. This ensures that customer data is stored only once and reused efficiently.

Another issue with a single table is update anomalies. If a customer changes their address, it would need to be updated in multiple rows. Missing even one row can result in incorrect data. Normalization prevents this by keeping data in one place.

Finally, normalization improves data integrity and makes the database more organized. It becomes easier to manage relationships between entities like customers, orders, and products.

While a single table may seem simpler initially, it becomes difficult to manage as data grows. Therefore, normalization is not over-engineering but a necessary step for building a scalable and reliable system.
