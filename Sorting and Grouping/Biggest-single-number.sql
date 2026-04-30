SELECT MAX(m.num) AS num
FROM MyNumbers m JOIN
(SELECT num,COUNT(num) AS cnt
FROM MyNumbers
GROUP BY num) n
ON m.num = n.num
WHERE n.cnt = 1;
