SELECT
    M.pizza_name AS pizza_name,
    PIZ.name AS pizzeria_name
FROM person_order PO
JOIN menu M ON M.id=PO.menu_id
JOIN person P ON PO.person_id = P.id
JOIN pizzeria PIZ ON M.pizzeria_id = PIZ.id
WHERE P.name = 'Denis' OR P.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;