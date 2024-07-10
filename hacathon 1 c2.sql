USE sakila    ----References to sakila database which is in current use
--Task 1 : List the Actors Available on the database table and observe the last updated date
SELECT actor_id, concat(first_name, last_name) AS 'actor name',last_update FROM actor

--Task 2 :
--2A: IS there any change in the actors first name or last name 
SELECT actor_id, CONCAT(first_name,last_name) AS 'actor name' , last_update From actor

--2B: How many actors have the same first names and last names? list out all the actors.
SELECT first_name, COUNT(first_name) AS 'count of firstname' from actor GROUP by first_name 

SELECT last_name, count(last_name) AS 'count of last name ' from actor GROUP BY last_name

--2C: How many actors have unique names ? what is the count of these actors in the database table?
SELECT count(distinct last_name) FROM actor

--Task 3 create a list of the actor whose names are not repeated and a list of actors whose names are repeated.
Select last_name AS 'Unique names ', count(last_name) AS 'count' from actor group by last_name having count(last_name)=1
Select last_name AS 'repeated names ', count(last_name) AS 'count' from actor group by last_name having count(last_name)>1

--Task 4: Using detailed overview of films based on the actors preference categorize the actors playing identity roles, such as action , Romance,Horror and Mystery.
-Table joined Actor-film_actor-film_category-category
Select fa.actor_id,a.first_name, (c.name)as'movie category'
from actor a join film_actor fa
on a.actor_id=fa.actor_id
join film_category fc
on fa.film_id=fc.film_id
join category c
on fc.category_id=c.category_id
where (c.name) in ('action','Romance','Mystery','horror')

--Task 5
--5a : Which movie category has a majority count, based on which the board can analyze the trend for the categories of the movies.
Select film_id, 'rating category', count(rating)as 'count' from film group by rating

--5B : which movies are suitable for kids
Select title as 'movie name', rating as 'rating category'
from film where rating in ('G','PG')
group by film_id

--5C : which movies are restricted for all under 16 unless accompanied by a parent 
select title as 'movie name', rating as 'rating category'
from film where rating='PG-13'
group by film_id


--5D : which movies are restricted for all audiences under 18.
select title as 'movie name', rating as 'rating category'
from film where rating='NC-17'
group by film_id

--TASK 6a : Figure out the movie titles where the replacement cost is up to $9.
select title as 'movie titles'
from film where replacement_cost in(0,9)

--Task 6B : Get the movie titles where the replacement cost is between $15 and $20.
select title as 'movie titles'
from film where replacement_cost between 15 and 20

--6C : Find the movies with the highest replacement cost and the lowest rental cost.
__highest replacement cost movies
select title as 'movie titles' , replacement_cost as 'highest replacement cost '
from film order by replacement_cost desc limit 5

--lowest rental rate movies
select title as 'movie titles' , rental_rate as 'lowest rental rate cost '
from film order by rental_rate asc limit 5

--task7 : Detrmine The list of each film and the total number of actors listed that film.
--tables  joined film-film_actor
select f.title as 'film names' , count(fa.actor_id)as 'total no of actors'
from film f join film_actor fa
on f.film_id=fa.film_id
group by f.film_id

--Task 8 : Display the titles of the movies starting with the letters 'k' and 'q'
Select title as 'movie names' from film where title like 'K%' or title like 'Q%'

--Task 9 : Display all the actors who appeared in the film 'Agent Truman'
select concat(a.first_name,a.last_name) as 'Actor name' from actor a
join film_actor fa
on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
where title='agent truman'

--Task 10 : Identify all the movies categorized as family films.
--Table joined film-film_category-category
Select F.title as 'family films' from film f
join film_category fc
on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where c.name = 'family'

--Task 11 : Display the most frequently rented movies in descending order to maintain more copies of those movies.
--Tables joined rented-inventory--film
Select title, count(Rental_id) as 'rented times'
from Rental r join inventory i
on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
group by f.title order by count(rental_id) desc


--Task 12 : In how many categories is the average difference between the film replacement cost and the rental rate greater than $15 ?
-- Formula Taken from difference between rental rate and replacement cost =
( avg of replacement cost) -( avg of rental rate)

Select c.name , count(C.name) as 'count' ,(avg(f.replacement_cost)-avg(f.rental_rate))as 'difference'
from category c join film_category fc 
on c.category_id=fc.category_id
join film f on fc.film_id=f.film_id
group by c.name
having difference >15

--Task 13: identify the genres having 60 - 70 films.
List the names of these categories and the number of films per category , sorted by number of films.
--Table joint film_category-category
Select c.name, count(fc.film_id) as 'number of films'
 from film_category fc join category c 
 on c.category_id=FC.category_id 
 group by c.category_id having count(fc.film_id) between 60 and 70