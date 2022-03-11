/*update emp name and salary*/
create procedure updateEmp(@name varchar(40), @salary money)
as 
begin try
update empwage set emp_salary=@salary where emp_name=@name
end try
begin catch
select 
	ERROR_NUMBER() as ErrorNumber,
	ERROR_STATE() as ErrorState,
	ERROR_PROCEDURE() as ErrorProcedure,
	ERROR_LINE() as ErrorLine,
	ERROR_MESSAGE() as ErrorMessage
end catch
exec updateEmp
	'Ram',30000

select * from empwage
