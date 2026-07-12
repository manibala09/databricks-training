# SQL to PySpark Phase 2 – Revised Bridge Pack

## Overview

This repository contains the solutions for the **SQL to PySpark Phase 2 – Revised Bridge Pack** assignment. The project focuses on converting SQL queries into equivalent PySpark DataFrame operations while performing data cleaning, joins, aggregations, and sorting using Spark Playground sample datasets.

## Objectives

* Bridge the gap between SQL and PySpark.
* Practice real-world data engineering tasks.
* Compare SQL queries with PySpark implementations.
* Understand DataFrame transformations and aggregations.

## Dataset

The project uses the following Spark Playground sample datasets:

* `customers.csv`
* `orders.csv`

Before solving the exercises, rows with missing `customer_id` values were removed from both datasets.

## Exercises Completed

1. Total order amount for each customer
2. Top 3 customers by total spend
3. Customers with no orders
4. City-wise total revenue
5. Average order amount per customer
6. Customers with more than one order
7. Sort customers by total spend in descending order

Each exercise was first written in **SQL** and then converted into **PySpark**, allowing easy comparison of both approaches.

## Repository Structure

```text
SQL-to-PySpark-Phase-2/
│
├── PySpark.py                  # PySpark solutions for all exercises
├── Queries.sql                 # SQL queries for each exercise
├── Pyspark_phase2_outputs.txt  # Output generated after running the PySpark program
└── README.md
```

## Technologies Used

* Python
* Apache Spark
* PySpark
* SQL
* Spark Playground

## Key Concepts Covered

* Data Cleaning
* Filtering
* Joins
* Group By
* Aggregations (SUM, AVG, COUNT)
* Sorting
* Left Join
* DataFrame Operations

## Learning Outcomes

Through this assignment, I gained practical experience in:

* Reading CSV files using PySpark
* Cleaning data before analysis
* Performing joins between DataFrames
* Applying aggregation functions
* Translating SQL queries into PySpark code
* Comparing SQL and PySpark results
* Understanding real-world ETL concepts
