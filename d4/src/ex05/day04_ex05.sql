CREATE VIEW v_price_with_discount AS
    SELECT
        per.name AS name,
        mn.pizza_name AS pizza_name,
        mn.price AS price,
        CAST(price - price*0.1 AS INTEGER) AS discount_price
    FROM person_order po
    LEFT JOIN person per ON po.person_id = per.id
    LEFT JOIN menu mn ON po.menu_id = mn.id
    ORDER BY per.name, mn.pizza_name;