-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT; -- Без него изменения в командной строке не применяются

-- Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';