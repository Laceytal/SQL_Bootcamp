INSERT INTO person_discounts (id, person_id, pizzeria_id, discount_percent)
  SELECT
      ROW_NUMBER( ) OVER ( ) AS id,
      ORDR.person_id,
      MNU.pizzeria_id,
      (
          CASE
              WHEN COUNT(ORDR.person_id) = 1 THEN 10.50
              WHEN COUNT(ORDR.person_id) = 2 THEN 22.00
              ELSE 30.00
          END
      ) AS discount_percent
  FROM person_order ORDR
      JOIN menu MNU ON ORDR.menu_id = MNU.id
  GROUP BY ORDR.person_id, MNU.pizzeria_id
  ORDER BY ORDR.person_id;

