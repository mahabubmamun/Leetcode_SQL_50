SELECT s.user_id, CASE WHEN c.confirm_rate IS NULL THEN 0 ELSE c.confirm_rate END AS confirmation_rate
FROM Signups AS s LEFT JOIN(
SELECT user_id, ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) AS confirm_rate
FROM Confirmations
GROUP BY user_id) c
ON s.user_id = c.user_id;
