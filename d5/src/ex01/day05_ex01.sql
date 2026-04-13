-- Может использовать последовательное сканирование без использования индексов.
-- Потенциально увеличивает время обработки запроса
SET enable_seqscan TO ON;

EXPLAIN ANALYZE
  SELECT MNU.pizza_name, PZR.name FROM menu MNU
  JOIN pizzeria PZR on MNU.pizzeria_id= PZR.id;

-- Использование индексов.
-- Потенциально уменьшает время обработки запроса
SET enable_seqscan TO OFF;

EXPLAIN ANALYZE
  SELECT MNU.pizza_name, PZR.name FROM menu MNU
  JOIN pizzeria PZR on MNU.pizzeria_id= PZR.id;
