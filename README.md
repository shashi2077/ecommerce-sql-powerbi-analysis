# E-commerce SQL Analysis with Power BI Model Design

## Project Overview

This project analyzes a synthetic e-commerce dataset using SQL. It also includes a Power BI data-model and DAX guide for building a dashboard from the same data.

The analysis covers:

- Revenue and profit
- Monthly sales trends
- Product and category performance
- Customer behavior
- Repeat customers
- Geographic performance
- Order status
- Average Order Value

## Tools

- MySQL 8+
- SQL
- CSV datasets
- Relational data modeling
- Power BI model design
- DAX measures

## Dataset

The project contains:

- **250 customers**
- **30 products**
- **700 orders**
- **1,782 order-item records**

The dataset is synthetic. No client or employer data is used.

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

## SQL Techniques Used

- SELECT / WHERE
- INNER JOIN / LEFT JOIN
- GROUP BY
- Aggregate functions
- CASE
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- DENSE_RANK
- Running totals
- Date aggregation

## Power BI Design Included

The repository includes:
- Recommended table relationships
- KPI definitions
- DAX measures
- Suggested dashboard pages and visuals

A Power BI `.pbix` file is **not included** in this repository.

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

## Business Questions

1. What are total revenue, profit and Average Order Value?
2. How does revenue change month by month?
3. Which product categories generate the most revenue and profit?
4. Who are the top customers?
5. Which cities contribute the most revenue?
6. What percentage of orders are delivered, cancelled or returned?
7. How many customers are repeat customers?
8. Which products rank highest within each category?
9. What does cumulative revenue growth look like?
10. Which products perform above average revenue?

## Run the SQL Analysis

1. Create the tables using `schema.sql`.
2. Import the CSV files into the matching tables.
3. Run `analysis_queries.sql`.
4. Review the query results against the KPI summary above.

## Power BI Guide

See [powerbi_dashboard_guide.md](powerbi_dashboard_guide.md) for the data model and DAX measures.

## Data Note

All names and records are synthetic and are included only as analysis data.
