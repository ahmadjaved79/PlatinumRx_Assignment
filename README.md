# PlatinumRx Data Analyst Assignment

## Overview

This project demonstrates core data analysis skills across SQL, Excel, and Python.
All SQL tasks were executed using an **SQLite editor**, ensuring lightweight setup and quick query validation.

---

## 🔹 Tools & Environment

* **SQL:** SQLite (online editor / local SQLite environment)
* **Spreadsheet:** Microsoft Excel / Google Sheets
* **Python:** Python 3.x (VS Code / any IDE)

---

## 🔹 SQL Implementation (SQLite)

### Database Setup

* Created schemas for:

  * Hotel Management System
  * Clinic Management System
* Defined primary and foreign key relationships

### Key Adjustments for SQLite

* Used `strftime()` instead of `MONTH()` / `YEAR()` for date extraction
* Ensured compatibility with SQLite syntax

### Concepts Applied

* JOIN operations (multi-table analysis)
* Aggregations (`SUM`, `GROUP BY`, `HAVING`)
* Window functions (`RANK`, `ROW_NUMBER`)
* Subqueries and Common Table Expressions (CTEs)

### Business Problems Solved

* Last booked room per user
* Monthly billing analysis
* High-value bill filtering
* Most/least ordered items per month
* Second highest bill per month
* Revenue by sales channel
* Customer value analysis
* Profitability tracking (Revenue vs Expense)

---

## 🔹 Spreadsheet (Excel)

### Data Processing

* Worked with two sheets:

  * `ticket`
  * `feedbacks`

### Operations Performed

* Used **VLOOKUP / INDEX-MATCH** to map `created_at` using `cms_id`
* Created helper columns:

  * Same Day (date comparison)
  * Same Hour (hour-level comparison)

### Analysis

* Used **COUNTIFS** for outlet-wise aggregation
* Derived insights on ticket handling efficiency

---

## 🔹 Python Implementation

### 1. Time Converter

* Converts minutes into hours and minutes format
* Logic:

  * Integer division (`//`)
  * Modulus (`%`)

### 2. Remove Duplicates from String

* Removes duplicate characters while preserving order
* Implemented using loop-based logic (no built-in shortcuts)

---

## 🔹 Approach

* Focused on writing **clean, modular, and reusable code**
* Ensured all solutions are:

  * Dynamic (not hardcoded)
  * Tested with sample data
  * Compatible with SQLite environment
* Prioritized clarity in logic for easy explanation

---

## 🔹 Submission Links

* **GitHub Repository:** [Add your link]
* **Spreadsheet Link:** [Add your link]
* **Screen Recording:** [Add your link]

---

## 🔹 Notes

* SQLite was chosen for simplicity and fast execution
* All queries were tested and verified within SQLite environment
* Additional sample data was added where required to validate edge cases (e.g., ranking queries)
