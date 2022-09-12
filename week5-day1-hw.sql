--1. How many actors are there with the last name ‘Wahlberg’?

SELECT *
FROM actor
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?

SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)

SELECT film_id, count(film_id) AS count_film
FROM inventory
GROUP BY film_id
ORDER BY count_film DESC
LIMIT 72;



--4. How many customers have the last name ‘William’?

SELECT count(last_name)
FROM customer
WHERE last_name = 'Williams';


--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, count(staff_id)
FROM rental
GROUP BY staff_id
LIMIT 1;

--6. How many different district names are there?

SELECT count(DISTINCT district)
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, count(actor_id) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC
LIMIT 1;


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT store_id, count(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP by store_id
LIMIT 1;


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

SELECT COUNT(amount) 
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
HAVING COUNT(rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

SELECT rating,  count(rating), COUNT(DISTINCT rating) AS each_rating_amount
FROM film
GROUP BY rating
ORDER BY count(rating);
