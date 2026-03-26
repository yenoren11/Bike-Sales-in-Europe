# Bike Sales in Europe Data Analysis and Report

This project provides a comprehensive analysis of bike sales performance across the European market. It covers the entire data lifecycle—from SQL-based extraction and Python cleaning to exploratory data analysis (EDA) and interactive Power BI dashboarding.

## 1. Project Overview
The primary objective is to support strategic business decisions by:
* **Analyzing Sales Trends:** Identifying high-performing regions and peak sales periods.
* **Customer Profiling:** Segmenting customers by age, gender, and location to understand purchasing behavior.
* **Product Performance:** Evaluating revenue and profit margins across different bike categories and accessories.
* **Data-Driven Insights:** Proposing actionable recommendations to optimize inventory and marketing spend.

## 2. Dataset Summary
Source: [Kaggle](https://www.kaggle.com/datasets/sadiqshah/bike-sales-in-europe)

The analysis is based on a comprehensive bike sales dataset containing historical transactions in Europe.

**Key Variables:**
* `Date`, `Day`, `Month`, `Year`: Transaction date.
* `Customer_Age`, `Age_Group` & `Customer_Gender`: Demographic details of the buyers.
* `Country` & `State`: Geographic location of the sales.
* `Product_Category`, `Sub_Category` & `Product`: Classification of items sold.
* `Order_Quantity`: Number of units purchased.
* `Unit_Cost` & `Unit_Price`: Pricing structure.
* `Revenue`, `Cost`, & `Profit`: Key financial metrics derived for performance tracking.


## 3. Methodology
The project follows a structured data science workflow:

### **Data Preparation & Cleaning**
* Used **SQL** to query and filter raw transactional data.
* Handled missing values, removed duplicates, and corrected data types using **Python (Pandas)**.
* Exported the cleaned dataset (`Sales_Cleaned.csv`) for downstream visualization.

### **Exploratory Data Analysis (EDA)**
* Performed statistical analysis to identify outliers and distributions.
* Visualized correlations between customer demographics and product preferences using **Matplotlib** and **Seaborn**.
* Conducted time-series analysis to detect yearly and monthly growth trends.

### **Interactive Dashboarding**
* Built a multi-page **Power BI** dashboard to provide a "bird's-eye view" of business health.
* Implemented dynamic filters (Slicers) for Country, Year, and Product Category.
* Developed specific views for **Location Analysis** and **Product Profitability**.

## 4. Dashboard Proposal: Revenue & Inventory Efficiency
Key Insights
* **Overall Performance:** Total revenue is **95M** with total profit **42M** and a **44.26%** profit margin.
* **Category Mix (Revenue & Profit):** **Bikes** dominate both revenue and profit, followed by **Accessories**, while **Clothing** contributes the least.
* **Top Products by Revenue:** Sales are led by **Road-150 Red** (highest at **4.2M**), with **Mountain-200 Black** (**3.7M**) and **Mountain-200 Silver** (**3.4M**) as the next strongest performers.
* **Customer Segmentation:** Revenue is nearly evenly split by gender (**Male 50.81%** vs **Female 49.19%**). By age, **Seniors (64+)** are the top revenue segment (followed by **Adults (35-64)**).
* **Top Markets & Profit Margin:** The **United States** and **Australia** lead in both revenue and profit. However, **Canada** shows the strongest profit margin (mid-40% range), indicating better efficiency despite smaller scale.

## 5. Repository Structure
* `Data/`: Contains raw and processed CSV files.
* `SQL/`: SQL scripts for data extraction and cleaning.
* `Notebooks/`: Jupyter Notebook containing the Python EDA.
* `Dashboard/`: The Power BI `.pbix` file and a PDF summary.
* `Images/`: Screenshots of the dashboard for quick preview.

---
**Developed by:** Nguyen Pham Hoang Yen
