{{config(materialized='table')}}

WITH
cte AS(
SELECT DISTINCT mm.movie_id, REGEXP_REPLACE(mis2.info,'[^a-zA-Z_\-,;]','','g') as country
FROM {{ref('menacing_movies')}} as mm, {{source('imdb','movie_info_sample') }} as mis, {{source('imdb','movie_info_sample') }} as mis2
WHERE mis2.info_type_id = 1 and mis2.movie_id = mm.movie_id
)
SELECT * FROM cte
WHERE country != ''
ORDER BY movie_id