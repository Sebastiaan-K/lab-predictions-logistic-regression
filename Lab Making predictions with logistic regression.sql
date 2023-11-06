USE sakila;

SHOW TABLES;

#Step 1: Extract Relevant Information for Prediction Model (X)
SELECT 
    f.film_id,
    f.title,
    f.rental_rate,
    f.length,
    f.rating,
    COUNT(r.rental_id) AS rental_count
FROM 
    film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.film_id;
    
    #Step 2: Create a Query for the Target Variable (y)
    SELECT 
    f.film_id,
    MAX(CASE WHEN r.rental_date BETWEEN '2005-05-01' AND '2005-05-31' THEN 1 ELSE 0 END) AS rented_in_may
FROM 
    film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.film_id;
    