select  * from laptop where Company = 'Apple';

create view apple as select * from laptop where Company = 'Apple';

select * from apple;

show tables;

select order_id, amount, r_name, name, date, delivery_time, delivery_rating, restaurant_rating
from orders t1 join users t2 on t1.user_id = t2.user_id
join restaurants t3 on t1.r_id = t3.r_id;

create view joined as 
select order_id, amount, r_name, name, date, delivery_time, delivery_rating, restaurant_rating
from orders t1 join users t2 on t1.user_id = t2.user_id
join restaurants t3 on t1.r_id = t3.r_id; 

select * from joined;

select r_name, sum(amount) , month(date) from joined group by r_name,month(date);

-- alter view 




call hello_world(); 

call add_user('ankit', 'ankit@gmail.com')