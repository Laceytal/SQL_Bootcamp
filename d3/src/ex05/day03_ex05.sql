SELECT PZR.name AS pizzria_name
FROM person_visits PV
FULL JOIN person_order PO ON PV.visit_date = PO.order_date
JOIN pizzeria PZR ON PV.pizzeria_id = PZR.id
JOIN person PER ON PV.person_id = PER.id
WHERE PER.name = 'Andrey' AND PO.order_date is null
ORDER BY pizzria_name;