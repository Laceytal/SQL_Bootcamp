SELECT INTERVAL.date AS missing_date
FROM GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') AS INTERVAL
LEFT JOIN
    (SELECT DISTINCT visit_date FROM person_visits
    WHERE person_id=1 OR person_id=2) AS VISIT_12
    ON VISIT_12.visit_date=INTERVAL.date
WHERE VISIT_12.visit_date IS NULL
ORDER BY missing_date;