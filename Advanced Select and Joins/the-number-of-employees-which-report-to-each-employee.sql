SELECT e.employee_id, e.name, t.reports_count AS reports_count, t.average_age AS average_age
FROM Employees e JOIN
(
    SELECT reports_to, COUNT(reports_to) AS reports_count, ROUND(AVG(age)) AS average_age
    FROM Employees
    GROUP BY reports_to
) t
ON e.employee_id = t.reports_to
ORDER BY e.employee_id;
