-- Question 1 List all customers who live in Texas
select address.address_id, first_name, last_name, district
from customer 
inner join address 
on address.address_id = customer.address_id
where district = 'Texas'

--Question 2 Get all Payments above 6.99 with customer's full name 
select customer.customer_id,first_name,last_name,amount
from payment
inner join customer 
on customer.customer_id = payment.customer_id 
where amount > 6.99

--Question 3 Show all customers names who have made payments over 175
select customer_id,first_name,last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175 
	order by sum(amount) desc 
);

--Question 4 List all that live in Nepal
select customer.address_id,customer.first_name,customer.last_name,city
from customer
full join address 
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
where city = 'Nepal';

--Question 5 Which staff member had the most trandactions
select count(payment.staff_id),first_name,last_name
from staff 
inner join payment 
on payment.staff_id = staff.staff_id
group by staff.first_name, staff.last_name
order by count(payment.staff_id) desc

--Question 6 How many movies of each rating are there
select count(rating), rating
from film
group by rating 
order by count desc;

--Question 7 Show all customers who have made a single payment above 6.99
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	where amount > 6.99
)
group by customer_id 
order by customer_id;

--Question 8 How many free rentals did our stores give away
select count(payment.amount),store_id
from payment 
inner join staff 
on payment.staff_id = staff.staff_id
where amount = 0.00
group by staff.store_id








