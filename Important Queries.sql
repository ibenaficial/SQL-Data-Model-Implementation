--Returns number of restaurants with specific cuisine type
select count(restaurant_id)
from restaurant.restaurant
where cuisine_type = 'Thai';

--Returns restaurants with certain star rating
select * 
from restaurant.rating
inner join restaurant.restaurant
using (restaurant_id) 
where number_of_stars = '3';

--Returns reservations between selected date range
select count(reservation_id)
from restaurant.reservation
where date between '2020-11-01' and '2020-11-30';

--Returns customers with certain member level
select count(customer_id)
from restaurant.customer 
inner join restaurant.points 
using (points_acquired)
where member_level = 'Bronze';

--Returns restaurants within a certain zip code
select count(restaurant_id)
from restaurant.restaurant
inner join restaurant.zip_code
using (zip)
where zip = '10005';

--Returns reservations with a certain number of guests
select count(reservation_id)
from restaurant.reservation
where number_guests > 2;

--Returns customer with the highest number of points acquired
select customer_id, last_name, first_name, points_acquired
from restaurant.customer
group by customer_id
order by points_acquired desc
limit 1;

