SELECT
    M.pizza_name AS pizza_name,
    M.price AS price,
    PZR.name AS pizzeria_name,
    PV.visit_date AS visit_date
FROM menu M
LEFT JOIN pizzeria PZR ON M.pizzeria_id = PZR.id
LEFT JOIN person_visits PV ON PZR.id = PV.pizzeria_id
LEFT JOIN person P ON PV.person_id = P.id
WHERE (P.name='Kate') AND (PV.visit_date IS NOT NULL) AND (M.price BETWEEN 800 and 1000)
ORDER BY pizza_name,price, pizza_name;