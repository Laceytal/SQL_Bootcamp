-- ===============================================
-- Построение маршрутов по задаче Коммивояжёра
-- (Traveling Salesman Problem)
--
-- Реализация: рекурсивный обход с массивами путей
-- Пояснение: маршруты строятся из точки 'a' и расширяются
-- до полной длины без повторов, с возвратом в 'a'
--
-- Автор: @phyllisw
-- Дата: 2025-06-23
-- ===============================================


CREATE TABLE roads (
    point1 TEXT NOT NULL,
    point2 TEXT NOT NULL,
    cost INT NOT NULL
);
INSERT INTO roads (point1, point2, cost)
VALUES
  ('a', 'b', 10), ('b', 'a', 10),
  ('a', 'c', 15), ('c', 'a', 15),
  ('a', 'd', 20), ('d', 'a', 20),
  ('b', 'c', 35), ('c', 'b', 35),
  ('b', 'd', 25), ('d', 'b', 25),
  ('c', 'd', 30), ('d', 'c', 30);



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
min_cost AS (
  SELECT MIN(total_cost) AS min_total_cost FROM completed
)

-- Финальный вывод
SELECT DISTINCT total_cost, tour
FROM completed, min_cost
WHERE total_cost = min_total_cost
ORDER BY total_cost, tour;

