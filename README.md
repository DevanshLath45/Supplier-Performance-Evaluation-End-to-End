---
# Supplier Performance Evaluation - An End-to-End Data Analysis Project

---
<img src="https://raw.githubusercontent.com/DevanshLath45/Supplier-Performance-Evaluation-End-to-End/main/project.png" alt="Project Logo" width="750" />

## **Project Overview**


This end-to-end data analytics project focuses on evaluating **supplier performance** for Vinspire, a retail business. The project integrates multiple tools and technologies — **from raw data handling to stakeholder reporting** — to deliver actionable insights across the supply chain.
Refer to the comprehensive [Evaluation Report.pdf](https://github.com/DevanshLath45/Supplier-Performance-Evaluation-End-to-End/blob/main/Supplier%20Performance%20Evaluation%20Report.pdf) for an in-depth overview of the analysis and key findings.

The process involves use of:

- **Excel:** Raw CSV files containing over **10 million records** were initially reviewed in Excel to understand the data structure and perform a high-level overview of available fields and data quality.

- **SQL (Microsoft SQL Server):** Acted as the backbone for data pipeline setup. Imported and structured raw datasets to build a **unified analytical base table**, enabling efficient querying for supplier performance evaluation.

- **Python:** Performed data cleaning, exploratory data analysis (EDA), and feature engineering to refine the dataset and uncover trends related to **sales**, **inventory turnover**, and **purchase behavior**.

- **Power BI:** Built an interactive dashboard tailored for stakeholders, focusing on key metrics like **gross profit margin**, **sales-to-purchase ratios**, **low turnover suppliers**, and **brand-level performance**.
 
This project focuses on the use of **end-to-end data tools** to simulate and solve **real-world business scenarios**, from raw data ingestion to stakeholder-ready insights.

## ERD Diagram
An **Entity-Relationship Diagram (ERD)** is included to visually illustrate the relationships between tables. Additional calculated tables were created in **Power BI** using **DAX** to support advanced analysis and insights.

---
<img src="https://github.com/DevanshLath45/Supplier-Performance-Evaluation-End-to-End/blob/main/Relationship.png" alt="ERD diagram" width="850" height="500"/>

---

## **Business Problem**

In the competitive alcoholic beverage distribution market, effective inventory and sales management are crucial for profitability. **VinSpire** relies on a diverse network of suppliers for its product offerings. Analyzing supplier performance allows the company to **optimize inventory, improve cash flow, maximize gross profit, and strategically align with high-performing suppliers** — critical in a highly regulated and competitive industry.
The goal of this analysis is to **identify the suppliers that help VinSpire distinguish between low-performing and high-performing partners.**

---
---

## **Phase 1: Data Preparation & Integration Workflow**
The first stage focused on setting up the data pipeline, importing raw data, and creating a unified analytical dataset to support supplier performance evaluation. Key steps performed:

- **Established a connection to SQL Server** and created a dedicated project database using Python.
- **Imported raw CSV files into SQL Server** for structured storage and efficient querying.  
- **Conducted initial data exploration** using SQL queries within Python to understand the structure, distribution, and quality of each table.  
- **Derived key observations and data relationships** by exploring trends and inconsistencies across purchases, sales, and inventory datasets.  
- **Filtered and selected relevant columns** aligned with the business objectives to reduce noise and focus on the analysis.  
- **Merged multiple tables in SQL Server** like `sales`, `purchases`, `purchase_prices`, and `supplier_invoice` to generate a comprehensive, brand-supplier level performance summary.  
- **Stored the final aggregated table** as `supplier_performance_evaluation` back in the SQL Server database to serve as the foundation for downstream analysis and dashboarding.
- Refer to the [SQL_Query.sql](https://github.com/DevanshLath45/Supplier-Performance-Evaluation-End-to-End/blob/main/SQLQuery_Supplier.sql) file to review the SQL queries used in this project.

**Summary of the aggregated table:**

- This aggregated table is built to support **supplier and brand-level performance analysis**. It captures key KPIs such as **purchase quantity**, **unit cost**, **sales revenue**, **selling price**, **excise tax**, and **freight costs**  
- Helps to avoid repeated heavy joins and aggregations on large datasets  
- Boosts performance for dashboards and reports  
- Enables quick insights into **supplier profitability**, **bulk purchasing impact**, and **underperforming brands**
- The table is **reusable and scalable for other analysts or teams**, allowing them to quickly access key supplier-brand insights without reprocessing raw data. 

---

## **Phase 2: Data Cleaning and Feature Engineering**
The second stage focused on preparing the aggregated data for detailed analysis by ensuring data quality and creating important analytical metrics. The aggregated table was imported into Python to leverage its flexibility and efficiency for cleaning and transformation tasks. This analysis was carried out using powerful Python libraries such as `Pandas` and `NumPy`, which provided efficient tools for data manipulation, transformation, and numerical computation throughout the process.

**Data Cleaning:**

- Checked the dataset shape to understand the data volume and structure  
- Reviewed data types to confirm they were appropriate for analysis  
- Identified and filled missing values to avoid analysis errors  
- Verified that there were no duplicate records present  
- Removed unwanted spaces from text columns to maintain consistency

**Feature Engineering:**

- Calculated **Gross Profit/Loss Amount** as the difference between total sales and total purchases  
- Created **Gross Profit/Loss Status** with categories: Profit (gross profit > 0), Break Even (= 0), Loss (< 0)  
- Computed **Gross Profit Margin** as gross profit divided by total sales  
- Derived **Net Profit/Loss Amount** by subtracting expenses (excise tax, freight) from gross profit  
- Defined **Net Profit/Loss Status** as Profit (net profit > 0) or Loss (net profit < 0)  
- Calculated **Net Profit Margin** as net profit divided by total sales  
- Created **Sales-to-Purchase Quantity Ratio** to indicate stock movement efficiency  
- Calculated **Sales-to-Purchase Price Ratio** to show pricing efficiency; values greater than 1 indicate profitability  

**Final Step:**

- Exported the final dataset back to **SQL Server** for further **exploratory data analysis** and **dashboard development**

---

## **Phase 3: Exploratory Data Analysis (EDA)**
The third stage focused on exploring clean and engineered data to uncover patterns, detect anomalies, and extract meaningful insights that align with the business objectives. Python's visualization libraries like `Matplotlib` and `Seaborn` along with statistical libraries like `Scipy` were used to analyze distributions, relationships, and key metrics across suppliers and brands.

- Performed **.describe()** on the cleaned dataset to review summary statistics (mean, median, min, max, etc.) of all numerical columns  
- Plotted distribution plots (histograms and box plots) for key numerical features to understand value ranges and identify potential outliers  
- Identified inconsistencies in the data — specifically, some suppliers had zero sales or negative gross profit margins. To maintain analysis quality, filtered the dataset to retain only records where both **total sales** and **gross profit margin** were > 0  
- Used count plots for **supplier name** and **brand name** to identify the most active or dominant suppliers and brands in the filtered dataset  
- Generated a correlation heatmap for numerical variables to uncover key relationships and dependencies among performance metrics (e.g., profit margins, turnover, costs, etc.)
- Refer to the [EDA.pdf](https://github.com/DevanshLath45/Supplier-Performance-Evaluation-End-to-End/blob/main/Supplier_Analysis_EDA.pdf) file for a detailed overview of the exploratory data analysis conducted in this project.

---

## **Phase 4: Finding & Analyzing Business Problem**
The fourth stage focused on analyzing the core business problems after completing all necessary EDA and feature engineering. Various visualizations and hypothesis tests were conducted to address the business objectives. Some of the key findings are:

1) **Identified Brands needing Promotional or Pricing Adjustments**
  - Brands exhibiting lower sales performance but higher profit margins were targeted.  
  - Defined thresholds: Total sales amount below 15% and profit margin above 85% to identify such brands  
  - Visualized using scatterplots to highlight targeted brands  

2) **Found Suppliers and Brands with Highest Sales Performance**  
  - Analyzed the top 10 suppliers and brands based on total sales amount  
  - Visualized with bar plots
 
3) **Identified Suppliers Contributing Most to Total Purchases**  
  - Calculated suppliers with the highest purchase percentage contribution  
  - Included cumulative percentage contribution of the top 10 suppliers  
  - Visualized using a Pareto chart
 
