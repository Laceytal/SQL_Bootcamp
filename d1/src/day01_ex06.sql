SELECT action_date, name
FROM
    person,
    (SELECT order_date AS action_date, person_id FROM person_order
    INTERSECT
    SELECT visit_date AS action_date, person_id
    FROM person_visits) AS dynamic_united_table
WHERE dynamic_united_table.person_id=person.id
ORDER BY action_date, person.name DESC;