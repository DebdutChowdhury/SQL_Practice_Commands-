------SubQuery-------
use employee_payroll

select * from empwage

/*whose salary is grater than Ganesh using subquery*/
select emp_name, emp_salary from empwage 
where emp_salary > (select emp_salary from empwage where emp_name='Ganesh')

/*whose salary is grater than Ganesh using subquery and dept no is also same eith Ganesh*/
select emp_name, emp_salary, deptno from empwage
where emp_salary > (select emp_salary from empwage where emp_name='Ganesh')
and deptno = (select deptno from empwage where emp_name='Ganesh')

/*Update data using subquery*/
update empwage set emp_address = 'Goa'
where emp_id in (
	select emp_id from empwage where emp_id = 4)

