SELECT *
FROM {{ source('imdb', 'movie_info_sample')}} as mis
WHERE mis.info_type_id = (SELECT id FROM {{ source('imdb', 'info_type')}} as it WHERE it.info = 'mpaa') and mis.info LIKE '%menace%'