------------------DELETE CASCADE & UPDATE CASCADE-----------------------

create table Coustomers(
	cust_id int primary key,
	cust_name varchar(40),
)
insert into Coustomers(cust_id, cust_name) values(1,'Singh')
insert into Coustomers(cust_id, cust_name) values(2,'John')
insert into Coustomers(cust_id, cust_name) values(3,'Arnab')
insert into Coustomers(cust_id, cust_name) values(4,'Funny')

/*create table Orders(
	order_id int identity(1,1),
	cust_id int not null default 1,
	items varchar(50)
	foreign key(cust_id) references Coustomers(cust_id)
	on delete cascade
)*/

create table Orders(
	order_id int identity(1,1),
	cust_id int not null default 1,
	items varchar(50)
	foreign key(cust_id) references Coustomers(cust_id)
	on update cascade
	on delete cascade
)

insert into Orders (cust_id, items) values(1, 'pen')
insert into Orders (cust_id, items) values(2, 'Graphics')
insert into Orders (cust_id, items) values(3, 'cpu')
insert into Orders (cust_id, items) values(4, 'ram')

select * from Coustomers
select * from Orders

drop table Orders

delete from Coustomers where cust_id=3
update Coustomers set cust_id = 25 where cust_id=4





/* update employee record */
Create procedure spUpdateEmployeePayroll
(
@name varchar(20),
@salary money
)
As 
Begin try
update employee set salary=@salary where name=@name
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spUpdateEmployeePayroll
'Debdutt',85000



Alter procedure spEmpDetailsForDataRange
(
@startdate date
)
As
Begin try
/* select * from employee where startdate between cast('{Date}' as date) and 
cast(getdate() as date) */
select * from employee where startdate between CAST(@startdate AS date) AND SYSDATETIME()
end try  
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spEmpDeta