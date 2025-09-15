# 📊 Loan Approval Analysis - PostgreSQL Summary  

This project analyzes loan approval data using advanced **PostgreSQL queries** on the table **`loan_approval_analysis`**.  
The dataset contains customer demographics, income, loan details, CIBIL scores, asset values, and engineered features like income levels, loan ratings, and loan term categories.  

---

## 🗄️ Database Setup  

```sql
-- Create the database (if not already created)
CREATE DATABASE loan_approval_db;

-- Connect to the database
\c loan_approval_db;

-- Create the loan_approval_analysis table
CREATE TABLE loan_approval_analysis (
    loan_id SERIAL PRIMARY KEY,
    no_of_dependents INT,
    education VARCHAR(50),
    self_employed VARCHAR(10),
    income_annum BIGINT,
    loan_amount BIGINT,
    loan_term INT,
    cibil_score INT,
    residential_assets_value BIGINT,
    commercial_assets_value BIGINT,
    luxury_assets_value BIGINT,
    bank_asset_value BIGINT,
    loan_status VARCHAR(20),
    cibil_rating VARCHAR(20),
    income_level VARCHAR(50),
    loan_amount_ratings VARCHAR(50),
    loan_term_label VARCHAR(50),
    dependent_levels VARCHAR(50)
);

