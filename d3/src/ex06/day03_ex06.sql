SELECT
    MN1.pizza_name,
    PZR1.name AS pizzeria_name_1,
    PZR2.name AS pizzeria_name_2,
    MN1.price

FROM menu MN1
    JOIN menu MN2 ON MN1.price=MN2.price
    JOIN pizzeria PZR1 ON MN1.pizzeria_id = PZR1.id
    JOIN pizzeria PZR2 ON MN2.pizzeria_id = PZR2.id
WHERE
    MN1.pizza_name = MN2.pizza_name AND MN1.id > MN2.id AND PZR1.name <> PZR2.name
ORDER BY pizza_name;
