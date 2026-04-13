SELECT DISTINCT P.name AS name
FROM person_order PO
LEFT JOIN person P ON PO.person_id = P.id
LEFT JOIN menu M ON PO.menu_id = M.id
WHERE (address='Moscow' OR address='Samara') AND P.gender='male'
ORDER BY name DESC;