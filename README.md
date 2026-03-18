# 

<div align="center">

![SQL](https://img.shields.io/badge/SQL-SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-28a745?style=for-the-badge)
![Dataset](https://img.shields.io/badge/Dataset-Kaggle-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)
![Records](https://img.shields.io/badge/Orders-100K%2B-FF6B35?style=for-the-badge)

**A structured SQL analysis of Brazil’s largest e-commerce platform — uncovering revenue patterns, customer behavior, seller efficiency, and delivery logistics.**

[📁 View Queries](#-project-structure) • [💡 Key Insights](#-key-insights) • [🗄 Dataset](#-dataset)

</div>

-----

## 📊 Project Overview

This project performs an end-to-end SQL analysis of the **Brazilian Olist E-Commerce dataset** — a real-world dataset containing over **100,000 orders** placed across multiple marketplaces from **2016 to 2018**.

Using SQLite, the analysis answers **25 business-driven questions** across five analytical domains:

|Domain                |Focus                                           |
|----------------------|------------------------------------------------|
|💰 Sales & Revenue     |Revenue trends, top categories, geographic sales|
|👤 Customer Behavior   |Order frequency, repeat buyers, AOV             |
|📦 Product Performance |Category rankings, review scores, shipping costs|
|🏪 Seller Performance  |Revenue, delivery speed, ratings, cancellations |
|🚚 Delivery & Logistics|Delivery times, delays, impact on reviews       |

-----

## 🧠 Business Questions Answered

<details>
<summary><strong>💰 1. Sales & Revenue Analysis</strong></summary>

1. What is the total revenue generated per year and per month?
1. Which product categories generate the highest revenue?
1. What are the top 10 most profitable products?
1. Which states or cities generate the most sales revenue?
1. How much revenue does each seller generate on average?

</details>

<details>
<summary><strong>👤 2. Customer Behavior Analysis</strong></summary>

1. Which customers placed the highest number of orders?
1. What is the average number of orders per customer?
1. Which states have the highest number of customers?
1. What percentage of customers are repeat buyers?
1. What is the average order value (AOV) per customer?

</details>

<details>
<summary><strong>📦 3. Product Performance</strong></summary>

1. Which product categories are purchased the most?
1. Which product categories receive the highest average review score?
1. Which product categories receive the lowest ratings?
1. What categories generate high sales but low customer satisfaction?
1. Which products have the highest shipping costs relative to price?

</details>

<details>
<summary><strong>🏪 4. Seller Performance</strong></summary>

1. Which sellers have the highest total revenue?
1. Which sellers deliver orders the fastest?
1. Which sellers receive the best customer review ratings?
1. Which sellers have the highest cancellation rate?
1. How many product categories does each seller sell on average?

</details>

<details>
<summary><strong>🚚 5. Delivery & Logistics</strong></summary>

1. What is the average delivery time from purchase to delivery?
1. Which states experience the longest delivery times?
1. What percentage of orders are delivered later than the estimated date?
1. Does delivery delay affect review scores?
1. Which product categories have the longest shipping times?

</details>

-----

## 🗄 Dataset

**Source:** [E-commerce dataset by Olist (SQLite) — Kaggle](https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database/data)

The dataset is provided by **Olist**, the largest department store in Brazilian marketplaces, and contains anonymized commercial data across:

- 📦 **100,000+ orders** from 2016–2018
- 🧑 Customer locations and demographics
- 🏷 Product attributes and categories
- 🏪 Seller information
- 💳 Payment methods and values
- ⭐ Customer reviews and ratings
- 🚚 Delivery timestamps and estimated dates

-----

## 🗂 Database Schema

The diagram below shows how the eight core tables relate to each other in the SQLite database:

![Database Schema](e-commerce_db.png)

> *Primary keys and foreign keys link orders, customers, products, sellers, payments, and reviews into a unified relational model.*

-----

## 🧩 Database Tables Used

|Table                              |Description                                           |
|-----------------------------------|------------------------------------------------------|
|`olist_orders_dataset`             |Core order records with status and timestamps         |
|`olist_order_items_dataset`        |Line items per order (product, seller, price, freight)|
|`olist_order_payments_dataset`     |Payment type and value per order                      |
|`olist_order_reviews_dataset`      |Customer review scores and comments                   |
|`olist_customers_dataset`          |Customer location and unique IDs                      |
|`olist_products_dataset`           |Product attributes and category names                 |
|`olist_sellers_dataset`            |Seller location information                           |
|`product_category_name_translation`|Portuguese-to-English category name mapping           |

-----

## ⚙️ SQL Techniques Used

```sql
-- What categories generate high sales but low customer satisfaction?
SELECT
SELECT
   products.product_category_name AS ProductCategoryName,
   AVG(review_score) AS HighestAverageReviewScore
FROM
    products
JOIN order_items
ON products.product_id = order_items.product_id
JOIN order_reviews
ON order_reviews.order_id = order_items.order_id
GROUP BY ProductCategoryName
ORDER BY HighestAverageReviewScore DESC;
```

**Techniques demonstrated in this project:**

|Technique                    |Usage                                           |
|-----------------------------|------------------------------------------------|
|`JOIN`                       |Linking orders, customers, products, sellers    |
|`GROUP BY` / `ORDER BY`      |Aggregating by category, state, seller          |
|`COUNT()` / `SUM()` / `AVG()`|Revenue, order volume, ratings                  |
|`CASE WHEN`                  |Conditional logic for delay flags, repeat buyers|
|`ROUND()`                    |Formatting monetary and ratio outputs           |
|`strftime()`                 |Extracting year/month from timestamps           |
|`julianday()`                |Calculating delivery duration in days           |
|Subqueries                   |Filtering on aggregated results                 |

-----

## 📈 Key Insights

> Findings derived from SQL queries across the full dataset.

- 📦 **Top revenue categories** — A small number of product categories (e.g., *bed_bath_table*, *health_beauty*, *sports_leisure*) account for a disproportionate share of total revenue.
- 🔁 **Low repeat purchase rate** — The majority of customers placed only a single order, highlighting an opportunity to improve retention strategies.
- ⭐ **Delivery delays hurt ratings** — Orders delivered beyond the estimated date consistently receive lower review scores, confirming a direct link between logistics and satisfaction.
- ⚠️ **High sales ≠ high satisfaction** — Several top-selling categories show below-average review scores, suggesting quality or expectation mismatch issues.
- 🚚 **Regional delivery gaps** — Northern and northeastern Brazilian states experience significantly longer average delivery times compared to São Paulo and southern states.
- 🏪 **Seller performance varies widely** — Revenue and delivery efficiency differ substantially across sellers, with a small subset of high-performers driving outsized results.

-----

## 🛠 Tools Used

|Tool                                                                                                   |Purpose                                      |
|-------------------------------------------------------------------------------------------------------|---------------------------------------------|
|![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat&logo=sqlite&logoColor=white)           |Query execution and data analysis            |
|![VSCode](https://img.shields.io/badge/VS_Code-007ACC?style=flat&logo=visualstudiocode&logoColor=white)|Development environment with SQLite extension|
|![DB Browser](https://img.shields.io/badge/DB_Browser_for_SQLite-4A90D9?style=flat)                    |Visual database exploration                  |
|![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)           |Version control and project showcase         |

-----

## 📂 Project Structure

```
Olist-SQL-Analysis/
│
├── queries/
│   ├── sales_analysis/          # Revenue & category queries
│   ├── customer_analysis/       # Behavior & retention queries
│   ├── product_analysis/        # Performance & ratings queries
│   ├── seller_analysis/         # Revenue & delivery queries
│   └── delivery_analysis/       # Logistics & delay queries
│
│   ├── e-commerce_dd.png        # Database schema diagram
│   ├── questions.txt            # Full list of business questions
│   └── olist.sqlite             # SQLite database file
│
└── README.md
```

-----

## 🚀 Future Improvements

- [ ] 📊 Build interactive dashboards in **Power BI** or **Tableau**
- [ ] 🤖 Develop predictive models for delivery time estimation
- [ ] 👥 Implement customer segmentation (RFM analysis)
- [ ] 🔁 End-to-end data pipeline from raw data to dashboard
- [ ] 🗺 Geospatial visualization of order distribution across Brazil

-----

## 👨‍💻 Author

**Lucky Langa**

*Aspiring Data Analyst / Data Scientist passionate about transforming raw data into actionable business insights.*

[![GitHub](https://img.shields.io/badge/GitHub-Lucky--Langa-181717?style=for-the-badge&logo=github)](https://github.com/Lucky-Langa)

-----

<div align="center">

⭐ **If you found this project useful, consider giving it a star!** ⭐

</div>