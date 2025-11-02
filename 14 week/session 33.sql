-- sorting Data 

-- Find top 5 samsug phones with biggest screen size 
select brand_name, screen_size from smartphones 
where brand_name = 'samsung' order by screen_size desc limit 5; 

-- sort all the phones with in descending order of number of total cameras 
select brand_name,  num_rear_cameras + num_front_cameras as 'camera'  
from smartphones order by camera desc limit 5; 

-- sort data on the basic of ppi in descending order 
select brand_name, round(sqrt(resolution_width* resolution_width + resolution_height*resolution_height)/screen_size) as 'ppi'
from smartphones order by ppi desc;

-- find the phone with second largest battery 
select * from smartphones order by battery_capacity desc limit 1,1; -- limit x,1 = x se start karo aur 1 value dikhao 


-- find the phone with second lowest battery 
select * from smartphones order by battery_capacity asc limit 1,1;

-- find the name and rating of the worst rated apple phone 
select * from smartphones where brand_name = 'apple' order by rating asc limit 1; 

-- sort brand and phone in ascending order 
select * from smartphones order by brand_name asc, price asc;

-- Grouping Data
--  Group smartphones by brans and get the count, average price , max_rating , avg screen size and average battery capacity -> group by animation 
select count(*) as 'number' , brand_name , avg(price), max(rating) , avg(screen_size) , avg(battery_capacity) from smartphones group by brand_name order by number;

-- Group smartphones by weather they have an NFC and get the average price and rating 
select has_nfc, avg(price) as 'price', avg(rating) as 'rating' from smartphones group by has_nfc;

-- Group smartphones by the extended memory card avaviable and get the average price 
select extended_memory_available as 'available', avg(price) as price from smartphones group by extended_memory_available;

-- Group smartphones by brand and processor brand and get the count of models and the average primary camera resolution 
select count(*), brand_name, processor_brand , round(avg(primary_camera_rear)) as camera from smartphones group by brand_name, processor_brand;


-- find top 5 most costly phone brand 
select count(*) ,brand_name, avg(price) as price from smartphones group by brand_name order by price desc limit 5;


-- which brand makes the smallest screen smartphones 
select brand_name , avg(screen_size) screenValue from smartphones group by brand_name order by screenValue asc limit 1;

-- average price of 5g phones vs avg price of non 5g phones 
select has_5g, count(*) as 'total'  , avg(price) from smartphones group by has_5g;

-- Group smartphones by the brand and the final the brand with the highest number of model that have both nfc and IR blaster
select brand_name, count(*) as count from smartphones where has_nfc ='True' and has_ir_blaster = 'True' group by brand_name order by count desc limit 1;

-- Find all samsung 5g enabled smartphones and find out the average price of NFC and nonNfc phones 
select has_nfc, avg(price) as 'avg_price' from smartphones where brand_name = 'samsung' group by has_nfc;


-- Having Clause 
-- find the rating of smartphones brand which have more than 20 phones 
select count(*) as total, brand_name , round(avg(rating)) from smartphones group by brand_name having total > 20 limit 5; 

-- find the top 3 brands with the highes avg ram that have refresh rate of at least 90 Hz and fast charging available and dont consider brand which have less than 10 phones 
select brand_name, avg(ram_capacity) as 'avg_ram' from smartphones where refresh_rate > 90 and fast_charging_available = 1 group by brand_name having count(*) > 20 order by 'avg_ram' desc limit 3

-- 