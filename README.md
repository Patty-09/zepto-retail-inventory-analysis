<p align="center">
  <img
    src="https://cdn.zeptonow.com/web-static-assets-prod/artifacts/15.12.0/images/header/primary-logo.svg"
    alt="Zepto Logo"
    width="160"
  />
</p>

<h1 align="center">Zepto Retail & Inventory Analytics</h1>
<p align="center">
  Exploring Retail Data | PostgreSQL | Business Intelligence
</p>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-Analytics-orange?style=for-the-badge&logo=databricks&logoColor=white" />
  <img src="https://img.shields.io/badge/Data%20Cleaning-2E8B57?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Business%20Intelligence-6C63FF?style=for-the-badge" />
</p>

<p align="center">
  <b>From Raw Retail Data to Meaningful Business Insights.</b>
  <br/>
  An end-to-end SQL analytics project exploring product pricing, discount strategies, and inventory performance using PostgreSQL.
</p>

---

## 📊 Project Snapshot

| | |
|---|---|
| **Domain** | Retail & E-commerce Analytics |
| **Database** | PostgreSQL |
| **Dataset** | Zepto Product Dataset |
| **Primary Focus** | Product, Pricing & Inventory Analysis |
| **SQL Level** | Basic to Advanced |
| **Project Status** | 🚧 In Progress |

---

## 🔍 About the Project

Retail businesses handle thousands of products with varying prices, discounts, categories, and inventory levels.

But raw product data alone cannot answer important business questions.

This project uses **PostgreSQL** to transform raw Zepto product data into structured information and business-oriented insights.

The analysis focuses on understanding product distribution, pricing patterns, discount strategies, stock availability, and inventory valuation.

**The goal is simple:** Think beyond SQL queries and understand what the data tells us about the business.

---

## 🎯 Business Questions We're Solving

<details>
<summary><b>📦 Product & Category Analysis</b></summary>

- Which category has the highest number of products?
- What is the average selling price across categories?
- Which categories contain the heaviest products?
- How are products distributed across categories?

</details>

<details>
<summary><b>💰 Pricing & Discount Analysis</b></summary>

- Which products offer the highest discounts?
- Which products have high MRP but low discounts?
- Which category offers the highest average discount?
- Which products provide the best value per gram?
- How much discount is offered in absolute monetary terms?

</details>

<details>
<summary><b>📊 Inventory Analysis</b></summary>

- Which products are out of stock?
- Which products have critical inventory levels?
- Which category has the highest inventory value?
- What is the total inventory weight by category?
- Are there inconsistencies in stock availability?

</details>

<details>
<summary><b>📈 Advanced Business Analysis</b></summary>

- Which products are priced above their category average?
- What is each category's contribution to total inventory value?
- What are the top three most expensive products in each category?
- Which products contribute the most to inventory value?

</details>

---

## 🧰 Tech Stack & Skills

<p align="left">
  <img src="https://skillicons.dev/icons?i=postgresql,git,github" />
</p>

| Area | Skills Applied |
|---|---|
| Database | PostgreSQL, Table Creation, Data Types |
| Data Exploration | Filtering, Sorting, Aggregation |
| Data Cleaning | NULL Handling, Duplicate Checks, Validation |
| SQL Analysis | Joins, Subqueries, GROUP BY, HAVING |
| Advanced SQL | CTEs, CASE, Window Functions |
| Database Engineering | Views, Indexes, Constraints |
| Optimization | EXPLAIN, EXPLAIN ANALYZE |
| Business Analysis | Pricing, Discounts, Inventory Valuation |

---

## ⚙️ Analytical Workflow

<p align="center">
  <img src="https://img.shields.io/badge/01-Data%20Collection-4169E1?style=flat-square" />
  →
  <img src="https://img.shields.io/badge/02-Exploration-4169E1?style=flat-square" />
  →
  <img src="https://img.shields.io/badge/03-Cleaning-4169E1?style=flat-square" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/04-SQL%20Analysis-2E8B57?style=flat-square" />
  →
  <img src="https://img.shields.io/badge/05-Business%20Insights-2E8B57?style=flat-square" />
  →
  <img src="https://img.shields.io/badge/06-Optimization-2E8B57?style=flat-square" />
