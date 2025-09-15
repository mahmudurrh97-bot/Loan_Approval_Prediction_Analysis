-- 1. Find the average loan amount, grouped by education and self-employment status.
SELECT education, self_employed, 
       ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM loan_approval_analysis
GROUP BY education, self_employed
ORDER BY avg_loan_amount DESC;

-- 2. Retrieve the top 5 applicants with the highest loan amounts, including their income and CIBIL score.
SELECT loan_id, income_annum, loan_amount, cibil_score
FROM loan_approval_analysis
ORDER BY loan_amount DESC
LIMIT 5;

-- 3. Show loan approval rate (%) by income_level.
SELECT income_level,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 2) 
       AS approval_rate
FROM loan_approval_analysis
GROUP BY income_level
ORDER BY approval_rate DESC;

-- 4. Using a window function, rank applicants by loan_amount within each cibil_rating.
SELECT loan_id, cibil_rating, loan_amount,
       RANK() OVER (PARTITION BY cibil_rating ORDER BY loan_amount DESC) AS rank_within_rating
FROM loan_approval_analysis;

-- 5. Find applicants whose loan_amount is greater than the average loan amount of their income_level group.
SELECT loan_id, income_level, loan_amount
FROM loan_approval_analysis l
WHERE loan_amount > (
    SELECT AVG(loan_amount) 
    FROM loan_approval_analysis 
    WHERE income_level = l.income_level
);

-- 6. Compare average loan_amount and average income_annum for approved vs rejected loans.
SELECT loan_status,
       ROUND(AVG(loan_amount), 2) AS avg_loan,
       ROUND(AVG(income_annum), 2) AS avg_income
FROM loan_approval_analysis
GROUP BY loan_status;

-- 7. Create a CTE to calculate total asset value (sum of residential, commercial, luxury, and bank assets), 
-- then find the top 10 applicants with the highest asset-to-loan ratio.
WITH asset_cte AS (
    SELECT loan_id, loan_amount,
           (residential_assets_value + commercial_assets_value + luxury_assets_value + bank_asset_value) AS total_assets
    FROM loan_approval_analysis
)
SELECT loan_id, loan_amount, total_assets,
       ROUND(total_assets::NUMERIC / loan_amount, 2) AS asset_to_loan_ratio
FROM asset_cte
ORDER BY asset_to_loan_ratio DESC
LIMIT 10;

-- 8. Find the distribution of loan terms (Short-Term, Intermediate, Long-Term) 
-- across different cibil_rating categories using GROUPING SETS.
SELECT cibil_rating, loan_term_label, COUNT(*) AS total
FROM loan_approval_analysis
GROUP BY GROUPING SETS ((cibil_rating, loan_term_label), (cibil_rating), (loan_term_label));

-- 9. Identify the applicant(s) with the maximum income_annum within each education category.
SELECT loan_id, education, income_annum
FROM loan_approval_analysis
WHERE (education, income_annum) IN (
    SELECT education, MAX(income_annum)
    FROM loan_approval_analysis
    GROUP BY education
);

-- 10. Find correlation insight: 
-- Does a higher CIBIL score generally lead to loan approval? 
-- Show average CIBIL score for approved vs rejected.
SELECT loan_status, ROUND(AVG(cibil_score), 2) AS avg_cibil
FROM loan_approval_analysis
GROUP BY loan_status;
