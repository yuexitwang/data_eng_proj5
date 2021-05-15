{{config(materialized='incremental')}}

SELECT *
FROM {{ source('imdb', 'movie_info_sample')}} AS mis

{% if not is_incremental() %}
WHERE mis.info_type_id = (SELECT id FROM {{ source('imdb', 'info_type')}} as it WHERE it.info = 'mpaa') and mis.info LIKE '%menac%'
{% endif %}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  WHERE mis.info_type_id = (SELECT id FROM {{ source('imdb', 'info_type')}} as it WHERE it.info = 'mpaa') and mis.info LIKE '%menac%' and mis.movie_id NOT IN (SELECT movie_id FROM {{this}})

{% endif %}