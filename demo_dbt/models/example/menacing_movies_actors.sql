SELECT movie_id,name from {{ source('imdb', 'cast_sample')}} as c
RIGHT JOIN {{ source('imdb', 'actor_sample')}} as a
ON c.person_id=a.id
WHERE movie_id IN (SELECT movie_id FROM {{ref('menacing_movies')}})
ORDER BY movie_id