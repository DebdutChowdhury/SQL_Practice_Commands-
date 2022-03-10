-------------------------------Constraints----------------------

SELECT name, database_id, create_date  
FROM sys.databases;  

create table Department(DeptNo int primary key, DName varchar(40), Location varchar(40)) --parent table

insert Department values (10,'DBA','HYD'),(20,'SAP','MUMBAI'),(30,'HR','PUNE')

create table Employee(Emp_id int, Emp_name varchar(40), Emp_salary Money, 
						DeptNo int foreign key references Department(DeptNo)) --child table


insert Employee values (101, 'Debu', 11000,'10')
insert Employee values (102, 'Akash', 13000,'20')
insert Employee values (101, 'Partha', 15000,'30')

select * FROM Department
select * FROM Employee

