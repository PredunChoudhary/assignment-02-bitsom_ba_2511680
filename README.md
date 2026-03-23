# 📊 Business Analytics Project Portfolio

## Overview

This repository contains a complete set of projects developed. The objective of this project was to build a strong foundation across multiple data domains including relational databases, NoSQL systems, data warehousing, vector databases, data lakes, and system design.

Each part of the project focuses on solving a real-world business problem using appropriate data technologies and design principles.

---

## Project Structure & Work Done

### Part 1 — Relational Databases (RDBMS)

In this part, I worked with a denormalized dataset (`orders_flat.csv`) containing customer, product, and order information in a single table.

* Identified **data anomalies**:

  * Insert anomaly (inability to add data independently)
  * Update anomaly (duplicate data causing inconsistency)
  * Delete anomaly (loss of important data on deletion)

* Designed a **normalized schema (3NF)**:

  * Created separate tables for Customers, Orders, Products, and Sales Representatives
  * Defined proper **primary keys and foreign keys**
  * Eliminated redundancy and ensured data integrity

* Wrote SQL queries to solve business problems:

  * Customer-wise sales analysis
  * Top-selling products
  * Sales representative performance
  * High-value orders and unused products

This part helped me understand why **normalization is essential for scalable and consistent databases**.

---

### Part 2 — NoSQL Databases (MongoDB)

In this section, I designed a flexible product catalog for an e-commerce system with multiple categories.

* Created **MongoDB documents** for:

  * Electronics (warranty, specs)
  * Clothing (size, fabric)
  * Groceries (expiry, nutrition)

* Used **nested JSON structures** to represent real-world data

* Implemented MongoDB operations:

  * Data insertion using `insertMany()`
  * Filtering using `find()`
  * Updating documents with `updateOne()`
  * Index creation for performance optimization

This part demonstrated how NoSQL databases handle **variety and flexibility better than relational systems**.

---

### Part 3 — Data Warehouse

In this part, I designed a **star schema** for analytical reporting using retail transaction data.

* Created:

  * Fact table: `fact_sales`
  * Dimension tables: `dim_date`, `dim_store`, `dim_product`

* Performed ETL (Extract, Transform, Load):

  * Standardized inconsistent date formats
  * Handled missing values
  * Cleaned category inconsistencies

* Wrote analytical queries:

  * Monthly revenue by category
  * Top-performing stores
  * Month-over-month trends

This part helped me understand how data warehouses support **business intelligence and reporting**.

---

### Part 4 — Vector Databases & Embeddings

This part focused on understanding how AI systems work with semantic meaning.

* Created sentences across 3 domains:

  * Cricket
  * Cooking
  * Cybersecurity

* Generated embeddings using **sentence-transformers model**

* Built:

  * Cosine similarity matrix
  * Heatmap visualization

* Performed semantic search:

  * Found most similar sentences to a given query

This demonstrated how vector databases enable **meaning-based search instead of keyword matching**.

---

### Part 5 — Data Lakes & DuckDB

In this section, I worked with multiple data formats without preloading them into a database.

* Used **DuckDB** to query:

  * CSV (customers)
  * JSON (orders)
  * Parquet (products)

* Performed cross-format queries:

  * Customer order counts
  * Top customers by value
  * Product purchases by location
  * Multi-source joins

* Designed architecture recommendation:

  * Selected **Data Lakehouse** for handling structured and unstructured data efficiently

This part showed how modern systems work directly on raw data using **data lakes and query engines**.

---

### Part 6 — Capstone: System Architecture Design

In the final part, I designed a complete **AI-powered hospital data system**.

#### System Capabilities:

* Predict patient readmission risk
* Enable natural language queries for doctors
* Generate management reports
* Process real-time ICU data

#### Architecture Design:

* Data Sources:

  * EHR system
  * ICU monitoring devices
  * Billing and lab systems

* Storage Systems:

  * OLTP (MySQL) → transactional data
  * Data Lake → raw and streaming data
  * Data Warehouse → analytics
  * Vector Database → semantic search

* Processing:

  * ETL pipelines
  * Feature engineering

* AI Layer:

  * Prediction model
  * NLP query system

* Output:

  * Dashboards
  * Doctor interface
  * Real-time alerts

This part combined all concepts into a **real-world scalable architecture**.

---

## Tools & Technologies

* SQL (MySQL)
* Python (Jupyter Notebook, Duck DB, Vector Databases)
* MongoDB
* Data Warehousing Concepts
* ETL Pipelines
* Architecture Design (draw.io)

---

## Learnings

* Importance of **data normalization and schema design**
* Difference between **SQL and NoSQL systems**
* Designing **data warehouses for analytics**
* Understanding **vector embeddings and semantic search**
* Working with **data lakes and multiple file formats**
* Building **end-to-end data architectures**

---

## Conclusion

This project helped me gain hands-on experience across multiple areas of **Business Analytics and Data Engineering**. I learned how to design efficient data systems, clean and transform raw data, and apply modern techniques such as vector search and real-time processing.

---


---


