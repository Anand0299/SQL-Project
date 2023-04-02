create database scores;
use scores;

-- visualize my table named placement
select * from placements;

-- change the data type of columns student_name, gender, student_placed
alter table placements
modify column student_name varchar(30),
modify column gender varchar(30),
modify column student_placed varchar(30);

-- set student_id as PK
alter table placements
add constraint primary key(student_id);




-- 1) finds the name & mark of students who got placement
select student_name, max_marks from placements where student_placed = "Yes" order by max_marks desc;

-- 2) find the name and marks of students who not placed
select student_name, max_marks from placements where student_placed = "No";

-- 3) find the minimum mark to get a placement
 select min(max_marks) as mark_for_placement from placements where student_placed = "Yes";

-- 4) find the minimum mark got by the student who got placement
select student_name, max_marks from placements where max_marks = (select min(max_marks) from placements 
where student_placed = "Yes");

-- 5) find the number of students who get placed based on age
select age, count(*) as num_of_placements from placements where student_placed = 'Yes' group by age;

-- 6) find the number of students who not get placed based on gender
select gender, count(*) as num_of_placements from placements where student_placed = "No" group by gender;

-- 7) find the details of student who got minimum mark in python and got placement
select * from placements where python = (select min(python) from placements where student_placed = "Yes");

-- 8) find average mark of dbms where students get placed
select avg(dbms) as avg_dbms_mark from placements where student_placed = "Yes";

-- 9) find the details of male student who got highest mark in machine Learning but not get placed
select * from placements where ml = (select max(ml) from placements where student_placed = "No");
 
-- 10) create a new column remarks and pass "congrats" and "try again" with respect of "Yes" or "No" values in column placement
alter table placements
add column remarks varchar(20);

set sql_safe_updates = 0;

update placements
set remarks =
case
	when student_placed = "Yes" then "Congrats"
    else "Try again"
end;

select * from placements;