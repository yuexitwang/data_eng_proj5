SELECT mis.movie_id, mis.info
FROM {{ref('menacing_movies')}} as mm, {{source('imdb','movie_info_sample') }} as mis
WHERE (mis.info_type_id = 8 and mis.movie_id = mm.movie_id)