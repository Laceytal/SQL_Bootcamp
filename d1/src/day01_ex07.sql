SELECT person_order.order_date AS order_date,
	CONCAT( person.name,' (age:',person.age,')') AS person_information
FROM person
	JOIN person_order ON person_order.person_id=person.id
ORDER BY person_order.order_date, person.name;
