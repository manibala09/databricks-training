# CSV File Reading Using PySpark in Databricks

## Overview

This project demonstrates how to read CSV files using PySpark in Databricks Notebook.

The following CSV files are used:

* Big Sales.csv
* empData.csv

The project covers:

* Uploading CSV files
* Reading CSV files using PySpark
* Displaying data
* Inferring schema automatically

---

# Technologies Used

* Python
* PySpark
* Databricks

---

# Files Used

## 1. Big Sales.csv

Contains sales-related data for analysis.

## 2. empData.csv

Contains employee-related information.

---

# Uploading CSV Files in Databricks

Steps:

1. Open Databricks Workspace
2. Create a new notebook
3. Click on **File → Upload Data**
4. Upload the CSV files
5. Copy the generated DBFS file path

Example paths:

```python id="dchhwb"
/Workspace/Users/pvenkayya2005@gmail.com/Big Sales.csv
/Workspace/Users/pvenkayya2005@gmail.com/empData.csv
```

---

# Reading Big Sales.csv

```python id="gnhl7r"
big_sales_df = spark.read.format("csv") \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .load("/Workspace/Users/pvenkayya2005@gmail.com/Big Sales.csv")

big_sales_df.display()
```

---

# Reading empData.csv

```python id="mjlwm5"
emp_df = spark.read.format("csv") \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .load("/Workspace/Users/pvenkayya2005@gmail.com/empData.csv")

emp_df.display()
```

---

# Explanation

| Option           | Description                     |
| ---------------- | ------------------------------- |
| header=True      | Reads first row as column names |
| inferSchema=True | Automatically detects datatypes |
| format("csv")    | Specifies CSV file format       |
| load()           | Loads the file into DataFrame   |

---

# Displaying Data

Used Databricks display() function to visualize DataFrames.

Example:

```python id="6vgik6"
big_sales_df.display()

emp_df.display()
```

---

# Additional Operations

## Show Schema

```python id="0y2s7n"
big_sales_df.printSchema()

emp_df.printSchema()
```

---

## Show Rows

```python id="31zvvj"
big_sales_df.show()

emp_df.show()
```

---

# Key Learnings

* Reading CSV files using PySpark
* Working with Databricks notebooks
* Using DBFS file paths
* Displaying DataFrames
* Understanding schema inference

---

# Conclusion

This project helped in understanding how to load and visualize CSV files using PySpark in Databricks environment.
