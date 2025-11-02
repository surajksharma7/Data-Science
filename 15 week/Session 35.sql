-- select highest rated movie from the data
select * from subqueries.movies;
select max(score) from movies;
select * from movies where score = 9.3; 


-- algthough this is correct but this is not dynamic
select * from movies where score = (select max(score) from movies);

-- independent SubQuery -> scalar subquery

-- find the movies with highest profit ( vs order by) 
select * from subqueries.movies where (gross - budget) = (select max(gross - budget) from movies);

select * from movies order by (gross - budget) desc limit 1;

-- find how many movies have a rating > the avg of all the movies rating( find the count of above average movies) 

select count(*) from movies where score > (select avg(score) from movies);

-- find the highest rated movie of 2001
select * from movies where year = 2000 and score = (select max(score) from movies where year = 2000);

-- find the highest rated movie among all movies whose number of votes are > the dataset avg votes 
select * from movies where score > (select avg(score) from movies) order by score desc limit 1;



-- independent query -> one column multiple rows 

-- find all users who never ordered
select * from users where user_id not in (select distinct (user_id) from orders);

-- find all the movies made by top 3 directors (in terms of total gross income) 
select * 
from movies 
where director in (
    select director 
    from (
        select director 
        from movies 
        group by director 
        order by sum(gross) desc 
        limit 3
    ) as top_directors
);

--  find all the movies of all those actors whose filmography's average rating > 8.5 take 25000 as cutoff 
select * from movies where star in 
(select star from movies where score > 8.5 and votes > 25000 group by star having avg(score) > 8.5)
and votes > 25000;

-- independent subquery -> table subquery( multi col multi row)

-- find the most profitable movie of each year
select * from movies where (year, (gross-budget)) in (select year, max(gross-budget) from movies group by year);

-- find the highest rated movie of each genre votes cutoff of 25000 

select * from movies where (genre, score) in (select genre, max(score) from movies where votes > 25000 group by genre);

-- find the highest grossing movies of top 5 actor/ director combo in terms or total gross income
select star, director, sum(gross), max(gross) from movies group by star, director order by sum(gross) desc limit 5;




-- correleated subquery
-- find all the movies that have a rating higher than the average rating of movies 
select * from movies  m1 where score > (select avg(score) from movies m2  where m2.genre = m2.genre);


--  usage with select 





