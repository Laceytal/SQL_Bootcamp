-- Session 1
begin transaction isolation level read committed;
select sum(rating) from pizzeria;
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Session 2
begin transaction isolation level read committed;
INSERT INTO pizzeria(id,name,rating) VALUES (10,'Kazan Pizza', 5);
commit;
select sum(rating) from pizzeria;