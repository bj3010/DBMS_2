*--lab 4  scaler function  and table function --

--1
create function hello ()
returns varchar(100)
as
begin
	declare @str varchar(100)
	set @str='hello world'
	return @str
end
select dbo.hello()

--2

create function fun(@no1 int,@no2 int)
returns int 
as
begin 
	return @no1+@no2
end 

select dbo.fun(10,10)

--3

create function CUB(@no1 int )
returns int 
as
begin 
	return @no1*@no1*@no1
end 

select dbo.CUB(5)

--4
create function OD(@no1 int)
 returns varchar(100) 
 as
 begin 
	declare  @b varchar(50)
	if(@no1%2=0)
		set  @b='even'
	else
		set @b='odd'
		return @b
end 

select dbo.OD(4)

--5

 create function comper(@no1 int,@no2 int)
 returns int 
 as
 begin 

	return case 
		when @no1>@no2  then @no1
	else @no2 
	end 
end 

select dbo.comper(3,9)

--6
 alter function printno(@a int)
 returns varchar(50) 
 as 
 begin 
	 declare @i int ,@res varchar(50)=''
	 set @i=1
	 while (@i<=@a)
		begin 
			set @res=@res+cast(@i as varchar(10))+''
			
			set @i=@i+1
		end 
	return @res
end 

select dbo.printno(10)

--7

create function sumofevenodd()
returns varchar(100)
as
begin 
		declare @i int =1, @a int =20,@c int =0
		while (@i<=@a)
		begin 
			if(@i%2 =0)
				set @C=@C+@i
				set @i=@i+1
			end
		return @c	
end 

select dbo.sumofevenodd()

--8
alter function prime(@a int )
returns varchar(100)
as 
begin 
	declare @i int =1,@count varchar(100)=''
	while(@i<=@a/2)
		begin 
			if(@a%@i=0)
				set @count='not prime '
			else 
				set @count='prime'
				set @i=@i+1

		end
	  return @count
end

select dbo.prime(18)


--9
create function dateffernce(@data1 date ,@data2 date)
returns int
as
begin 
return datediff(day,@data1,@data2)
end
 
 select dbo.dateffernce('20230810','20230805')as[ date diff]
  select dbo.dateffernce('20230801','20230805')as[ date diff]
  select dbo.dateffernce('20200810','20230805')as[ date diff]

--10
	
