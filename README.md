# 🍕 Pizza Sales Analysis — SQL & Power BI

An end-to-end pizza sales analysis project using SQL and Power BI to explore revenue, order patterns, pizza categories, product performance, and customer ordering trends.

## 📊 Dashboard Preview

### Page 1 — Sales Overview

![Pizza Sales Dashboard — Sales Overview](Power%20BI/Pizza-Sales-Dashboard-Page-1.png)

This page presents the main sales KPIs and trends:
- **Total Revenue:** ₹817.86K
- **Total Pizzas Sold:** 49.574K
- **Total Orders:** 21.35K
- **Average Order Value:** ₹38.31

Visuals include revenue by pizza category, monthly revenue trend, revenue by pizza size, and orders by hour. Year, quarter, and month slicers are available for filtering.

### Page 2 — Product & Category Analysis

![Pizza Sales Dashboard — Product and Category Analysis](Power%20BI/Pizza-Sales-Dashboard-Page-2.png)

This page explores:
- Top 5 best-selling pizza types by quantity
- Top 5 pizza types by revenue
- Quantity sold by pizza category
- Revenue contribution by the top 10 pizza types
- Top 3 pizza types by revenue within each category
- Most commonly ordered pizza size

## 🎯 Project Objectives

- Measure overall sales performance using key performance indicators.
- Compare revenue and quantity across pizza categories and sizes.
- Identify top-performing pizza types by sales quantity and revenue.
- Explore how order volume changes throughout the day.
- Review monthly revenue trends and provide a dashboard for interactive analysis.

## 🧰 Tools & Technologies

- **SQL** — querying and aggregating sales data
- **Power BI** — interactive reports and visualizations
- **DAX** — KPI measures and calculations
- **Excel/CSV** — source data preparation, where applicable

## 🗂️ Dataset

The data model uses four tables:

| Table | Purpose |
|---|---|
| `orders` | Order identifier, date, and time |
| `order_details` | Order line items, pizza identifier, and quantity |
| `pizzas` | Pizza identifier, type identifier, size, and price |
| `pizza_types` | Pizza type name and category |

The model connects orders to order details, order details to pizzas, and pizzas to pizza types.

## 📌 Key Metrics

| KPI | Value shown in dashboard |
|---|---:|
| Total Revenue | ₹817.86K |
| Total Pizzas Sold | 49.574K |
| Total Orders | 21.35K |
| Average Order Value | ₹38.31 |

*Values are transcribed from the dashboard screenshots. They may display rounded/abbreviated values.*

## 🔎 Highlights Visible in the Dashboard

- **Classic** is the highest-revenue category in the category chart (approximately 220K).
- The monthly revenue line chart shows fluctuations across the year, with its highest displayed point around July (72.6K).
- The Thai Chicken Pizza is shown as the top pizza by revenue in the Top 5 revenue chart (43.434K).
- The Classic Deluxe Pizza is shown as the top seller by quantity in the Top 5 best-selling chart (2,453).
- The large pizza size is the most common size shown in the size distribution chart (38.24%).

These highlights are based on the visible dashboard labels and should be interpreted in the context of the selected filters.

## 📁 Repository Structure

```text
Pizza-Sales-Analysis-SQL-Power-BI/
├── DataSet/
├── Power BI/
│   ├── Pizza-Sales-Dashboard-Page-1.png
│   ├── Pizza-Sales-Dashboard-Page-2.png
│   └── <your Power BI .pbix file>
├── SQL/
├── SQL Questions/
└── README.md
```

Keep your existing dataset and SQL files in their current folders. Add the two extracted PNG files to the `Power BI` folder so the preview images render in GitHub.

## 🚀 How to Explore

1. Review the dashboard screenshots above.
2. Open the SQL folder to explore the queries.
3. Open the SQL Questions folder to review the business questions addressed.
4. If included, open the `.pbix` file in Power BI Desktop to interact with the report.

## 👤 Author

**Rahul Verma**

Data Analytics Portfolio Project — SQL & Power BI
