# Write your MySQL query statement below
-- SELECT x, y, z,CASE WHEN ((x+y+z)-GREATEST(x,y,z)) > GREATEST(x,y,z) THEN 'Yes' ELSE 'No' END AS triangle
-- FROM Triangle

# Better runtime approach
SELECT x, y, z,
       CASE 
           WHEN (x + y + z - g) > g THEN 'Yes'
           ELSE 'No'
       END AS triangle
FROM (
    SELECT x, y, z, GREATEST(x, y, z) AS g
    FROM Triangle
) t;

-- gives better runtime, because GREATEST() function is used only once for each
-- row
