/*
Retreve Method
 1. Selection Method : with where condition
 2. Projection Method : without where condition
 3. Joins : when we retreve the data from multiple tables that time we need this Joins method
	> Ansi-format joins: with 'on' keyword join condition
		@ Inner Join : Retrive the data from multiple tables based on an 'equality' condition
			> Need: Common column and also datatype should same
			> Get Matching Data and Rows
		@ Outer Join
			* Left Outer Join : Maching Data 'both side' & UnMatching data 'left'
			* Right Outer Join : Maching Data 'both side' & UnMatching data 'right'
			* Full Outer Join : All
		@ Cross Join : The Product of rows (M x N Rows)
			> Multiple tables can join without condition
			> No required Common column in the tables
		@ Natural Join : Avoid duplicate columns from joins table
			> SQL not supported 
			> Oracle SQL Supported

	> Non-Ansi format joins: with 'where' keyword join condition
		@ Equi Join : Retrive data from multiple tables based on equality condition ('=')
			> Cannot use operator( <,>,<=,>=,!<,!>,!= )
		@ Non-Equi join : 
			>Retrive data from multiple tables based on equality any condition 
				except equal condition ('=')
			> Can use operator ( <,>,<=,>=,!<,!>,!=, Between, and... )
		@ Self Join : Joinning a tables data by itself
			> Need Alias name here 
			> Need single table for this join
			> When we compare a column values with in the same table
*/

create table Student(
	student_id int,
	student_name varchar(40),
	student_email varchar(40),
	course_id int
)

create table Course (
	course_id int,
	course_name varchar(40),
	course_fees Decimal(6,2)
)

create table companyPlaced(
	course_id int,
	company_name varchar(40),
	company_stack varchar(40)
)

select * from Student
select * from Course

----Inner Join----
select * from Student inner join Course on Student.course_id = Course.course_id 

----Outer Join-----
---------------------
-----Left Outer Join-----
select * from Student s left outer join Course c on s.course_id = c.course_id
----Right Outer Join----
select * from Student s right outer join Course c on s.course_id = c.course_id
----Full Outer Join----
select * from Student s full outer join Course c on s.course_id = c.course_id

----cross Join------
select student_name, student_email from Student cross join Course order by student_id

----Equi Join-----
select * from Student, Course where Student.course_id = Course.course_id

----Non-Equi join-----
select * from Student, Course where Student.course_id > Course.course_id


-----Self Join-----
select * from empwage
/* We have only one name 'Deba' here we want like Deba who get same salary in the emp table */
select e1.emp_id, e1.emp_name, e1.emp_salary from empwage e1, empwage e2 
where e1.emp_salary = e2.emp_salary and e2.emp_name = 'Ram'