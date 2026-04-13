CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop int DEFAULT 10)
RETURNS TABLE(num int) AS $$
  WITH RECURSIVE cte_fibo(n1, n2) AS (
      VALUES (0, 1)
      UNION ALL
      SELECT n2,
          n1 + n2
      FROM cte_fibo
      WHERE n2 < pstop)
  SELECT n1  FROM cte_fibo;
$$ LANGUAGE SQL;

-- Макс значение 1000000000
select *
from fnc_fibonacci(20);

-- По умолчанию не больше 10 (задано дефолтом в функции)
select *
from fnc_fibonacci();
