SELECT DISTINCT P.name AS name
FROM person_order PO
LEFT JOIN person P ON PO.person_id = P.id
LEFT JOIN menu M ON PO.menu_id = M.id
WHERE P.gender='female' AND (M.pizza_name='pepperoni pizza' OR M.pizza_name='cheese pizza')
GROUP BY P.name
    HAVING SUM(CASE WHEN M.pizza_name ='cheese pizza' THEN 1 ELSE 0 END) > 0
        AND SUM(CASE WHEN M.pizza_name ='pepperoni pizza' THEN 1 ELSE 0 END) > 0
ORDER BY P.name;
