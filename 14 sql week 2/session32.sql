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

