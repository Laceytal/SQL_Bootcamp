SELECT DISTINCT GD.g_date AS missing_dates
FROM v_generated_dates GD
LEFT JOIN person_visits PV ON g_date=PV.visit_date
WHERE visit_date is NULL
ORDER BY missing_dates;