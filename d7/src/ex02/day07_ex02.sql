(
SELECT PZR.name AS name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits PV
LEFT JOIN pizzeria PZR ON PV.pizzeria_id = PZR.id
GROUP BY PZR.name
ORDER BY count DESC, PZR.name
LIMIT 3
)
UNION
(
SELECT PZR.name AS name, COUNT(*) AS count, 'order' AS action_type
FROM person_order PO
JOIN menu ON PO.menu_id = menu.id
JOIN pizzeria PZR ON menu.pizzeria_id = PZR.id
GROUP BY PZR.name
ORDER BY count DESC, PZR.name
LIMIT 3
)
ORDER BY action_type ASC, count DESC;






