SELECT movies.title
FROM people
JOIN movies ON stars.movie_id = movies.id
JOIN stars ON people.id = stars.person_id

WHERE people.name = "Johnny Depp" AND movies.title IN(
SELECT movies.title FROM people
JOIN movies ON stars.movie_id = movies.id
JOIN stars ON people.id = stars.person_id
WHERE people.name = "Helena Bonham Carter");