create database laptop;

use laptop;

select name from subqueries.movies where name like '_____';

select name from subqueries.movies where name like '%man%';

select name, upper(name), lower(name) from subqueries.movies;

select concat(name, ' ' , director) from subqueries.movies;

select name, substr(name, 5,5) from subqueries.movies;

text = "hello world"
new_text = text.replace("world", "hello world")
print(new_text)

select 5+6;