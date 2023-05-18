USE sakila;
#question1. In the table actor, which are the actors whose last names are not repeated? 
#For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
#These three actors have the same last name. So we do not want to include this last name in our output. 
#Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
Select last_name from actor
group by last_name
having  count(last_name) =1;

#Question2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
Select last_name from actor
group by last_name
having  count(last_name) >1;

#Question3. Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(rental_id) as rentals_processed
from rental
group by staff_id;

#Question4. Using the film table, find out how many films were released each year.
select release_year, count(release_year) as released
from film
group by release_year;

#Question5. Using the film table, find out for each rating how many films were there.
select rating, count(film_id) as amount_of_films
from film
group by rating;

#Question6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length),2) as average_length
from film
group by rating;

#Question7. Which kind of movies (rating) have a mean duration of more than two hours?
select rating, AVG(length)
from film
group by rating
having AVG(length) > 120;

#Question8. Order films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title, length, rating
from film
where (length IS NOT NULL) AND (length<>0)
order by length;

