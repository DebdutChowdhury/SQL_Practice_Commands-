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

/*delete from empwage where emp_id=102*/

/*delete from empwage*/

alter table empwage add emp_address varchar(40) 
alter table empwage add deptno int 

/*alter table empwage drop column emp_address */

update empwage set emp_address= 'USA' where emp_id=1
update empwage set emp_salary= 3000 where emp_id=2
update empwage set emp_salary= 2000 where emp_id=3
update empwage set emp_salary= 10000 where emp_id=4

update empwage set deptno= 10 where emp_id=1
update empwage set deptno= 20 where emp_id=2
update empwage set deptno= 10 where emp_id=3
update empwage set deptno= 20 where emp_id=4

create table company(
	comp_id int primary key,
	comp_name varchar(30),
	emp_id int foreign key references empwage(emp_id)
)

select count(emp_name) from empwage
select * from empwage order by emp_salary /*filter our data here*/
select emp_salary from empwage group by emp_salary
select deptno, sum(emp_salary) as 'Total salary' from empwage group by deptno
select deptno, min(emp_salary) as 'Min salary' from empwage group by deptno
select deptno, round(avg(emp_salary),2) as 'Avg salary' from empwage group by deptno /*round up with dacemal*/
select deptno, count(*) as Total_Emp,sum(emp_salary) as Emp_salary from empwage group by deptno having deptno=20

select * from company
/*drop table company*/

insert into company(comp_id, comp_name, emp_id) values (1, 'BridgeLabz',1)
insert into company(comp_id, comp_name, emp_id) values (2, 'TCS',2)
insert into company(comp_id, comp_name, emp_id) values (3, 'KPMG',3)
insert into company(comp_id, comp_name, emp_id) values (4, 'IBM',4)

