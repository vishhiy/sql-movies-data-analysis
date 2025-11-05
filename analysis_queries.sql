--Basic Queries

-- 1️⃣ Top 10 highest-rated movies
SELECT * FROM movies ORDER BY imdb_rating DESC LIMIT 10; 


-- 2️⃣ Most profitable movies (revenue - budget)
SELECT m.title, (f.revenue-f.budget) AS profit , f.currency 
FROM movies m JOIN financials f ON m.movie_id=f.movie_id 
ORDER BY profit DESC LIMIT 10; 

-- 3️⃣ Average IMDb rating by language
SELECT l.name AS languages,ROUND(AVG(imdb_rating),2) AS avg_rating 
FROM languages l JOIN movies m ON 
m.language_id=m.language_id GROUP BY l.name 
ORDER BY avg_rating DESC;

-- 4️⃣ Total movies released by industry
SELECT industry, COUNT(*) AS total_movies
FROM movies
GROUP BY industry
ORDER BY total_movies DESC;

-- 5️⃣ Studios with the highest average ratings
SELECT studio, ROUND(AVG(imdb_rating),2) AS avg_rating, 
COUNT(*) AS total_movies
FROM movies
GROUP BY studio
HAVING COUNT(*) > 1
ORDER BY avg_rating DESC;

-- 6️⃣ Actors appearing in the most movies
SELECT a.name, COUNT(ma.movie_id) AS total_movies
FROM actors a
JOIN movie_actor ma ON a.actor_id = ma.actor_id
GROUP BY a.name
ORDER BY total_movies DESC
LIMIT 10;

-- 7️⃣ Actors born before 1970 who acted in movies released after 2010
SELECT DISTINCT a.name, a.birth_year
FROM actors a
JOIN movie_actor ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
WHERE a.birth_year < 1970 AND m.release_year > 2010
ORDER BY a.name;

-- 8️⃣ Movies earning more than the average revenue
SELECT m.title, f.revenue
FROM financials f
JOIN movies m ON f.movie_id = m.movie_id
WHERE f.revenue > (SELECT AVG(revenue) FROM financials)
ORDER BY f.revenue DESC;

-- 9️⃣ Average budget and revenue by industry
SELECT m.industry,
       ROUND(AVG(f.budget),2) AS avg_budget,
       ROUND(AVG(f.revenue),2) AS avg_revenue
FROM movies m
JOIN financials f ON m.movie_id = f.movie_id
GROUP BY m.industry
ORDER BY avg_revenue DESC;

-- 🔟 Movies with revenue greater than 1 Billion INR
SELECT m.title, f.revenue, f.unit, f.currency
FROM financials f
JOIN movies m ON f.movie_id = m.movie_id
WHERE (f.unit = 'Billions' AND f.revenue >= 1 AND f.currency = 'INR')
ORDER BY f.revenue DESC;

-- 11️⃣ Count of movies released each year
SELECT release_year, COUNT(*) AS total_releases
FROM movies
GROUP BY release_year
ORDER BY release_year DESC;

-- 12️⃣ Movies with IMDb rating greater than 8.5
SELECT title, imdb_rating, industry
FROM movies
WHERE imdb_rating >= 8.5
ORDER BY imdb_rating DESC;

-- 13️⃣ Total number of movies per language
SELECT l.name AS language, COUNT(*) AS movie_count
FROM movies m
JOIN languages l ON m.language_id = l.language_id
GROUP BY l.name
ORDER BY movie_count DESC;

-- 14️⃣ Movies without any studio mentioned
SELECT title, release_year, industry
FROM movies
WHERE studio IS NULL OR studio = '';

-- 15️⃣ Highest-rated movie from each industry
SELECT industry, title, imdb_rating
FROM movies m
WHERE imdb_rating = (
    SELECT MAX(imdb_rating)
    FROM movies
    WHERE industry = m.industry
)
ORDER BY industry;
