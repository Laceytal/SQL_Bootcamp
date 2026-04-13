WITH last_currency AS (
  SELECT DISTINCT ON (id)
    id,
    name,
    rate_to_usd
  FROM currency
  ORDER BY id, updated DESC
)
SELECT
  COALESCE(u.name, 'not defined') AS name,
  COALESCE(u.lastname, 'not defined') AS lastname,
  b.type,
  SUM(b.money) AS volume,
  COALESCE(lc.name, 'not defined') AS currency_name,
  COALESCE(lc.rate_to_usd, 1) AS last_rate_to_usd,
  SUM(b.money) * COALESCE(lc.rate_to_usd, 1) AS total_volume_in_usd
FROM balance b
LEFT JOIN "user" u ON b.user_id = u.id
LEFT JOIN last_currency lc ON b.currency_id = lc.id
GROUP BY 
  COALESCE(u.name, 'not defined'),
  COALESCE(u.lastname, 'not defined'),
  b.type,
  COALESCE(lc.name, 'not defined'),
  COALESCE(lc.rate_to_usd, 1)
ORDER BY 1 DESC, 2, 3;
