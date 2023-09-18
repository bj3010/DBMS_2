create database Customer_info

select * from Customers
select *from Orders




--part A

-- 1 Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error

declare @a int , @b int,@ans int 
begin try 
	select @a=5,@b=0
	select @ans= @a/@b
	print('ans is '+cast(@ans as varchar(50)))
end try
begin catch
	print('Error occurs that is - Divide by zero error')
end catch



--2  Try to convert string to integer and handle the error using try…catch block.declare @number varchar(50), @n int begin try 	select @number='3004bh'	select @n=CAST(@number as int )	print ('string in int')end try begin catch  	print ('ant error pccurs, please cheack')end catch--3 Create a procedure that prints the sum of two numbers: take both numbers as integer & handle 
 --exception with all error functions if any one enters string value in numbers otherwise print result


alter proc sp_sum_number
	@a int , @b int 
as
begin
	declare @sum int 
		select @sum =@a+@b
		print ('sum is '+ cast(@sum as varchar(5)))
end


begin try 
	declare @d int ,@c int
	select @d='1k2', @c=55
	exec sp_sum_number @d,@c
end try 
begin catch 
		
		print('error occurs : string in not valid to sum of two numbers')	
end catch



--4  Handle a Primary Key Violation while inserting data into customers table and print the error details 
--such as the error message, error number, severity, and state.


begin try 
	insert into Customers
	values (101,'bhargav','bhargav23@gmail.com')
end try 
begin catch 
  select error_number () as [error number] 
  select ERROR_MESSAGE() as [error message] 
  select ERROR_STATE() as [error statge]
  select ERROR_SEVERITY() as [error severity]
 end catch




 --5 Throw custom exception using stored procedure which accepts Customer_id as input & that throws 
	--Error like no Customer_id is available in database.


alter proc idnotfound
@id int 
as
begin 
	if exists (
		select * from Customers
		where [Customer_id]=@id)
		select 'yes exists'
	else 
		throw 52999,'customer is not exists',18	
end

exec idnotfound 105