select * from smartphones;

-- sorting data 

-- find the 5 samsung phoes with biggest screen size 
select * from smartphones 
where brand_name = 'samsung'
order by brand_name desc limit 5;

select * from smartphones;