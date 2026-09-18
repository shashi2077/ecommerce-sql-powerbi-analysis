# Power BI Build Guide

## Recommended Data Model

Relationships:

- `customers[customer_id]` 1 → * `orders[customer_id]`
- `orders[order_id]` 1 → * `order_items[order_id]`
- `products[product_id]` 1 → * `order_items[product_id]`

## Page 1 — Executive Overview

### KPI cards
- Total Revenue
- Total Profit
- Delivered Orders
- Average Order Value
- Profit Margin %

### Visuals
- Monthly Revenue Trend
- Revenue by Category
- Revenue by City
- Order Status Distribution
- Top 10 Customers

## Page 2 — Product Analysis

- Revenue by Product
- Profit by Product
- Category Contribution
- Product Ranking
- Discount Analysis

## Page 3 — Customer Analysis

- Revenue by Customer Segment
- Repeat vs One-time Customers
- Customer Order Frequency
- Top Customer Table
- City-wise Revenue

## Core DAX Measures

```DAX
Total Revenue =
CALCULATE(
    SUMX(
        order_items,
        order_items[quantity] * order_items[selling_price]
    ),
    orders[order_status] = "Delivered"
)

Total Profit =
CALCULATE(
    SUMX(
        order_items,
        order_items[quantity] *
        (order_items[selling_price] - order_items[unit_cost])
    ),
    orders[order_status] = "Delivered"
)

Delivered Orders =
CALCULATE(
    DISTINCTCOUNT(orders[order_id]),
    orders[order_status] = "Delivered"
)

Average Order Value =
DIVIDE(
    [Total Revenue],
    [Delivered Orders]
)

Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Revenue]
)
```

## Expected KPI Results

After importing the CSV files and applying the Delivered order filter, the main measures should return:

- Delivered Orders: **617**
- Revenue: **₹1,66,36,756**
- Profit: **₹49,37,027**
- Average Order Value: **₹26,964**
- Highest-Revenue Category: **Electronics**
- Highest-Revenue City: **Bengaluru**

If your results differ significantly, verify the order-status filter and table relationships.
