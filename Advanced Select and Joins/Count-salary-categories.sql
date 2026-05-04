# Write your MySQL query statement below
SELECT t1.category, COUNT(t2.account_id) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary'
    UNION 
    SELECT 'High Salary'
) t1
LEFT JOIN
(SELECT account_id, income, 
CASE 
    WHEN income < 20000 THEN 'Low Salary' 
    WHEN (income >= 20000 AND income <=50000) THEN 'Average Salary' 
    ELSE 'High Salary' 
END AS sal_category 
FROM Accounts) t2
ON t1.category = t2.sal_category
GROUP BY t1.category;



#Alternative approach
-- SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
-- FROM Accounts
-- WHERE income < 20000
-- UNION ALL
-- SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
-- FROM Accounts
-- WHERE income >= 20000 AND income <= 50000
-- UNION ALL
-- SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
-- FROM Accounts
-- WHERE income > 50000
