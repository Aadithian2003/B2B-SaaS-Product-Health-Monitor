# B2B SaaS Product Health Monitor 🚀

### **Project Objective**

Built an end-to-end data pipeline to transform raw user logs into an actionable **Churn Risk Dashboard**. This tool helps B2B SaaS companies identify "at-risk" accounts before they cancel their subscriptions by calculating a weighted **Engagement Health Score**.

### **🛠 Technical Stack**

* **Language:** Python (Pandas, SQLAlchemy, Urllib)
* **Data Generation:** Synthetic JSON logs mapped to real-world "Base" company data from Kaggle.
* **Database:** MySQL (Relational Schema with analytical Views).
* **Visualization:** Power BI.

### **🏗 Architecture & Logic**

1. **Data Ingestion:** Merged a real-world list of SaaS companies with 5,000 synthetically generated activity logs.
2. **ETL Pipeline:** * Processed raw JSON logs using **Pandas**.
* Calculated a **Health Score (0-100)** using the formula: 

* Handled secure database connections to **MySQL** using **SQLAlchemy** with URL-encoded credentials.


3. **Database Layer:** Created a **SQL View** (`v_churn_risk_summary`) to categorize accounts into *High Risk*, *Medium Risk*, and *Healthy* based on engagement thresholds.

### **📊 Key Business Insights**

* **Revenue at Risk:** Identified high-paying Enterprise accounts (e.g., Microsoft, Oracle) with declining activity.
* **Feature Sticky-ness:** Tracked usage of "AI Resume Screen" vs. standard dashboard views to measure product-market fit.
* **Actionable Churn List:** Generated a real-time list of "High Risk" accounts for the Customer Success team to prioritize.

### **🚀 How to Run**

1. Place `kaggle_companies.csv` in the root folder.
2. Run `script.ipynb` to create raw logs and upload cleaned data to MySQL.
3. Execute the SQL scripts in MySQL Workbench to create the reporting View.
4. Open the Power BI file and refresh the data from the local MySQL source.



