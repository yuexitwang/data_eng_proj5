SELECT mis.id, mis.movie_id, ms.title, mis.info, split_part(info, ' ', 2) as ratings
FROM {{ ref('menacing_ratings') }} as mis, {{ source('imdb', 'movie_sample')}} as ms
WHERE ms.id = mis.movie_id