## Storage Systems
(Which databases/storage systems did you choose for each of the 4 goals and why)

In this architecture, different storage systems are used based on the type of data and use case.

An OLTP database (such as MySQL) is used to store real-time transactional data like patient records, billing information, and doctor inputs. This system is optimized for fast read and write operations, which are required for daily hospital activities.

A Data Lake is used to store large volumes of raw and unstructured data, especially real-time ICU vitals coming from streaming systems like Kafka. It allows scalable and cost-effective storage of high-frequency data.

A Data Warehouse (such as DuckDB or BigQuery) is used for analytical purposes. Cleaned and structured data is stored here to support reporting use cases like monthly hospital reports and dashboards.

A Vector Database is used to store embeddings of patient history. This enables semantic search functionality, allowing doctors to query patient data in natural language using the NLP query system.

## OLTP vs OLAP Boundary
(Where does the transactional system end and the analytical system begin in your design)

The OLTP system consists of the transactional database where real-time operations such as patient updates, billing, and doctor entries take place. It is designed for fast and reliable transaction processing.

The OLAP system begins at the Data Warehouse, where data is transformed and structured for analysis and reporting. The boundary between OLTP and OLAP occurs during the data ingestion and transformation process, where data is moved from the OLTP database and Data Lake into the Data Warehouse.

This separation ensures that transactional workloads do not interfere with analytical queries.

## Trade-offs
(Identify one significant trade-off in your design and how you would mitigate it)

A key trade-off in this design is between real-time processing and system complexity. Supporting real-time data ingestion from ICU devices using streaming technologies like Kafka increases system complexity and maintenance effort.

To mitigate this, the system processes only critical data (such as ICU vitals) in real-time, while less time-sensitive data (like reports and historical analysis) is handled using batch processing. This balance helps maintain performance while reducing unnecessary complexity.
