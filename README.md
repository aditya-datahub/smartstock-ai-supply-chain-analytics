# SmartStock AI — Supply Chain & Demand Forecasting Analytics

> An end-to-end supply chain analytics platform designed to detect stockout risks, measure revenue leakage, optimize warehouse operations, and forecast future demand using SQL, Python, Machine Learning, and Power BI.

---

## Business Problem

In quick-commerce and retail operations, inventory issues directly impact revenue and customer experience.

Without accurate demand forecasting and inventory visibility, businesses often face:

- Unexpected stockouts leading to lost sales
- High order cancellation rates
- Overstocking and increased holding costs
- Poor warehouse allocation
- Missed demand spikes during peak periods

**SmartStock AI** was built to solve these challenges through a complete analytics workflow covering inventory tracking, revenue analysis, warehouse performance monitoring, and demand forecasting.

---

## Solution Overview

SmartStock AI analyzes operational data across:

- 10 warehouses
- 1,00,000+ customer orders
- 6 product categories
- Multi-city supply chain operations

The project combines:

- Advanced SQL analytics
- Exploratory Data Analysis (EDA)
- Demand forecasting using Prophet
- Interactive Power BI dashboards

to generate actionable business insights for supply chain optimization.

---

## Dashboard Preview

![SmartStock AI Dashboard](dashboard/dashboard.png)

---

## Tech Stack

| Technology | Usage |
|---|---|
| PostgreSQL | Data storage & SQL analytics |
| Python | Data generation, EDA & forecasting |
| Pandas & NumPy | Data manipulation |
| Prophet | Time-series demand forecasting |
| Power BI | Interactive dashboard visualization |
| Git & GitHub | Version control & project management |

---

## Project Structure

```bash
smartstock-ai/
│
├── data/
│   ├── orders.csv
│   ├── products.csv
│   ├── warehouses.csv
│   ├── inventory.csv
│   └── deliveries.csv
│
├── sql/
│   ├── 00_create_tables.sql
│   ├── 01_basic_metrics.sql
│   ├── 02_product_analysis.sql
│   ├── 03_revenue_stockout.sql
│   ├── 04_warehouse_analysis.sql
│   └── 05_advanced_analytics.sql
│
├── notebooks/
│   ├── 01_data_generation.ipynb
│   ├── 02_eda_analysis.ipynb
│   └── 03_forecasting.ipynb
│
├── dashboard/
│   ├── smartstock_dashboard.pbix
│   └── dashboard.png
│
├── images/
│
└── README.md
```

---

## Dataset Information

Synthetic datasets generated using Python, Pandas, NumPy, and Faker.

| Dataset | Records | Description |
|---|---|---|
| Orders | 91,457 | Customer order transactions |
| Products | 30 | Product catalog across categories |
| Warehouses | 10 | Warehouse locations across India |
| Inventory | 300 | Warehouse-wise inventory levels |
| Deliveries | 84,104 | Delivery status and delays |

### Features Simulated

- Seasonal demand fluctuations
- Product stockouts
- Delivery delays
- Warehouse-level performance
- Weekend vs weekday demand behavior

---

## SQL Analytics Performed

### Core Business Analysis

- Revenue and order trend analysis
- Product-wise revenue contribution
- Stockout impact measurement
- Cancellation rate tracking
- Warehouse performance benchmarking

### Advanced SQL Concepts Used

- CTEs (`WITH`)
- Window Functions (`RANK`, `LAG`, `OVER`)
- Rolling 7-day averages
- Month-over-Month growth analysis
- Inventory turnover analysis
- Stockout risk classification using `CASE WHEN`

---

## Key Business Insights

### Revenue Insights

- Generated **$16.8M revenue** across 91K+ orders
- Identified **$1.5M revenue loss** due to stockouts
- March 2023 recorded highest monthly growth (**+14.66% MoM**)

### Product Insights

- **Nescafe Coffee** emerged as the highest revenue-driving product
- **Amul Butter** showed the highest stockout risk
- Beverage category contributed nearly **38% of total revenue**

### Warehouse Insights

- Bangalore Koramangala warehouse achieved highest revenue performance
- Ahmedabad Navrangpura recorded highest cancellation rate
- Delivery delays averaged nearly **15%** across warehouses

### Forecasting Insights

- Prophet forecasting model achieved **94.69% accuracy**
- Predicted significant Q1 demand spikes:
  - Frozen Foods → +22%
  - Staples → +15%
- Weekly seasonality patterns clearly identified

---

## Power BI Dashboard Features

Interactive executive dashboard including:

- KPI Cards
- Revenue trend analysis
- Category-wise revenue breakdown
- Top-performing products
- Stockout rate monitoring
- Warehouse performance comparison
- Delivery and cancellation tracking

---

## Business Recommendations

### Inventory Optimization

- Increase Q1 inventory allocation for Frozen Foods and Staples
- Prioritize replenishment for high stockout-risk products

### Warehouse Operations

- Improve replenishment cycle in Ahmedabad warehouse
- Monitor cancellation-heavy regions more aggressively

### Demand Planning

- Implement Friday pre-restocking strategy
- Retrain forecasting model monthly for improved accuracy

---

## Future Enhancements

- Real-time inventory monitoring pipeline
- Automated low-stock alert system
- Streamlit dashboard deployment
- XGBoost/LSTM forecasting comparison
- Cloud deployment using AWS or Azure

---

## How to Run the Project

### 1. Clone Repository

```bash
git clone https://github.com/aditya-datahub/smartstock-ai.git
```

### 2. Install Dependencies

```bash
pip install pandas numpy matplotlib seaborn prophet faker psycopg2
```

### 3. Run Data Generation Notebook

```bash
notebooks/01_data_generation.ipynb
```

### 4. Execute SQL Queries

Run SQL scripts inside PostgreSQL in sequence:

```bash
00_create_tables.sql
01_basic_metrics.sql
02_product_analysis.sql
03_revenue_stockout.sql
04_warehouse_analysis.sql
05_advanced_analytics.sql
```

### 5. Open Power BI Dashboard

```bash
dashboard/smartstock_dashboard.pbix
```

---

## Author

### Aditya Sharma

B.Tech Computer Science | Data Analyst

- LinkedIn: https://linkedin.com/in/your-profile
- GitHub: https://github.com/aditya-datahub
