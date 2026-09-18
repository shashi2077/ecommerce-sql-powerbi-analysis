# E-commerce SQL + Power BI Analysis

## Project Overview

This is an end-to-end **Data Analyst portfolio project** built around a synthetic e-commerce business dataset.

The project demonstrates how SQL and Power BI can be used to answer business questions related to:

- Revenue and profit
- Monthly sales trends
- Product/category performance
- Customer behavior
- Repeat customers
- Geographic performance
- Order quality and status
- Average Order Value

## Tech Stack

- **SQL / MySQL 8+**
- **Power BI**
- **DAX**
- CSV datasets
- Relational data modeling
- Business KPI analysis

## Dataset

The project contains:

- **250 customers**
- **30 products**
- **700 orders**
- **1,782 order-item records**

All records are **synthetic** and are used only for portfolio, learning and interview demonstration.

## Business KPIs

| KPI | Result |
|---|---:|
| Delivered Orders | 617 |
| Revenue | ₹1,66,36,756 |
| Profit | ₹49,37,027 |
| Average Order Value | ₹26,964 |
| Highest-Revenue Category | Electronics |
| Highest-Revenue City | Bengaluru |
| Highest-Revenue Month | 2025-05 |

## SQL Skills Demonstrated

- SELECT / WHERE
- INNER JOIN / LEFT JOIN
- GROUP BY
- HAVING-style business analysis
- Aggregate functions
- CASE
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- DENSE_RANK
- Running totals
- Date aggregation

## Power BI Skills Demonstrated

- Relational data modeling
- One-to-many relationships
- KPI cards
- DAX measures
- Filter context
- Monthly trend analysis
- Category and customer analysis
- Dashboard planning

## Repository Structure

```text
ecommerce-sql-powerbi-analysis/
├── README.md
├── DATA_DICTIONARY.md
├── schema.sql
├── analysis_queries.sql
├── powerbi_dashboard_guide.md
└── data/
    ├── customers.csv
    ├── products.csv
    ├── orders.csv
    └── order_items.csv
```

## Business Questions Answered

1. What are total revenue, profit and Average Order Value?
2. How does revenue change month by month?
3. Which product categories generate the most revenue and profit?
4. Who are the top customers?
5. Which cities contribute the most revenue?
6. What percentage of orders are delivered, cancelled or returned?
7. How many customers are repeat customers?
8. Which products rank highest within each category?
9. What does cumulative revenue growth look like?
10. Which products perform above the average product revenue?

## How to Run the SQL Project

1. Create the schema using `schema.sql`.
2. Import each CSV into the matching table.
3. Run `analysis_queries.sql`.
4. Compare your results with the KPI validation numbers in this README.

## How to Build the Power BI Dashboard

Use the four CSV files as sources and follow:

**[Power BI Dashboard Guide](powerbi_dashboard_guide.md)**

The guide includes:
- Table relationships
- Dashboard-page layout
- DAX measures
- KPI validation checks

## Interview Explanation

A concise interview answer:

> I built an e-commerce analytics project using four relational tables: customers, products, orders and order items. I used SQL joins, aggregations, CTEs, subqueries and window functions to analyze revenue, profit, customer behavior and product performance. I then designed a Power BI data model and DAX measures for executive reporting.

## Resume-Ready Project Entry

**E-commerce Sales & Customer Analytics | SQL + Power BI**

- Analyzed a relational e-commerce dataset containing 700 orders using MySQL.
- Wrote SQL queries with JOINs, CTEs, subqueries and window functions to analyze revenue, profit, customers and product performance.
- Designed Power BI relationships and DAX measures for Revenue, Profit, AOV and Profit Margin.
- Translated query results into business KPIs and dashboard requirements.

## Important Note

This project does **not** represent real client or employer data. The dataset is synthetic and intended for skill demonstration.
