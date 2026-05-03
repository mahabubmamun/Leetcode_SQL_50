SELECT t2.person_name
FROM (
    SELECT t.person_id, t.person_name, t.weight, t.turn, 
    SUM(t.weight) OVER (ORDER BY turn AS cumulative_weight
    FROM (
        SELECT person_id, person_name, weight, turn
        FROM Queue
        ORDER BY turn) t
    ORDER BY t.turn) t2
WHERE t2.cumulative_weight <= 1000
ORDER BY t2.turn DESC
LIMIT 1;