4) **Compared Procurement Values between Top Suppliers and Others**  
  - Compared total procurement value of top 10 suppliers against the rest  
  - Calculated ratio of procurement values  
  - Visualized with a donut chart  

5) **Analyzed Bulk Purchasing Effects on Unit Price and Optimal Purchase Volume**  
  - Classified order sizes as small, medium, and large based on total purchases  
  - Identified average purchase price for each order size  
  - Visualized with boxplots to inspect value ranges and outliers  

6) **Identified Suppliers with Low Inventory Turnover**  
  - Filtered suppliers with turnover < 1, indicating excess stock and slow-moving products  
  - Listed top 10 suppliers with lowest average stock turnover  
  - Visualized using bar plots
 
7) **Determined Suppliers Responsible for Largest Unsold Inventory Value**  
  - Calculated Unsold Inventory Value as:  
    \[
    \text{Unsold Inventory Value} = (\text{Total Quantity Purchased} - \text{Total Quantity Sold}) \times \text{Purchase Price Per Unit}
    \]  
  - Visualized with bar plots  

8) **Calculated 95% Confidence Intervals (CI) for Profit Margins of Top and Low-Performing Suppliers**  
- Established sales thresholds: suppliers with sales above the high threshold are top-performing, below the low threshold are low-performing  
- Filtered Gross Profit Margin (GPM) data accordingly  
- Calculated Confidence Interval as:  
  CI = X̄ ± margin of error  
  Where,  
  margin of error = z × (s / √n)  
  - X̄ = sample mean  
  - z = z-score for 95% confidence (typically 1.96)  
  - s = sample standard deviation  
  - n = sample size  
- Lower and Upper bounds calculated as:  
  Lower bound = X̄ − margin of error  
  Upper bound = X̄ + margin of error  
