select * from Student
select * from Course

create view v as select student_name, student_email from Student

create view s1
as
select student_name, student_email from Student s inner join Course c 
on s.course_id = c.course_id

select * from s1
select * from v

create table emp_kolkata(emp_id int, emp_name varchar(40), emp_salary money)
create table emp_hyd(emp_id int, emp_name varchar(40), emp_salary money)

select * from emp_kolkata
select * from emp_hyd

create view cv1 as 
select * from emp_kolkata
union 
select * from emp_hyd

insert into cv1 values(107, 'Miller', 45000)
update cv1 set emp_name = 'Godfather' where emp_name = 'Ashwini'

select * from cv1


create function addnum(@num1 int, @num2 int)
returns int
as
begin
declare @result int 
set @result = @num1 + @num2
return @result
end

select dbo.addnum(3, 3)

/*sales based on quantity*/
create function quantityPrice(
	@quantity int,
	@listPrice dec(10,2),
	@discount dec(4,2)
)
returns dec(10,2)
as
begin 
return @quantity * @listPrice * (1 - @discount)
end

select dbo.quantityPrice(10, 100, 0.1) net_sale

select * from Orders

/*calculate the emp salary*/
create table student_marks(rollno int, science int, math int, eng int)
select * from student_marks

create function getTotalMarks(@rollno int)
returns int
as 
begin
declare @result int
select @result = (science + math + eng) from student_marks where rollno = @rollno
return @result
end

select rollno,science,math,eng,dbo.getTotalMarks(rollno) as 'Total_marks' from student_marks