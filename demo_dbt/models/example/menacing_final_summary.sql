SELECT DISTINCT movie_id, title, ratings,
    STRING_AGG(country,', ') OVER (
     PARTITION BY ratings
    )country_list,
    COUNT(country) OVER (
     PARTITION BY ratings
    )country_count
FROM {{ref('menacing_final_countries_rated')}}