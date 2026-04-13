-- Session 1
begin;
select * from pizzeria where name = 'Pizza Hut';
update pizzeria set rating = 4 where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- Session 2
begin;
select * from pizzeria where name = 'Pizza Hut';
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- По итогу рейтинг изменится на 3,6