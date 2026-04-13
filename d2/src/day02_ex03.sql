WITH cte(missing_date) AS
    (SELECT INTERVAL.date AS missing_date
FROM GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') AS INTERVAL)
SELECT cte.missing_date
FROM cte
LEFT JOIN
    (SELECT DISTINCT visit_date FROM person_visits
    WHERE person_id=1 OR person_id=2) AS VISIT_12
    ON VISIT_12.visit_date=cte.missing_date
WHERE VISIT_12.visit_date IS NULL
ORDER BY cte.missing_date;