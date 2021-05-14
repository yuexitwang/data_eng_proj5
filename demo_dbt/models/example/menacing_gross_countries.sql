SELECT mis.movie_id, substring(mis.info, strpos(mis.info,'(')+1, strpos(mis.info,')') - strpos(mis.info,'(')-1) as country
FROM {{ref('menacing_movies')}} as mm, {{source('imdb','movie_info_sample') }} as mis
WHERE info_type_id = 107 and mm.movie_id = mis.movie_id 

