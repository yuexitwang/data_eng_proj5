SELECT DISTINCT * 
FROM {{ref('menacing_gross_countries')}}
UNION
SELECT *
FROM{{ref('menacing_runtimes')}} 
