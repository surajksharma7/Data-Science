CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51);

select avg(marks) from marks;

select * , avg(marks) over() as 'avg' from subqueries.marks;

select * , avg(marks) over(partition by branch) as 'avg' from subqueries.marks;

-- find all the studnts who have higher marks than the avg marks of their respective branch
select * from (select *, 
avg(marks) over(partition by branch) as 'branch_avg' 
from marks ) t 
where t.marks < t.branch_avg;

-- rank example 
select *, 
rank() over(partition by branch order by marks  desc)
from marks;

-- dense_rank
select *, 
dense_rank() over(partition by branch order by marks  desc)
from marks;

select *, 
concat(row_number() over(partition by branch)) from marks;

-- find top 2 orders from order 

select * from orders;

SELECT 
    MONTHNAME(date) AS month_name,
    user_id,
    SUM(amount) AS total_amount
FROM orders
GROUP BY 
    MONTH(date), 
    MONTHNAME(date),
    user_id
ORDER BY 
    MONTH(date);


-- Lag
select * , lead(marks) over(order by student_id) from marks;