-- Session 1
begin transaction isolation level REPEATABLE READ;
select sum(rating) from pizzeria;
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Session 2
begin transaction isolation level REPEATABLE READ;
INSERT INTO pizzeria(id,name,rating) VALUES (11,'Kazan Pizza 2', 4);
commit;
select sum(rating) from pizzeria;