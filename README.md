# 📦 Olist E-Commerce Performance Analysis  
### SQL & Power BI Business Intelligence Project

---

## 📌 Problem Statement
The objective of this project is to analyze the Olist Brazilian e-commerce dataset to
evaluate overall business performance and identify key insights related to
**sales trends, customer behavior, product category performance, seller contribution,
and payment patterns**.

The goal is to support data-driven decision-making for an e-commerce platform by
highlighting revenue drivers and operational improvement areas.

---

## 📂 Dataset
- **Source:** Olist Brazilian E-Commerce Dataset (public dataset)
- **Data Type:** Relational e-commerce data
- **Key Tables Used:**
  - `orders`
  - `order_items`
  - `customers`
  - `products`
  - `sellers`
  - `payments`
- **Description:**
  The dataset contains information about orders, customers, products, sellers,
  payments, and delivery timelines.
- **Note:**
  Raw dataset files are not included in this repository due to size constraints.

---

## 🛠 Tools & Technologies
- **SQL:** MySQL (Joins, Aggregations, Subqueries)
- **Visualization:** Power BI
- **Data Modeling:** Star-schema style analytical view
- **Version Control:** Git & GitHub

---

## 🔍 Approach
1. Imported relational tables into MySQL  
2. Filtered only delivered orders for accurate analysis  
3. Created a master analytical dataset by joining orders, customers, products,
   sellers, and payments  
4. Performed SQL analysis to compute KPIs and answer business questions  
5. Built an interactive Power BI dashboard for performance monitoring  
6. Interpreted results and derived actionable business insights  

---

## 📊 Business Questions Answered
1. What is the total revenue, total orders, and average order value?
2. How does revenue trend over time?
3. Which product categories contribute the most to revenue?
4. What is the distribution of repeat vs one-time customers?
5. Which sellers generate the highest revenue?
6. How do order volume and seller revenue relate?
7. What payment methods are most commonly used?

---

## 📊 Key Insights
- The platform generated **~19.77M in total revenue** across **~96K delivered orders**
- The **average order value is ~205**, indicating stable pricing behavior
- Revenue shows a **steady growth trend over time**
- A small number of product categories contribute a large share of total revenue
- **Repeat customers generate the majority of revenue**, highlighting loyalty impact
- A few sellers dominate revenue, while many sellers operate at low volume
- Credit card payments are the most preferred payment method

---

## 📸 Dashboard Preview

### Executive E-Commerce Performance Dashboard
This interactive Power BI dashboard provides a consolidated view of:
- Total revenue, orders, and average order value  
- Monthly revenue trends  
- Top product categories by revenue  
- Customer type distribution (repeat vs one-time)  
- Seller performance and revenue concentration  
- Payment method preferences  

![Olist E-commerce Dashboard](Dashboard.png)

---

## 💡 Business Recommendations
- Focus marketing and promotions on **high-revenue product categories**
- Strengthen loyalty programs to retain and grow repeat customers
- Monitor top sellers closely and support mid-tier sellers to scale
- Optimize logistics and seller performance to sustain revenue growth
- Use payment behavior insights to reduce transaction friction

---

## ✅ Solution / Outcome
This project successfully transforms raw e-commerce data into a **single executive-level
dashboard** that enables stakeholders to monitor performance, identify revenue drivers,
and uncover customer behavior patterns using SQL and Power BI.

---

## 🏁 Conclusion
The analysis demonstrates how structured SQL analysis combined with Power BI
visualization can provide meaningful insights into e-commerce operations.
A single well-designed dashboard is sufficient to track KPIs, trends, and business
health, enabling informed strategic decisions.

---

## 📁 Repository Structure
