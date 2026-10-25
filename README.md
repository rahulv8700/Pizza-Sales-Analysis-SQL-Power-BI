# 🍕 Pizza Sales Analysis | SQL & Power BI

## 📌 Project Overview

This project analyzes pizza sales data using SQL and Power BI to identify sales trends, revenue performance, customer ordering patterns, and top-performing pizza products.

The goal is to transform raw sales data into meaningful business insights through SQL queries, data modeling, DAX calculations, and interactive Power BI dashboards.

## 🎯 Business Objectives

- Analyze total revenue and total orders.
- Identify the best-selling pizza types.
- Determine the highest-revenue pizza products.
- Compare revenue and sales quantity across pizza categories.
- Analyze order patterns by hour and month.
- Identify the most popular pizza sizes.
- Calculate the contribution of top-selling pizza types to overall revenue.
- Rank the top 3 pizza types by revenue within each category.

## 🛠️ Tools & Technologies

- **SQL:** Data analysis, joins, aggregations, CTEs, and window functions.
- **Microsoft Power BI:** Interactive dashboards and data visualization.
- **DAX:** Measures and business calculations.
- **Microsoft Excel:** Data inspection and validation.

## 📂 Dataset

The project uses four related tables:

| Table | Description |
|---|---|
| `orders` | Order IDs, dates, and times |
| `order_details` | Order IDs, pizza IDs, and quantities |
| `pizzas` | Pizza IDs, sizes, prices, and pizza type IDs |
| `pizza_types` | Pizza type IDs, names, categories, and ingredients |

The tables are connected through relationships to support combined analysis of revenue, quantities, and ordering trends.

## 📊 Key Performance Indicators (KPIs)

The dashboard tracks the following metrics:

- **Total Revenue:** Total sales value generated from pizza orders.
- **Total Orders:** Number of distinct orders placed.
- **Total Pizzas Sold:** Total quantity of pizzas sold.
- **Average Order Value:** Revenue divided by the number of orders.

## 📈 Dashboard Pages

### Page 1 — Sales Overview

The first dashboard provides an overview of overall sales performance.

Key visuals include:
- Revenue by pizza category.
- Monthly revenue trends.
- Revenue distribution by pizza size.
- Orders by hour of the day.
- KPI cards for revenue, orders, pizzas sold, and average order value.

### Page 2 — Product & Category Analysis

This page focuses on pizza product performance.

Key visuals include:
- Top 5 best-selling pizza types.
- Top 5 pizza types by revenue.
- Quantity sold by pizza category.
- Revenue contribution by the top 10 pizza types.
- Top 3 pizza types by revenue within each category.
- Most commonly ordered pizza size.

### Page 3 — Advanced Sales Analysis

Planned analysis includes:
- Cumulative revenue over time.
- Average pizzas ordered per day.
- Highest-priced pizza.
- Orders by day of the week.

## 🧮 DAX Measures

### Total Orders

```DAX
Total Orders =
DISTINCTCOUNT('working orders'[order_id])
```

### Total Revenue

```DAX
Total_Revenue =
SUMX(
    'working order_details',
    'working order_details'[quantity] *
    RELATED('working pizzas'[price])
)
```

### Total Pizzas Sold

```DAX
Total_Pizzas_Sold =
SUM('working order_details'[quantity])
```

### Average Order Value

```DAX
Average Order Value =
DIVIDE(
    [Total_Revenue],
    [Total Orders]
)
```

## 🔍 SQL Analysis

The SQL analysis covers business questions such as:

1. How many orders were placed?
2. What is the total revenue?
3. Which pizza has the highest price?
4. Which pizza size is ordered most frequently?
5. What are the top 5 best-selling pizza types?
6. Which pizza categories generate the most revenue?
7. How are orders distributed throughout the day?
8. Which pizza types generate the highest revenue?
9. What is the revenue contribution of the top 10 pizza types?
10. Which three pizza types generate the most revenue within each category?

SQL techniques used include:
- `JOIN`
- `GROUP BY`
- Aggregate functions
- Common Table Expressions (CTEs)
- Subqueries
- Window functions such as `RANK()` and `DENSE_RANK()`

## 💡 Key Learnings

Through this project, I practiced:

- Relational data modeling.
- Writing SQL queries for business analysis.
- Creating DAX measures in Power BI.
- Building interactive dashboards.
- Applying ranking and Top N filters.
- Comparing product performance by revenue and quantity.
- Presenting sales metrics through visualizations.

## 🚀 How to Explore the Project

1. Clone or download this repository.
2. Open the SQL scripts in your SQL environment.
3. Load the dataset into Power BI.
4. Configure the relationships between the four tables.
5. Open the Power BI `.pbix` file.
6. Explore the dashboard pages and interact with the filters.

## 👤 Author

**Rahul Verma**

Aspiring Data Analyst | SQL | Power BI | Excel | Python

This project demonstrates practical skills in data analysis, business intelligence, and dashboard development.
