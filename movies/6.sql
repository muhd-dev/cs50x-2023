SELECT avg(rating) FROM ratings
JOIN movies ON ratings.movie_id = movies_id
WHERE year = 2012;