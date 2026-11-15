# Bright-Coffee-Shop-Sales-Analysis
This repository contains a case study on Bright Coffee Shop, in which an analysis was conducted.
# Bright Coffee Shop Sales Analysis (2026)

## Project Overview
As a Junior Data Analyst for Bright Coffee Shop, I analysed daily transactional data across three store locations (Lower Manhattan, Hell's Kitchen, and Astoria) to assist the newly appointed CEO in driving revenue growth and optimising product performance.

## Objectives
* Identify top-performing and underperforming product categories and types.
* Pinpoint peak and off-peak store trading hours using 30-minute time buckets.
* Analyse sales trends across locations, products, and time intervals.
* Deliver data-backed strategic recommendations to increase overall revenue.

## Methodology & Approach
1. **Planning & Architecture:** Designed an end-to-end ETL data flow diagram and project Gantt chart.
2. **Data Processing (SQL):** Loaded the raw semicolon-delimited CSV into Databricks, standardised decimal formatting (`unit_price`), calculated transactional revenue (`total_amount`), and engineered 30-minute time intervals (`transaction_time_bucket`).
3. **Exploratory Analysis (Excel):** Exported the processed dataset to Excel to build interactive Pivot Tables and visual dashboards.
4. **Executive Reporting:** Compiled findings into a Methodology Brief and a CEO Pitch Deck.

## Key Insights Found
* **Top Revenue Drivers:** Coffee (specifically *Barista Espresso* and *Gourmet Brewed Coffee*) and Tea (*Brewed Chai Tea*) generate the vast majority of store revenue.
* **Peak Trading Windows:** Store traffic surges between **07:30 and 10:30**, driven by morning commuters purchasing coffee, tea, and bakery items.
* **Slow Trading Windows:** Foot traffic and transaction volumes dip noticeably in the late afternoon between **14:00 and 16:30**.
* **Basket Attachment:** Bakery items (Scones, Croissants, Biscotti) and Flavours (syrups) act as high-frequency add-ons during peak morning coffee runs.

## Tools Used
* **Project Planning:** PowerPoint / Draw.io (Flowchart & Gantt Chart)
* **Data Processing:** Databricks (SQL)
* **Data Analysis & Visualisation:** Microsoft Excel (Pivot Tables & Charts)
* **Reporting:** Microsoft PowerPoint & Word/PDF
