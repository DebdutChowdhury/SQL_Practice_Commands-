------------SQL Index-----------------
drop view if exists vwEmployee
create clustered index IX_course_fees on Course(course_fees asc)

select * from Course

select * from emp_hyd

----------Cursor-----------

declare @emp_id int
declare @emp_name varchar(40)

declare EmployeeCursor cursor for
select emp_id, emp_name from emp_hyd
open EmployeeCursor
Fetch next from EmployeeCursor into @emp_id, @emp_name
while (@@FETCH_STATUS=0)
begin 
	print 'Id: ' + cast(@emp_id as nvarchar(30)) + ' Name: ' + @emp_name
	fetch next from EmployeeCursor into @emp_id, @emp_name
end
close EmployeeCursor
----------------------------------
select * from emp_kolkata

declare @empl_id int
declare @empl_name varchar(40)

declare EmployeeCursorKolkata cursor for
select emp_id from emp_kolkata
open EmployeeCursorKolkata
fetch next from EmployeeCursorKolkata into @empl_id
while(@@FETCH_STATUS=0)
begin
	select emp_name from emp_kolkata where emp_id = @empl_id
	if(@empl_name = 'Biswajit')
	begin
		update emp_kolkata set emp_salary = 30000 where emp_id = @empl_id
	end
	else if(@empl_name = 'John')
	begin
		update emp_kolkata set emp_salary = 15000 where emp_id = @empl_id
	end
	print 'Id: ' + cast(@empl_id as nvarchar(30)) + ' Name: ' + @empl_name
	fetch next from EmployeeCursorKolkata into @empl_id
end
close EmployeeCursorKolkata
---------------------------------------------
select emp_name, emp_salary from empwage
join company on empwage.emp_id = company.emp_id
where (emp_name = 'Ram' or emp_name = 'Ganesh')

update empwage
set emp_salary = case	
					when emp_name = 'Ram' then 55000
					when emp_name = 'Ganesh' then 25000
					else
						emp_salary
				end
from empwage
join company on empwage.emp_id = company.emp_id
where(emp_name = 'Ram' or emp_name = 'Ganesh')