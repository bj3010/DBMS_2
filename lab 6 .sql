create database Person_Loginfo



--part_A--

--1 Create a trigger that fires on INSERT, UPDATE and DELETE operation on 
--the Person table to display a message “Record is Affected.”

create trigger Printmsg_iud
on person 
for insert,update,delete
as
begin
	print('record is affected')
end

insert into Person
values(101,'bhargav',15000,'2022-02-13','rajkot',23,'2003-10-30')


update Person
set 
salary =120000
where PersonID=101

delete from person
where personId=101

select *from person
select * from personLog


--2
--Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that, log 
--all operations performed on the person table into PersonLog.

--2.1
alter trigger Person_in_up_de
on person 
for  insert 
as
begin 
	declare @id int , @name varchar(50)
	select @id=PersonID from inserted
	select @name =personName from inserted
	
	insert into PersonLog
	values(@id,@name,'insert',getdate())
end

drop trigger Person_in_up_de
--2.2

create trigger Person_up
on person 
for  update 
as
begin 
	declare @id int , @name varchar(50)
	select @id=PersonID from inserted
	select @name =personName from inserted
	
	insert into PersonLog
	values(@id,@name,'update',getdate())
end

drop trigger Person_up

--2.3

alter trigger Person_de
on person 
for  delete 
as
begin 
	declare @id int , @name varchar(50)
	select @id=PersonID from deleted
	select @name =personName from deleted
	
	insert into PersonLog
	values(@id,@name,'delete',getdate())
end

drop trigger Person_de
--3

--Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. 
--For that, log all operations performed on the person table into PersonLog.


--3.1

alter trigger Person_in_instedof
on person 
instead of  insert 
as
begin 
	declare @id int , @name varchar(50)
	select @id=PersonID from inserted
	select @name =personName from inserted
	
	insert into PersonLog
	values(@id,@name,'instead insert',getdate())
end
drop trigger Person_in_instedof


--3.2
alter trigger Person_up_instead
on person 
instead of update 
as
begin 
	declare @id int , @name varchar(50)
	select @id=PersonID from inserted
	select @name =personName from inserted
	
	insert into PersonLog
	values(@id,@name,' instead update',getdate())
end
 
 drop trigger Person_up_instead
--3.3
create trigger Person_de_instead
on person 
instead of delete
as
begin 
	declare @id int , @name varchar(50)
	select @id=PersonID from deleted
	select @name =personName from deleted
	
	insert into PersonLog
	values(@id,@name,'instead delete',getdate())
end

drop trigger Person_de_instead

--4
--Create a trigger that fires on INSERT operation on the Person table to convert person name into 
--uppercase whenever the record is inserted

alter trigger insert_nameupper
on person 
after insert
as
begin 
	declare @name varchar(50),
	@id int 
	select @name=personName from inserted
	select @id=personID from inserted
	
	update person 
	set 
		personName=UPPER(@name)
		where personID=@id
end




--part b