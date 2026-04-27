# Write your MySQL query statement below
# approach 1 : using sub query
SELECT T.manager AS name
FROM(
SELECT e1.id AS managerID, e1.name AS manager, e2.id AS empID, e2.name AS employee
FROM Employee e1 JOIN Employee e2
ON e1.id = e2.managerId) AS T
GROUP BY T.managerID, T.manager
HAVING COUNT(T.managerID) >= 5;


# approach 2 : not using sub query
SELECT e1.name AS name
FROM Employee e1 JOIN Employee e2
ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(e1.id) >= 5
