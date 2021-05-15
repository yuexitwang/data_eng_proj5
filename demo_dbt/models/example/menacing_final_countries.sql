SELECT DISTINCT * 
FROM {{ref('menacing_primary_countries')}}
UNION
SELECT *
FROM {{ref('menacing_secondary_countries')}}