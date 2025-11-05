# 🎬 SQL Movies Data Analysis Project

## 📋 Overview
This project explores a **Movies Database (moviesdb)** using **SQL** to uncover meaningful insights about films, actors, revenues, and ratings.  
The dataset includes both **Hollywood and Bollywood** movies, with details like budgets, revenues, IMDB ratings, studios, and languages.  

The goal is to perform **data analysis using SQL** — applying real-world analytical queries involving joins, aggregations, subqueries, and grouping to extract insights.

---

## 🧠 Skills Used
- SQL Queries and Joins  
- Aggregate Functions (`SUM`, `AVG`, `COUNT`, etc.)  
- Subqueries & CTEs  
- Data Cleaning & Analysis  
- Database Relationships (1:N, M:N)  
- Analytical Thinking  

---

## 🗂 Database Structure

| Table | Description |
|-------|--------------|
| **movies** | Contains movie titles, release year, rating, studio, and language |
| **actors** | Stores actor details such as name and birth year |
| **movie_actor** | Relationship table connecting movies and actors |
| **financials** | Includes movie budgets, revenues, currencies, and units |
| **languages** | Contains the list of available languages |

---

## 💡 Sample Analysis Queries

### 🎥 1. Top 10 Highest Rated Movies
```sql
SELECT title, imdb_rating
FROM movies
ORDER BY imdb_rating DESC
LIMIT 10;
```
### 2️. Most profitable movies
```sql
SELECT m.title, (f.revenue - f.budget) AS profit
FROM movies m
JOIN financials f ON m.movie_id = f.movie_id
ORDER BY profit DESC
LIMIT 10;
```
