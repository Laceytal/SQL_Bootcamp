SELECT
    PRS.name,
    MNU.pizza_name,
    MNU.price,
    (MNU.price - MNU.price*DSC.discount_percent/100)::REAL AS discount_price,
    PZR.name AS pizzeria_name
FROM person_order PO
  JOIN person PRS ON PRS.id = PO.person_id
  JOIN menu MNU ON MNU.id = PO.menu_id
  JOIN pizzeria PZR ON MNU.pizzeria_id = PZR.id
  JOIN person_discounts DSC ON PO.person_id = DSC.person_id AND MNU.pizzeria_id = DSC.pizzeria_id
ORDER BY PRS.name, MNU.pizza_name;