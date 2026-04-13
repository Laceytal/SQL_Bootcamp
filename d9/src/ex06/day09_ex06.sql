CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar='Dmitriy',pprice int=500, pdate date='2022-01-08')
RETURNS TABLE (
      pizzeria_name varchar
) AS $$
      (SELECT Z.name FROM person_visits V
          JOIN person P on P.id=V.person_id
          JOIN pizzeria Z on Z.id=V.pizzeria_id
          JOIN menu M on M.pizzeria_id=Z.id
      WHERE P.name = pperson AND V.visit_date = pdate AND M.price < pprice)
$$ LANGUAGE sql;

-- Дмитрий посещал и заказал пиццу за 800 2022-01-08 (имя и дата заданы по-умолчанию)
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

-- Сменили всю палитру переменных
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
