1️⃣ Project Overview

Brief intro:

This project analyzes the Brazilian Olist e-commerce dataset using SQL and Power BI to uncover revenue drivers, customer behavior, seller performance, and logistics impact.

2️⃣ Data Cleaning & Preparation

(Use what you already wrote ✔)

Converted order timestamp columns into proper DATETIME format

Extracted year, month, and weekday for time-based analysis

Filtered only delivered orders to ensure business-valid metrics

Created delivery delay metrics using estimated vs actual delivery dates

Built a consolidated analytical view combining orders, customers, products, sellers, and payments

3️⃣ Exploratory Data Analysis (EDA)

Summarize (not raw SQL):

96,455 delivered orders analyzed

Total revenue of R$ 19.77M

Stable AOV of R$ 204.99

Clear growth trend and seasonality

Weekday dominance (Wednesday highest)

4️⃣ Payment & Revenue Analysis

Include your clean table + insights:
Payment Type	Revenue (R$)
Credit Card	15.19M
Boleto	3.94M
Voucher	0.39M
Debit Card	0.24M

Insight:
Credit cards contribute ~77% of total revenue, making them the dominant transaction mode.

5️⃣ Revenue Concentration & Pareto Effect

Small set of products generate disproportionate revenue

Top products exceed R$ 100K+ individually

Categories like telefonia_fixa, beleza_saude, informatica_acessorios dominate

6️⃣ Seller Performance Analysis

Top seller generated R$ 505K+ alone

Revenue highly concentrated among top 10 sellers

Clear contrast between high-value sellers vs high-volume sellers

7️⃣ Category Demand vs Profitability

High order volume ≠ high revenue

Example:

cama_mesa_banho → high volume

informatica_acessorios → higher revenue per order

8️⃣ Premium Categories (High AOV)

pcs → R$ 1,271

telefonia_fixa → R$ 737

Strong upselling opportunities

9️⃣ Freight Cost & Logistics Impact

Avg freight: R$ 20

Avg product price: R$ 120

High-risk categories:

casa_conforto_2 → 93% freight-to-price

telefonia → 50%

🔟 Advanced Customer Analytics

(Use exactly what you wrote — it’s very strong)

One-time vs repeat customers

Revenue by customer type

CLV analysis

Repeat purchase behavior
