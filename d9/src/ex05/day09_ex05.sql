CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar='female')
RETURNS TABLE (
      id bigint,
      name varchar,
      age integer,
      gender varchar,
      address varchar
) AS $$
      (SELECT * FROM person P WHERE P.gender = pgender);
$$ LANGUAGE sql;

-- Явно задаем переменную pgender
SELECT *
FROM fnc_persons(pgender:='male');
--  По умолчанию female
SELECT *
FROM fnc_persons();
