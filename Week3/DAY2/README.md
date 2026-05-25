# PySpark DataFrame Operations Assignment

## Overview

This project demonstrates basic PySpark DataFrame operations using Databricks Notebook.

The assignment covers:

* Select
* Alias
* Filter / Where
* withColumnRenamed
* withColumn
* Type Casting
* Sort / OrderBy
* Limit

---

# Technologies Used

* Python
* PySpark
* Databricks

---

# Dataset Details

The dataset contains employee information with the following columns:

| Column Name  | Description          |
| ------------ | -------------------- |
| emp_id       | Employee ID          |
| emp_name     | Employee Name        |
| age          | Employee Age         |
| city         | Employee City        |
| designation  | Employee Designation |
| salary       | Employee Salary      |
| joining_date | Joining Date         |
| department   | Department Name      |

---

# DataFrame Creation

```python
from pyspark.sql.functions import *
from pyspark.sql.types import *

df = spark.createDataFrame(data, columns)
```

---

# Topics Covered

## 1. SELECT

Performed column selection operations such as:

* Selecting single and multiple columns
* Selecting columns with conditions
* Selecting all columns except one

Example:

```python
df.select("emp_name", "salary").display()
```

---

## 2. ALIAS

Used alias names for better readability.

Example:

```python
df.select(col("salary").alias("monthly_salary")).display()
```

---

## 3. FILTER / WHERE

Applied filtering conditions using:

* Comparison operators
* between()
* startswith()
* endswith()
* contains()

Example:

```python
df.filter(col("salary") > 70000).display()
```

---

## 4. WITHCOLUMNRENAMED

Renamed existing DataFrame columns.

Example:

```python
df.withColumnRenamed("emp_name", "employee_name").display()
```

---

## 5. WITHCOLUMN

Created new columns using calculations and conditions.

Examples:

* Bonus column
* Annual salary
* Salary category
* Joining year
* Tax calculations

Example:

```python
df.withColumn("bonus", col("salary") * 0.10).display()
```

---

## 6. TYPE CASTING

Converted column datatypes using cast().

Example:

```python
df.withColumn("salary", col("salary").cast("float")).display()
```

---

## 7. SORT / ORDERBY

Sorted data using ascending and descending order.

Example:

```python
df.sort(col("salary").desc()).display()
```

---

## 8. LIMIT

Displayed limited number of records.

Example:

```python
df.limit(5).display()
```

---

# Key Learnings

* Working with PySpark DataFrames
* Applying transformations
* Filtering and sorting data
* Creating derived columns
* Using Databricks display() function
* Performing datatype conversions

---

# Conclusion

This assignment helped in understanding basic PySpark DataFrame operations and their implementation in Databricks notebooks.
