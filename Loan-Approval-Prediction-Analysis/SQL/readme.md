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

# 📊 SQL Query Summary – Loan Approval Analysis

This project explores loan approval data using SQL queries. Below is a summary of the analyses performed:

1. **Average Loan Amount by Education & Self-Employment**  
   - Groups applicants by education and self-employment.  
   - Calculates and ranks average loan amounts.  

2. **Top 5 Highest Loan Amount Applicants**  
   - Retrieves applicants with the largest loan amounts.  
   - Includes income and CIBIL score for context.  

3. **Loan Approval Rate by Income Level**  
   - Calculates percentage of approved loans per income level.  
   - Highlights approval likelihood by income category.  

4. **Ranking Loan Amounts within CIBIL Rating**  
   - Uses a window function to rank applicants by loan amount.  
   - Rankings are done within each CIBIL rating category.  

5. **Applicants Above Group Average Loan Amount**  
   - Compares individual loan amounts against their income-level average.  
   - Returns those exceeding the group’s average.  

6. **Approved vs Rejected Loans (Loan & Income Comparison)**  
   - Compares average loan amount and income between approvals and rejections.  

7. **Asset-to-Loan Ratio (Top 10 Applicants)**  
   - Creates a CTE to calculate total assets (residential + commercial + luxury + bank).  
   - Finds applicants with the highest asset-to-loan ratio.  

8. **Loan Term Distribution by CIBIL Rating**  
   - Uses `GROUPING SETS` to show loan term categories (Short/Intermediate/Long).  
   - Provides breakdown across CIBIL rating categories.  

9. **Top Earners by Education**  
   - Identifies applicants with the maximum income per education level.  

10. **CIBIL Score vs Loan Approval**  
   - Shows average CIBIL score for approved vs rejected loans.  
   - Provides insight into whether higher CIBIL scores improve approval chances.  

);