- Example: Mean = 31.31, CI = (30.89, 31.74)  
- Visualized using histograms with kernel density estimation (KDE)
 
9) **Hypothesis Testing: Difference in Profit Margins Between Top and Low-Performing Suppliers**  
- Null Hypothesis (H₀): No significant difference in mean profit margins between groups  
- Alternative Hypothesis (H₁): Significant difference exists in mean profit margins  
- Conducted two-sample t-test comparing profit margins  
- Results:  
  - t-statistic = -18.06, indicating top-performing suppliers have significantly lower average profit margins than low-performing suppliers  
  - p-value = 0.0000 (< 0.05), so reject the null hypothesis  
- Visualized the distribution difference using a bell curve plot  
    
- Refer to the [Visualization.pdf](https://github.com/DevanshLath45/Supplier-Performance-Evaluation-End-to-End/blob/main/Supplier_Analysis_Visualization.pdf) file for detailed visualizations created in Python while identifying and analyzing business problems.
  
---

## **Phase 5: Dashboarding through Power BI**

The final phase involved creating an insightful and interactive dashboard for stakeholders to quickly interpret supplier effectiveness, pricing strategies, and purchasing efficiency, all through a visually compelling and user-friendly interface.

**Data Integration:**

- Imported the finalized supplier performance summary table from SQL Server into Power BI  
- Performed essential column data type adjustments (e.g., converting IDs to categorical text fields)  
- Filtered the columns like gross profit margin and total sales > 0 for meaningful analysis  

**Advanced DAX-Based Modeling:**

- Created analytical support tables such as Brand Performance, Low Turnover Suppliers, and Purchase Contribution Analysis  
- Used DAX functions like `CALCULATE`, `SUMMARIZE`, `SUM`, `AVERAGE`, along with temporary variables (`VAR`) and conditional logic (`IF`) to derive advanced metrics and classifications  

**Visual Storytelling:**

- Clustered bar and column charts for supplier and brand performance  
- Donut and pie charts for contribution breakdowns  
- Scatter plots to compare target and non-target brands  
- Cards to highlight key KPIs  
- Filters and slicers for user-driven exploration

- Refer to the [Power-BI_Visualization.pdf](https://github.com/DevanshLath45/Supplier-Performance-Evaluation-End-to-End/blob/main/Power-BI%20Visualization.pdf) file for detailed Power BI visualizations developed for stakeholders.

---
---

## **Recommendations for VinSpire**

Key business questions answered:
- `Optimize pricing for low-sales`, high-margin brands to increase sales volume without compromising profitability.  
- `Diversify supplier partnerships` to reduce dependence on a limited number of suppliers, enhancing supply chain resilience and minimizing risks associated with disruptions.  
- `Leverage bulk purchasing` to obtain better pricing discounts, reduce per-unit costs, and optimize inventory levels, thereby improving overall cost efficiency and competitiveness.  
- `Reduce slow-moving stock` by analyzing and adjusting purchase order quantities to better match demand, implementing targeted clearance sales to quickly free up inventory space, and improving storage management practices to optimize warehouse efficiency and minimize holding costs.  
- `Implement just-in-time (JIT) inventory practices` alongside consolidating the supplier base to reduce excess inventory, improve turnover, and free up capital tied in stock.  
- `Collaborate with low-performing suppliers` to enhance their market reach through competitive pricing, targeted marketing initiatives, and improved distribution channels to increase sales volume and drive mutual profitability.  
- `Leverage advanced demand forecasting and inventory analytics` to align procurement with market demand and reduce excess stock.  

---

## **Learning Outcomes**

This project helped me to:

- Gain hands-on experience in building an **end-to-end data pipeline**, from integrating huge raw CSV data into SQL Server and preparing it for analysis to creating interactive dashboards in **Power BI**
- Apply data cleaning and feature engineering techniques using **Python libraries like Pandas and NumPy** to improve data quality and derive meaningful metrics  
- Conduct in-depth exploratory data analysis (EDA) to identify business trends, outliers, and key performance indicators relevant to supplier and brand evaluation  
- Use **advanced SQL and Python** to merge and aggregate large datasets efficiently, supporting complex supplier performance metrics  
- Develop dynamic and interactive dashboards in **Power BI**, utilizing **DAX functions** and visual storytelling to deliver actionable insights for stakeholders  
- Understand real-world business challenges in inventory, procurement, and supplier management through data-driven analysis and visualization  

---

## **Conclusion**

This project demonstrates my ability to address **real-world supply chain and procurement challenges** using a combination of SQL, Python, and Power BI. By analyzing critical aspects such as **supplier performance**, **inventory turnover**, **pricing efficiency**, and **purchase behaviors**, I uncovered actionable insights that support better **inventory management**, **cost optimization**, and **strategic supplier partnerships**.

Handling large datasets and integrating multiple tools enhanced my skills in data preparation, feature engineering, and interactive visualization, reinforcing my capability to translate complex data into impactful business decisions within a competitive distribution environment.

---
