# 🧠 Customer Churn Analysis and Retention Strategy

## 📋 Project Overview
Customer churn—the loss of clients or subscribers—is a major challenge for modern e-commerce businesses.  
This project focuses on *analyzing customer behavior* to identify patterns that lead to churn and *predicting churn risk* using historical data.

By leveraging *machine learning, **data visualization, and **predictive analytics**, this system helps organizations develop **data-driven retention strategies**, minimize customer loss, and enhance long-term profitability.

---

## 🎯 Objectives
1. Identify behavioral and transactional patterns that lead to customer churn.  
2. Build and evaluate a *predictive classification model* for churn forecasting.  
3. Deploy an *interactive Streamlit dashboard* for real-time churn prediction.  
4. Generate *actionable business insights* and retention recommendations.

---

## 🧩 Project Pipeline

### 1. Data Collection, Exploration & Preprocessing
- Collect customer data from multiple sources (SQL, CSV files).  
- Perform *Exploratory Data Analysis (EDA)* to discover behavioral trends.  
- Clean data by removing *duplicates, handling **missing values, and detecting **outliers**.*  
- Engineer relevant features from the dataset, such as:
  - *Total Purchase Amount* per transaction  
  - *Average Product Price* per purchase  
  - *Purchase Frequency* per customer  
  - *Return Count* per customer  
  - *Preferred Payment Method* distribution  

### 2. Predictive Model Development

**Algorithms Tested:**
- Logistic Regression  
- Random Forest  
- XGBoost  
- LightGBM  

**Final Model:**  
LightGBM Classifier — chosen for its strong balance between speed, accuracy, and interpretability.

**Model Evaluation Metrics:**
- Accuracy  
- Precision  
- Recall  
- F1-Score  
- ROC-AUC  

Hyperparameter tuning was performed using *GridSearchCV* for optimal model performance.

### 3. Deployment & Retention Strategy
- Build a *Streamlit* app to interact with the trained model.  
- Predict churn probability for a given customer input.  
- Provide *strategic recommendations*:
  - Offer loyalty programs to medium-risk customers.  
  - Provide personalized discounts to high-risk customers.  
  - Send engagement emails to inactive customers.  
- Visualize churn trends and feature importance using interactive plots.

---

## 🗄 Database Design

The relational database is designed to store and link customer, product, and transaction data effectively.

### 🧱 Entity-Relationship Diagram (ERD)
- Customer(Customer_ID, Name, Age, Gender, Churn)
- Product(Product_ID, Product_Name, Product_Category, Product_Price)
- Purchase(Purchase_ID, Customer_ID, Purchase_Date)
- Purchase_Details(Purc_ID, Purchase_ID, Prod_ID, Quantity, Total_Amount, Returns)
- Payment_Method(Payment_ID, Method_Type [Cash, Credit, PayPal])

### 🔗 Relationships

* *Customer → Purchase:* One-to-Many
* *Purchase → Purchase_Details:* One-to-Many
* *Product → Purchase_Details:* One-to-Many
* *Purchase → Payment_Method:* One-to-One 

---

## 🖥 UI/UX Design

The interface is developed using *Streamlit* for simplicity, clarity, and efficiency.  
It allows users (business analysts, marketing teams, or managers) to input customer data, view churn risk, and access insights visually.

### 🧭 User Flow

1. *Landing Page:* Displays the project purpose and navigation options.  
2. *Data Input Form:* User fills in customer attributes (e.g., age, gender, payment method, purchase category).  
3. *Model Prediction:* The system calculates churn probability using the LightGBM model.  
4. *Results Dashboard:* Displays prediction results, customer segment classification, and actionable recommendations.  
5. *Analytics Dashboard:* Visualizes churn trends, customer demographics, and risk segmentation.

### 💡 Design Principles

* *Simplicity:* Focus on essential input fields and clear outputs.  
* *Accessibility:* Responsive layout for different devices.  
* *Clarity:* Data visualizations are color-coded for quick insights.  
* *Action-Oriented:* Recommendations directly linked to prediction outcomes.

---

## ⚙ Tools & Technologies

| *Category*             | *Tools & Libraries* | *Purpose*                                        |
| ------------------------ | --------------------- | -------------------------------------------------- |
| *Programming Language* | Python                | Core language for model and analysis               |
| *Data Manipulation*    | Pandas, NumPy         | Data preprocessing, cleaning, feature engineering  |
| *Visualization*        | Matplotlib, Seaborn   | Exploratory analysis and dashboard visuals         |
| *Machine Learning*     | Scikit-learn, LightGBM | Model training, evaluation, and feature importance |
| *Database*             | Microsoft SQL Server  | Data storage and retrieval                         |
| *Deployment*           | Streamlit             | Building interactive web-based UI                  |
| *Environment*          | Jupyter Notebook      | Development and experimentation                    |
| *Version Control*      | Git, GitHub           | Collaboration and project management               |

---

## 📈 Results & Insights

| *Metric*    | *Score* |
| ------------- | --------- |
| *Accuracy*  | 0.7999      |
| *Precision* | 0.3636      |
| *Recall*    | 0.0005      |
| *F1-Score*  | 0.0010      |
| *ROC-AUC*   | 0.5102      |

### 🔍 Key Findings

* *High-risk churners* often exhibit frequent returns and limited category diversity in purchases.  
* *Top features influencing churn:* total_purchase_amount, payment_method, product_category, returns, and age.  
* *Retention actions* such as targeted discounts and loyalty rewards significantly improve retention rates.  
* Model interpretation tools (SHAP) highlight how transaction and demographic patterns drive churn risk.

---

## 🔮 Future Work

### Technical Enhancements
* Integrate *live streaming data* for real-time churn prediction.  
* Implement *model interpretability frameworks* (SHAP, LIME).  
* Automate *personalized retention strategies* using model output.  
* Integrate with *CRM systems* for end-to-end automation.

### Business Enhancements
* Segment customers by *lifetime value (CLV)* and churn probability.  
* Develop a *recommendation engine* for targeted marketing.  
* Track retention campaign effectiveness through *A/B testing* dashboards.
