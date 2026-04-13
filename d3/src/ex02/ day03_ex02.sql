SELECT pizza_name, price, pizzeria.name FROM menu MN
LEFT JOIN pizzeria ON MN.pizzeria_id = pizzeria.id
WHERE NOT EXISTS
    (SELECT menu_id FROM person_order WHERE menu_id = MN.id)
ORDER BY pizza_name,price;
