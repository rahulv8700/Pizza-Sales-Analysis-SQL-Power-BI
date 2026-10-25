
-- ============================================================
-- PIZZA SALES ANALYSIS PROJECT
-- Database: MySQL
-- Total Questions: 13
-- ============================================================


-- ======================== BASIC ==============================

-- Q1. Retrieve the total number of orders placed

SELECT
    COUNT(order_id) AS Total_Orders
FROM orders;


-- Q2. Calculate the total revenue generated from pizza sales

SELECT
    ROUND(SUM(od.quantity * p.price), 0) AS Total_Revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id;


-- Q3. Identify the highest-priced pizza

SELECT
    pt.name AS Pizza_Name,
    p.price AS Pizza_Price
FROM pizza_types pt
JOIN pizzas p
    ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;


-- Q4. Identify the most common pizza size ordered

SELECT
    p.size AS Pizza_Size,
    SUM(od.quantity) AS Quantity_Sold
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY Quantity_Sold DESC
LIMIT 1;


-- Q5. List the top 5 most ordered pizza types with quantities

SELECT
    pt.name AS Pizza_Name,
    SUM(od.quantity) AS Quantity_Sold
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY Quantity_Sold DESC
LIMIT 5;



-- ===================== INTERMEDIATE ==========================

-- Q6. Total quantity of each pizza category ordered

SELECT
    pt.category AS Pizza_Category,
    SUM(od.quantity) AS Total_Quantity
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY Total_Quantity DESC;


-- Q7. Determine the distribution of orders by hour of the day

SELECT
    HOUR(time) AS Order_Hour,
    COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY HOUR(time)
ORDER BY Order_Hour;


-- Q8. Category-wise distribution of pizza types

SELECT
    category AS Pizza_Category,
    COUNT(*) AS Category_Distribution
FROM pizza_types
GROUP BY category
ORDER BY Category_Distribution DESC;


-- Q9. Average number of pizzas ordered per day

WITH daily_sales AS (
    SELECT
        o.date AS Order_Date,
        SUM(od.quantity) AS Daily_Quantity
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY o.date
)
SELECT
    Order_Date,
    Daily_Quantity,
    ROUND(AVG(Daily_Quantity) OVER (), 0)
        AS Average_Daily_Quantity
FROM daily_sales
ORDER BY Order_Date;


-- Q10. Top 3 most ordered pizza types based on revenue

SELECT
    pt.name AS Pizza_Name,
    ROUND(SUM(od.quantity * p.price), 0)
        AS Total_Revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY Total_Revenue DESC
LIMIT 3;



-- ======================== ADVANCED ===========================

-- Q11. Percentage contribution of each pizza type to total revenue

WITH pizza_revenue AS (
    SELECT
        pt.name AS Pizza_Name,
        SUM(od.quantity * p.price) AS Total_Revenue
    FROM order_details od
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.name
)
SELECT
    Pizza_Name,
    ROUND(Total_Revenue, 0) AS Total_Revenue,
    ROUND(
        Total_Revenue / SUM(Total_Revenue) OVER () * 100,
        2
    ) AS Revenue_Contribution_Percentage
FROM pizza_revenue
ORDER BY Revenue_Contribution_Percentage DESC;


-- Q12. Analyze cumulative revenue generated over time

WITH daily_revenue AS (
    SELECT
        o.date AS Order_Date,
        SUM(od.quantity * p.price) AS Revenue
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    GROUP BY o.date
)
SELECT
    Order_Date,
    ROUND(Revenue, 2) AS Daily_Revenue,
    ROUND(
        SUM(Revenue) OVER (
            ORDER BY Order_Date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS Cumulative_Revenue
FROM daily_revenue
ORDER BY Order_Date;


-- Q13. Top 3 pizza types by revenue within each category

WITH pizza_revenue AS (
    SELECT
        pt.category AS Category,
        pt.name AS Pizza_Name,
        SUM(od.quantity * p.price) AS Revenue
    FROM order_details od
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY
        pt.category,
        pt.name
),
ranked_pizzas AS (
    SELECT
        Category,
        Pizza_Name,
        ROUND(Revenue, 0) AS Revenue,
        DENSE_RANK() OVER (
            PARTITION BY Category
            ORDER BY Revenue DESC
        ) AS Revenue_Rank
    FROM pizza_revenue
)
SELECT
    Category,
    Pizza_Name,
    Revenue,
    Revenue_Rank
FROM ranked_pizzas
WHERE Revenue_Rank <= 3
ORDER BY Category, Revenue_Rank;


-- ============================================================
-- END OF PIZZA SALES ANALYSIS PROJECT
-- ============================================================
