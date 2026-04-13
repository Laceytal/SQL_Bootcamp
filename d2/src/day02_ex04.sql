SELECT
    MENU.pizza_name AS pizza_name,
    PIZZERIA.name AS pizzeria_name,
    MENU.price AS price

FROM pizzeria PIZZERIA
JOIN menu MENU ON MENU.pizzeria_id = PIZZERIA.id
WHERE MENU.pizza_name='mushroom pizza' OR  MENU.pizza_name='pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;