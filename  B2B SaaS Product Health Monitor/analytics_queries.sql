use saas_monitoring;
-- Manually simulate a few "Crashed" accounts for the dashboard
UPDATE account_health 
SET health_score = 12.50 
WHERE company_name IN ('Microsoft', 'Oracle', 'Zendesk');
-- 1. The "Churn Danger" List (High Revenue + Low Health)
-- This query identifies the most critical accounts to save. In an interview, this is your "Actionable Insight."

SELECT 
    company_name, 
    subscription_tier, 
    monthly_fee, 
    health_score
FROM account_health
WHERE health_score < 40 
AND subscription_tier IN ('Enterprise', 'Pro')
ORDER BY monthly_fee DESC;

-- 2. Feature Sticky-ness
-- Which feature is keeping users coming back? If "AI_Resume_Screen" is low, the product might not be "sticky" enough.

SELECT 
    feature_used, 
    COUNT(*) as total_actions,
    COUNT(DISTINCT company_id) as unique_companies_using_it
FROM raw_logs
GROUP BY feature_used
ORDER BY total_actions DESC;

-- 3. Revenue at Risk
-- This calculates exactly how much money is tied to "unhealthy" accounts. This number is what CEOs care about.

SELECT 
    SUM(monthly_fee) AS total_revenue_at_risk
FROM account_health
WHERE health_score < 30;

-- Final Project Polish: Creating a "View"
-- To make your dashboarding easier (in Power BI or Tableau), you can save a complex query as a View. This acts like a virtual table that updates automatically.

CREATE VIEW v_churn_risk_summary AS
SELECT 
    company_name,
    subscription_tier,
    monthly_fee,
    health_score,
    CASE 
        WHEN health_score < 30 THEN 'High Risk'
        WHEN health_score BETWEEN 30 AND 60 THEN 'Medium Risk'
        ELSE 'Healthy'
    END AS risk_category
FROM account_health;