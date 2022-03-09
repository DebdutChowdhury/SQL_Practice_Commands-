create database employee_payroll

use employee_payroll

select * from sys.databases

create table empwage
(
	emp_id int identity(1,1) primary key,
	emp_name varchar(40) not null,
	emp_salary int not null,
	start_date datetime
)

select * from empwage

insert into empwage(emp_name,emp_salary,start_date)values('Debdut',50000,GETDATE()) 
insert into empwage(emp_name,emp_salary,start_date)values('Ram',5000,GETDATE()) 
insert into empwage(emp_name,emp_salary,start_date)values('Ganesh',50000,GETDATE()) 
insert into empwage(emp_name,emp_salary,start_date)values('MR.Funny',50000,GETDATE()) 

delete from empwage where emp_id=102

delete from empwage

update empwage set emp_name = 'Kajal' where emp_id=2

alter table empwage add emp_address varchar(40)


