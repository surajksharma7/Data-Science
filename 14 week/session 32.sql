create database if not exists campusx;


use campusx;

-- changing table name to smartphones
alter table smartphones_cleaned_v6 rename to smartphones;


-- select all columns from the smartphones
select * from smartphones;

-- filter columns 
select brand_name, model, price, rating from smartphones;

-- using alisa name 
select brand_name as brand from smartphones;

-- create expression usig cols 
select model , (SQRT(resolution_width*resolution_width + resolution_height* resolution_height)/screen_size) as ppi from  smartphones;

-- constants 
-- Distinct (unique) values from cols 
select distinct(brand_name) as 'all_brand' 
from smartphones;


select distinct(processor_brand) as 'processor' 
from smartphones;

select distinct brand_name, processor_brand
from smartphones;

-- Filter rows where clause ->  find all the samsung phones 
select * from smartphones 
where brand_name = 'samsung';


-- find all the smartphone with price > 50000
select * from smartphones where price > 50000;


--  between 
-- find all the phones in the price in the range of 15000 and 20000 
select * from smartphones where price  between 10000 and 20000;


-- find  phones with rating > 80 and price < 25000
select * from smartphones where rating > 80 and price < 25000;

-- find all samsung phones with ram 8gb 
select * from smartphones where brand_name = 'samsung' and ram_capacity > 8;

-- find all samsung phones with snapdragon processor 
select * from smartphones where processor_brand = 'snapdragon' and brand_name = 'samsung';


-- query exection order 
-- find brands who sell phones with price > 50000
select distinct(brand_name) from smartphones where price > 50000; 


-- in and not in 
select * from smartphones where processor_brand in ('exynos', 'bionic');


-- update table 
 
select * from smartphones where processor_brand='mediatek';
update smartphones set processor_brand = 'dimensity' where processor_brand = 'mediatek';

-- Delete -> delete all phones whose price greater than 2lakh
select * from smartphones where price > 200000;

delete from campus where price > 200000; 


-- delete phones whose primary camera greater than 100px
delete from smartphones where primary_camera_rear > 150 and brand_name = 'samsung';


-- types of functions in sql 
-- agg function -> max, min, 
select max(price)  from smartphones;

select min(price) from smartphones; 


-- find the price of costilliest samsung phones
select max(price) from smartphones where brand_name = 'samsung';

select avg(price) from smartphones where brand_name = 'samsung';


-- scalar function -> abs, round, ceil, floor

