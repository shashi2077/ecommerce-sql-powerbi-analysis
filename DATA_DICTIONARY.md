# Data Dictionary

## customers.csv
| Column | Meaning |
|---|---|
| customer_id | Unique customer ID |
| customer_name | Synthetic customer label |
| city | Customer city |
| segment | Consumer, Corporate or Small Business |
| signup_date | Customer signup date |

## products.csv
| Column | Meaning |
|---|---|
| product_id | Unique product ID |
| product_name | Product label |
| category | Product category |
| list_price | Standard list price |
| unit_cost | Product cost per unit |

## orders.csv
| Column | Meaning |
|---|---|
| order_id | Unique order ID |
| customer_id | Customer foreign key |
| order_date | Date of order |
| order_status | Delivered, Cancelled or Returned |
| payment_method | Payment type |

## order_items.csv
| Column | Meaning |
|---|---|
| order_item_id | Unique order-line ID |
| order_id | Order foreign key |
| product_id | Product foreign key |
| quantity | Units ordered |
| selling_price | Selling price per unit after discount |
| unit_cost | Unit cost |
| discount_pct | Discount percentage as decimal |
