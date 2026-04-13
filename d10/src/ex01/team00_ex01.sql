
WITH RECURSIVE puti AS (
  -- Базовый случай: начинаем из точки 'a'
  SELECT
    point1 AS start,
    point2 AS city,
    ARRAY[point1, point2] AS path,
    cost AS total_cost
  FROM roads
  WHERE point1 = 'a'

  UNION ALL
 -- Рекурсивная часть: добавляем новую точку, если она ещё не в маршруте
  SELECT
    p.start,
    r.point2,
    path || r.point2,
    total_cost + r.cost
  FROM puti AS p
  JOIN roads r ON p.city = r.point1
  WHERE r.point2 <> p.start AND NOT r.point2 = ANY(path)
),
-- Выбираем маршруты, которые прошли через все города (в нашем случае 4: a, b, c, d)
completed AS (
  SELECT
    path || start AS tour,  -- Возвращаемся в начало
    total_cost + r.cost AS total_cost
  FROM puti AS p
  JOIN roads r ON p.city = r.point1 AND r.point2 = p.start
  WHERE array_length(path, 1) = 4
),
extreme_costs AS (
  SELECT
    MIN(total_cost) AS min_total_cost,
    MAX(total_cost) AS max_total_cost
  FROM completed
)
-- Финальный вывод
SELECT DISTINCT total_cost, tour
FROM completed, extreme_costs
WHERE total_cost = min_total_cost

UNION ALL

SELECT DISTINCT total_cost, tour
FROM completed, extreme_costs
WHERE total_cost = max_total_cost
  AND max_total_cost <> min_total_cost  -- исключаем дубли, если min = max
ORDER BY total_cost, tour;