</p>

### Project Execution

| Phase | Description |
|---|---|
| 01 | Database and table verification |
| 02 | Exploratory Data Analysis |
| 03 | Data Cleaning & Quality Checks |
| 04 | Basic Business Analysis |
| 05 | Advanced Business Analysis |
| 06 | CTEs & Window Functions |
| 07 | Reusable SQL Views |
| 08 | Indexing & Query Optimization |
| 09 | Final Business Summary |

---

## 🗄️ Database Structure

**Database:** `zepto_SQL_project`

**Table:** `zepto`

| Column | Description |
|---|---|
| sku_id | Unique product ID |
| category | Product category |
| name | Product name |
| mrp | Maximum Retail Price |
| discountPercent | Discount percentage |
| availableQuantity | Available stock quantity |
| discountedSellingPrice | Final selling price |
| weightInGms | Product weight |
| outOfStock | Stock availability flag |
| quantity | Dataset quantity field |

---

## 📌 Key Analytical Areas

### 1. Product Performance
Understand product distribution, pricing and category-level patterns.

### 2. Discount Intelligence
Identify high-discount products and compare discount strategies across categories.

### 3. Inventory Intelligence
Evaluate available stock, inventory value and stock-level inconsistencies.

### 4. Advanced SQL Analysis
Use CTEs, subqueries and window functions to answer multi-level business questions.

### 5. Query Optimization
Investigate PostgreSQL execution plans and understand the impact of indexes on query performance.

---

## 💡 Key Business Insights

*Findings will be populated after validating actual query results.*

| KPI | Business Interpretation |
|---|---|
| Total Products | Size of the product catalog |
| Total Categories | Diversity of product categories |
| Average Discount | Overall discount strategy |
| Out-of-Stock % | Product availability |
| Inventory Value | Estimated value of current inventory |
| Category Contribution | Share of inventory value by category |

---

## 📂 Repository Structure

```text
zepto-retail-inventory-analysis/
│
├── data/
│   └── README.md
│
├── sql/
│   ├── 01_database_verification.sql
│   ├── 02_data_exploration.sql
│   ├── 03_data_cleaning.sql
│   ├── 04_basic_analysis.sql
│   ├── 05_advanced_analysis.sql
│   ├── 06_cte_window_functions.sql
│   ├── 07_views.sql
│   ├── 08_indexing_optimization.sql
│   └── 09_business_summary.sql
│
├── results/
│   └── README.md
│
└── README.md
```

---

## 🚀 Getting Started

### Requirements

- PostgreSQL
- pgAdmin 4
- Zepto product dataset (CSV)

### Setup

**1. Clone the repository**

```bash
git clone https://github.com/Patty-09/zepto-retail-inventory-analysis.git
```

**2. Create the database**

```sql
CREATE DATABASE zepto_SQL_project;
```

**3. Import the dataset**

Create the `zepto` table and import the CSV dataset.

**4. Execute SQL scripts**

Run the SQL files in numerical order using pgAdmin Query Tool.

**5. Explore the results**

Review the query outputs and document the actual business insights.

---

## 🔮 Future Enhancements

- Connect PostgreSQL with Power BI.
- Develop an interactive retail inventory dashboard.
- Add transaction-level data for actual revenue analysis.
- Explore advanced SQL optimization.
- Build category-level pricing and inventory visualizations.

---

## 👩‍💻 About the Author

**Pratibha Patel**

🎯 Aspiring Data Analyst | SQL | PostgreSQL | Power BI | Python

Interested in data exploration, business intelligence, and transforming raw datasets into meaningful insights.

<p align="left">
  <a href="https://github.com/Patty-09">
    <img src="https://img.shields.io/badge/GitHub-Profile-181717?style=for-the-badge&logo=github" />
  </a>
  <a href="https://www.linkedin.com/">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin" />
  </a>
</p>

---

<p align="center">
  <b>Turning Data Into Decisions. 📊</b>
  <br/>
  ⭐ If you find this project useful, consider starring the repository!
</p>
