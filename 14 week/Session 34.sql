-- cross join 
select * from campusx.users t1 
cross join 
campusx.groups t2;

-- inner join 
select * from campusx.membership t1 inner join campusx.users t2 on t1.user_id = t2.user_id;

-- left join 
select * from campusx.membership t1 left join campusx.users t2 on t1.user_id = t2.user_id;

-- right join 
select * from campusx.membership t1 right join campusx.users t2 on t1.user_id = t2.user_id;

-- union 
select * from campusx.person1 
union 
select * from campusx.person2;


-- union all 
select * from campusx.person1 
union all 
select * from campusx.person2;

-- intersect 
select * from campusx.person1
intersect 
select * from campusx.person2;

-- except 
select * from campusx.person1
except
select * from campusx.person2;

-- full outer  join 
select * from campusx.membership t1 left join campusx.users t2 on t1.user_id = t2.user_id
union 
select * from campusx.membership t1 right join campusx.users t2 on t1.user_id = t2.user_id;


-- inner join 
select * from campusx.users1 t1 join campusx.users1 t2 on t1.emergency_contact = t2.user_id;

-- selecting more than one columns
select * from campusx.students t1 join campusx.class t2 on t1.class_id = t2.class_id
and t1.enrollment_year = t2.class_year;


