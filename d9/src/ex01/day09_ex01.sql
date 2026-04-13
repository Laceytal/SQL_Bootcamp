
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $person_audit$
BEGIN
  INSERT INTO person_audit(type_event,row_id,name,age,gender,address)
  VALUES('U',old.id, old.name, old.age, old.gender, old.address);
  RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;
-- Создаем триггер на срабатывание функции выше при каждом апдейте таблицы персон
CREATE OR REPLACE TRIGGER trg_person_update_audit AFTER UPDATE ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

-- Проверка:
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
SELECT * FROM person_audit;
