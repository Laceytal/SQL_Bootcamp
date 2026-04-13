CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
  SELECT PZR.name AS pizzeria_name
  FROM pizzeria PZR
      JOIN person_visits PVS ON PZR.id = PVS.pizzeria_id
      JOIN person PRS ON PVS.person_id = PRS.id
      JOIN menu MN ON PZR.id = MN.pizzeria_id
  WHERE PVS.visit_date = '2022-01-08' AND PRS.name LIKE 'Dmitriy' AND MN.price < 800
  ORDER BY PZR.name;
