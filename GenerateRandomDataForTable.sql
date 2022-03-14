/*If exists the those table name than drop this*/
if(exists (select * from information_schema.tables where TABLE_NAME = 'ProductSales'))
begin
	drop table ProductSales
end
if(exists (select * from information_schema.tables where TABLE_NAME = 'Products'))
begin
	drop table ProductSales
end

/*create tables here*/
create table Products
(
	[Id] int identity primary key,
	[name] varchar(50),
	[Description] varchar(250)
)
create table ProductSales
(
	Id int identity primary key,
	ProductId int foreign key references Products(Id),
	UnitPrice int,
	QuantitySold int
)

/*Insert sample data into the table*/
Declare @Id int
set @id = 1
while (@Id<=1000)
begin
	insert into Products values ('products - ' + cast(@ID as nvarchar(40)),
	'Products - '+cast(@ID as nvarchar(40)) + ' Description')
	print @Id
	set @Id = @Id + 1
end

select * from Products

/*Declare variables to hold a random Product id*/
declare @RandomProductId int
declare @RandomUnitPrice int
declare @RandomQuantitySold int

declare @UpperLimitForProductId int
declare	@LowerLimitForProductId	 int

declare @UpperLimitForUnitPrice int
declare	@LowerLimitForUnitPrice	 int

declare @UpperLimitForQuantitySold int
declare	@LowerLimitForQuantitySold int

set @LowerLimitForProductId = 1
set @UpperLimitForProductId = 800

set @UpperLimitForUnitPrice = 1
set	@LowerLimitForUnitPrice	 = 10

set @UpperLimitForQuantitySold = 1
set	@LowerLimitForQuantitySold = 10

declare @counter int
set @counter = 1
while (@counter <= 1500)
begin
	select @RandomProductId = round(((@UpperLimitForProductId - @LowerLimitForProductId) * rand() + @LowerLimitForProductId ), 0)
	select @RandomUnitPrice = round (((@UpperLimitForUnitPrice - @LowerLimitForUnitPrice) * rand() + @LowerLimitForUnitPrice),0)
	select @RandomQuantitySold = round (((@UpperLimitForQuantitySold - @LowerLimitForQuantitySold) * rand() + @LowerLimitForQuantitySold),0)
	
	insert into ProductSales values (@RandomProductId,@RandomUnitPrice,@RandomQuantitySold)
	
	print @counter
	set @counter = @counter + 1
end

select * from Products
select * from ProductSales