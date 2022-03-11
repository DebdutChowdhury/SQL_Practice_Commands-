select * from empwage
-----------Cast convert and like example here--------------
select emp_name + '-' + cast(start_date as varchar) as 'Emplyee_Name_&_Time' from empwage 
where emp_name like '%al' order by emp_name

insert into empwage(emp_name,emp_salary,start_date, emp_address, deptno) 
values ('Umair ' + cast(25 as varchar), GETDATE(),'Bihar',10)

select CONVERT(varchar , emp_salary) as new_salary from empwage

select * from empwage where emp_name like '%ut' order by emp_name

