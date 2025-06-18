create database if not exists campusx;

use campusx;


-- SELECT DISTINCT column1, column2, AGG_FUNC(column3) AS alias
-- FROM table_name
-- WHERE condition1 AND condition2
-- GROUP BY column1, column2
-- HAVING AGG_FUNC(column3) > value
-- ORDER BY column1 ASC, column2 DESC
-- LIMIT number OFFSET number;


-- find top 5 samsung phones with biggest screen size 
select * from smartphone 
where brand_name in ('samsung','Samsung') 
order by screen_size desc
limit 5;

-- sort all the phones with in decending order of number of total cameras 
select model , num_rear_cameras + num_front_cameras as 'total_cam'
from smartphone 
order by total_cam desc;

-- Sort data on the basics of ppi in decending order
select model , sqrt(resolution_width * resolution_width + resolution_height * resolution_height ) as 'ppi'
from smartphone
order by ppi desc;

-- find the phone with second largest battery 
select * from smartphone order by batter_capacity Desc limit 2 offset 1;

-- find the name and rating of the wrost rated apple phone 
select * from smartphone
where brand_name = 'apple'
order by rating asc
limit 1;

-- sort phone alphabetically and then on the basic of rating in desc order 
select * from smartphone 
order by brand_name asc, price asc;

-- sort phone alphabetically and then on the basic of price in asc order 
select * from smartphone 
order by brand_name asc, price desc;

------------------------------------------------------------------------------
-- 
select brand_name as 'brand', count(*)  as 'count'
from smartphone
group by brand_name;

-- Group Smartphones by brand and get the count, average price, max rating avg screen size-> group by animation 
select brand_name, count(*) as 'totalphone',
round(avg(price)) as 'avg price',
max(rating) as 'max rating',
round(avg(screen_size),2) as 'size'
from smartphone 
group by brand_name
order by totalphone desc;

-- Group Smartphones by weather they have nfc and get the average price and rating 
select has_nfc, count(*) as 'nfc',
avg(price) as 'price',
avg(rating) as 'rating'
from smartphone group by has_nfc;

-- group the smartphones by extended memory availabe and get the average price 
select extended_memory_available , 
count(*) as 'memory' from smartphone group by extended_memory_available;

-- group smartphones by the brand and get the counts of models and the average primary camera resolutions 
select brand_name, processor_brand, os , count(*) as 'number',
round();

-- find the top 5 most costly phone barnds 
select brand_name , avg(price) as 'price'
from smartphone group by brand_name order by 'price' desc limit 5;

-- smallest screen size brand 

select brand_name , avg(screen_size) as 'screen'
from smartphone group by brand_name order by 'screen' asc limit 5;


-- group smarphone by the brand and find the brand with highest number of model that have both nfc and IR blaster 
select brand_name, count(*) as 'count'
from smartphone where has_nfc = 'True' and has_ir_blaster = 'True'
group by brand_name order by count desc;


-- find the all samsung 5G enabled smartphone 
select has_nfc , avg(price) as 'averagePrice'
from smartphone 
where brand_name = 'samsung'
group by has_nfc;

-- find the phone name price of the costiliest smartphone 
select * from smartphone order by price desc limit 1 ;


-- having clause

select brand_name , count(*) as 'count', 
avg(price) as 'price' 
from smartphone 
group by brand_name 
having count >30
order by count asc;

select brand_name , count(*) as 'count', 
avg(rating) as 'rating' 
from smartphone 
group by brand_name 
having count >30
order by count asc;


select brand_name, avg(ram_capacity) as 'avg_ram' 
from smartphone
where refresh_rate > 90 and fast_charging_available = 1
group by brand_name 
having count(*) > 10
order by 'avg_ram' desc limit 1;


select brand_name, avg(price) as 'avg'
from smartphone
where has_5g = 'True'
group by brand_name
having avg(rating) > 70 and count(*) > 10;

select batter,sum(batsman_run) as 'runs' from ipl
group by batter
order by runs desc limit 5;

select batter, count(*) as '6' from ipl where batsman_run = 6 
group by batter 
order by 6 desc limit 5; 

select batter, sum(batsman_run), count(batsman_run) from ipl
group by batter
having count(batsman_run) > 1000