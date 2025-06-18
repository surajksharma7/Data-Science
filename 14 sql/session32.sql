Create database if not exists campusx;

use campusx;

create table users(
	user_id integer primary key auto_increment,
    name varchar(255) not null, 
    email varchar(255) not null unique, 
    password varchar(255) not null
);

select * from users;


-- insert into database.table_name (columns) value (value);
insert into users values (NULL,'suraj', 'surajksharma2304@gmail.com', 'suraj');

--  Data manipulation on custom dataset smartphone 

-- select all 
select * from smartphones where 1 ;-- where 1 tells to apply no condition and this is optional 


-- filter columns 
select model, price , rating from smartphones;


-- alias -> renaming columns 
select model as 'phone model', rating as 'model rating' from smartphones;


-- create expression using columns 
select model, rating/10 as 'rating' from smartphones;

-- constants 
select model, 'smartphone' as 'type' from smartphones;

-- distinct(unique) values from a col 
select distinct(brand_name) from smartphones;

-- distinct combos 
select distinct brand_name, processor_brand from smartphones;

-- filter rows where clause

-- find all samsung phones 
select * from smartphones where brand_name = 'samsung';


-- find all phones with price > 50000
select * from smartphones where price > 50000;


-- between 

-- find all the phone in the range 10000 and 20000 
select * from smartphones where price between 10000 and 20000;

-- find phone with rating > 80 and price < 25000 
select * from smartphones where rating > 80 and price < 25000;


-- find samsung phone whose ram is greater than 8gb 
select * from smartphones where brand_name = 'samsung' and ram_capacity > 8 ;


-- find all samsung phone with snapdragon processor 
select * from smartphones where processor_brand = 'snapdragon' and brand_name = 'samsung';

-- find brands who sell phones with price > 50000 
select distinct brand_name from smartphones where price > 50000;

-- in / not in 
select * from smartphones where processor_brand in ('snapdragon', 'bionic');
select * from smartphones where processor_brand not in ('snapdragon', 'bionic');


-- update table -- replace mediatek to dimensity 
update smartphones set processor_brand = 'dimensity' where processor_brand = 'mediatek';

-- delete -> delete all phone above 200000
delete from smartphones where price > 200000;

select * from smartphones where primary_camera_rear > 150 and brand_name = 'samsung';

-- find the maximum price 
select max(price) from smartphones;

-- find minimum price from smartphone 
select min(price) from smartphones;

-- find the price of costiliest samsung phone 
select max(price) from smartphones where brand_name = 'samsung';

-- average of samsung rating phone 
select avg(rating) from smartphones where brand_name = 'samsung';

-- count 
select count(*) as 'number of oneplus' from smartphones where brand_name = 'oneplus';

-- unique counts 
select count(distinct(brand_name)) from smartphones;

-- standard deviation of screen size 

select std(screen_size) from  smartphones;

-- abs , round , ceil, floor,

select abs(price) from smartphones;



