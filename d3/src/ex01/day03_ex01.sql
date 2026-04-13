SELECT id AS menu_id FROM menu MN
WHERE NOT EXISTS
    (SELECT menu_id FROM person_order WHERE menu_id = MN.id)
ORDER BY menu_id;
