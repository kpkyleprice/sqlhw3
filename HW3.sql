--1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, customer.email, address.district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full name
select customer.first_name, customer.last_name, customer.customer_id, payment.amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99

--3. Show all customers names who have made payments over $175(use subqueries)
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
)

--4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, address.city_id, city.city, country.country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Nepal'

--5. Which staff member had the most transactions?
select staff_id, count(distinct rental_id)
from payment
group by staff_id
--6. How many movies of each rating are there?
select rating, count(rating)
from film
GROUP BY rating;
--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name, customer_id,
from customer
where customer_id in (
	select amount
	from payment
	where amount = 6.99
)
--8. How many free rentals did our store give away?
select count(amount)
from payment
where amount = 0;

select * from payment
select * from rental
select * from address
select * from film


