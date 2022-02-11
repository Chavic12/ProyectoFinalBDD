-- Filtrar el el lenguaje original el overview y el runtime de la pelicula Avatar
SELECT title, original_language, overview, runtime
FROM movie
WHERE title = "Avatar";

-- Filtrar las peliculas en donde la popularidad sea mayor o igual 650.55
SELECT title, popularity
FROM movie
WHERE popularity > 650.55;

-- Filtrar los lenguajes de la pelicula Star wars
SELECT m.title, s.iso_639_1, l.language
FROM movie m, movie_spoken_languages s, spoken_languages l
WHERE m.title = "Star Wars";

-- Filtrar el título y la fecha de las películas con un presupuesto mayor a 225000000 y que su idioma original sea el ingles
SELECT title, release_date
FROM movie
WHERE (budget >= 225000000) and (original_language = "en");