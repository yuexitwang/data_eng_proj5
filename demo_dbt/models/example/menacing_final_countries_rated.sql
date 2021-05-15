SELECT mfc.movie_id, mfc.info as country, title, ratings 
FROM {{ref('menacing_final_countries')}} as mfc
RIGHT JOIN {{ref('menacing_movies')}} as mm
ON mm.movie_id=mfc.movie_id