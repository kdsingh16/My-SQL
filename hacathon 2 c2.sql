USE sakila    ----References to sakila database which is in current use
show tables

Task 1 : maximize the profit what movie to promote
Select * from film 
Select c.name,count(r.rental_id) as 'times rented ' from category c 
join film_category fc
On c.category_id=fc.category_id join inventory i
On fc.film_id = i.film_id join rental r
on i.inventory_id = r.inventory_id group by c.name order by (count( r.rental_id)) desc

Task 2 : The board wishes to know the movie actor who has highest replacement cost
Select concat(a.first_name ,a.last_name) as 'actor name' ,f.replacement_cost
From actor a join film_actor fa on a.actor_id=fa.actor_id
Join film f on f.film_id=fa.film_id group by (concat(a.first_name,a.last_name))
Order by (replacement_cost) desc limit 3

Task 3 : Find revenue in dollars for each movie type.
select c.name as 'category name' ,sum(p.amount) as 'total amount'
from payment p join rental r 
using (rental_id) 
join inventory i 
using (inventory_id) 
join film_category fc 
using (film_id) 
join category c
using (category_id)
group by c.name;


--task 4 :  What is the exisiting no. of copies of 'BROTHERHOOD BLANKET' and 'SOUP WISDOM 'movies. 
select f.title as 'film count', count(i.film_id) as 'film copies count' 
from inventory i join film f 
using (film_id) 
group by i.film_id 
having f.title in ('BROTHERHOOD BLANKET','SOUP WISDOM');

Task 5 : List top 10 genres and their gross revenues ir ascending order. Present it visually.
Select * from (select c.name as 'genre',sum(P.amount) as 'total revenue'
from payment p join rental r on p.rental_id = r.rental_id join inventory i
on i.inventory_id =r.inventory_id
Join film_category fc 
on fc.film_id=i.film_id join category c
on c.category_id=fc.category_id
group by (c.name)
order by 'total revenue' desc limit 10)g order by  'total revenue' asc



-- task 6 identify top 5 movies country wise
-- by revenue
select co.country,f.title,sum(p.amount)as 'revenue'from payment p
join rental r on p.rental_id=r.rental_id
join inventory i on r.inventory_id=i.inventory_id 
join film f on i.film_id=f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
join customer cs on r.customer_id=cs.customer_id
join address ad on cs.address_id=ad.address_id
join city ct on ad.city_id = ct.city_id
join country co on ct.country_id=co.country_id
group by f.title,co.country order by (revenue) desc limit 5


task 7 : visaually represent the movies which are famous in usa , india and uae.
select f.title as 'film name ',co.country as 'country name', count(r.inventory_id)
as 'inventory_count'
from inventory i join film f using (film_id)
join rental r using (inventory_id)
join customer c using (customer_id)
join address a using (address_id)
join city ci using (city_id)
join country co using (country_id)
where co.country in ('Brazil' ,'india','bolivia')
group by f.title
having count(r.inventory_id)>5
order by co.country,inventory_count desc;