
# 📆 SQL NULL Functions Assignment 

## 🎯 Objective

The objective of this practice session is to understand and implement **SQL NULL handling functions** using relational database tables such as **Employees, Orders, and Products**. This session focuses on NULL replacement, NULL comparison, conditional handling, and real-time business data processing using NULL-based logic.

---

# 🧱 Database Setup

The following tables were used for SQL NULL Functions practice:

* 👨‍💼 Employees
* 📦 Orders
* 🛒 Products

The database schema includes:

* NULL value handling
* Integer and string NULL processing
* Business-oriented sample records
* Conditional data replacement

---

# 🔑 Core Concepts Implemented

* NULL Detection
* NULL Replacement
* Conditional NULL Logic
* Multiple Fallback Handling
* NULL-safe Calculations
* Divide-by-Zero Prevention
* Data Cleaning Operations
* Real-Time Business Scenarios

---

# 📚 Topics Covered

## 1️⃣ NULL Checking

Using:

* `IS NULL`
* `IS NOT NULL`

Finding:

* Missing salaries
* Missing discounts
* Missing categories
* Missing managers

---

## 2️⃣ ISNULL() Function

Using:

* `ISNULL(column, replacement_value)`

Examples:

* Replace NULL salary with `0`
* Replace NULL bonus with `1000`
* Replace NULL stock with `0`
* Replace NULL order amount with default values

---

## 3️⃣ COALESCE() Function

Using:

* `COALESCE(value1, value2, value3...)`

Finding first available value:

* Salary → Bonus
* Salary → Bonus → Default
* Price → Default Price
* Amount → Discount → Zero

---

## 4️⃣ NULLIF() Function

Using:

* `NULLIF(value1, value2)`

Examples:

* Convert zero values to NULL
* Replace matching coupon codes with NULL
* Prevent divide-by-zero errors

---

## 5️⃣ Conditional NULL-Based Calculations

Performing:

* Salary + Bonus calculations
* Amount - Discount calculations
* NULL-safe arithmetic operations

Handling:

* Missing financial data
* Partial business records

---

## 6️⃣ Real-Time Business Filtering

Finding:

* Employees with missing salary but assigned manager
* Orders with missing payment details
* Products with missing price but valid category
* Employees with fully missing compensation data

---

## 7️⃣ Multi-Level NULL Fallback Logic

Using layered fallback strategy:

* Primary Value
* Secondary Backup Value
* Default System Value

Example:

* `COALESCE(salary, bonus, 1000)`

---

## 8️⃣ Data Cleaning Operations

Cleaning inconsistent records using:

* `NULLIF()`
* `ISNULL()`
* `COALESCE()`

Used for:

* Standardization
* Default replacement
* Report consistency

---

## 9️⃣ Error Prevention Techniques

Using:

* `NULLIF()` to avoid divide-by-zero
* Safe NULL arithmetic
* Controlled fallback replacements

Improves:

* Query stability
* Reliable outputs
* Production-safe reporting

---

## 🔟 Business Intelligence Use Cases

Applied NULL handling for:

* Employee payroll reports
* Product inventory correction
* Discount validation
* Order payment analysis
* Missing-data auditing

---

# 💻 Practice Work

✅ Solved 24 SQL NULL handling queries

📈 Covered beginner to advanced-level NULL scenarios

🌍 Practiced real-world scenarios including:

* Payroll calculations
* Missing-value replacement
* Inventory validation
* Safe financial calculations
* Data consistency reporting

---

# 🧠 Key Learnings

* Understanding SQL NULL behavior
* Replacing missing values efficiently
* Performing safe arithmetic operations
* Applying fallback logic
* Preventing runtime calculation errors
* Handling real-world incomplete datasets

---

# 🛠️ Tools Used

* 🧪 DB-Fiddle
* 🐬 MySQL
* 🌐 GitHub

---

# 🚀 Next Steps

* Learn advanced conditional expressions
* Practice CASE with NULL handling
* Explore aggregate NULL behavior
* Build business reports with clean fallback logic

---

# 📁 Files Included

| File Name | Description |
|-----------|-------------|
| `data_creation.sql` | Employees, Orders, and Products table structure with sample NULL values |
| `practice_queries.sql` | Collection of SQL NULL handling queries |
| `README.md` | Documentation for Day 4 SQL NULL Functions practice |

---

# ✅ Conclusion

This practice session strengthened SQL NULL handling fundamentals through hands-on implementation of NULL checking, replacement, fallback logic, safe calculations, and real-time business filtering. The exercises improved practical SQL query-writing confidence for handling incomplete and inconsistent datasets effectively in production environments.
