(SELECT PZ.name AS pizzeria_name
    FROM menu MN
        JOIN pizzeria PZ ON MN.pizzeria_id = PZ.id
        JOIN person_order PO ON MN.id = PO.menu_id
        JOIN person PRS ON PRS.id = PO.person_id
    WHERE PRS.gender = 'female'
    EXCEPT
    SELECT PZ.name AS pizzeria_name
    FROM menu MN
        JOIN pizzeria PZ ON MN.pizzeria_id = PZ.id
        JOIN person_order PO ON MN.id = PO.menu_id
        JOIN person PRS ON PRS.id = PO.person_id
    WHERE PRS.gender = 'male'
)
UNION
(SELECT PZ.name AS pizzeria_name
    FROM menu MN
        JOIN pizzeria PZ ON MN.pizzeria_id = PZ.id
        JOIN person_order PO ON MN.id = PO.menu_id
        JOIN person PRS ON PRS.id = PO.person_id
    WHERE PRS.gender = 'male'
    EXCEPT
    SELECT PZ.name AS pizzeria_name
    FROM menu MN
        JOIN pizzeria PZ ON MN.pizzeria_id = PZ.id
        JOIN person_order PO ON MN.id = PO.menu_id
        JOIN person PRS ON PRS.id = PO.person_id
    WHERE PRS.gender = 'female'
)
ORDER BY pizzeria_name;
