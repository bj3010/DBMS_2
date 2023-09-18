--lab 2 , lab 4 




create database Worker_info
--

create proc spPerson_Insert 

	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8,2),
	@JoiningDate datetime ,
	@departmentID int ,
	@designationID int 
as
begin 
 	Insert into person(FirstName,LastName,Salary,JoiningDate,departmentID,designationID)
	values(@FirstName,@LastName,@Salary,@JoiningDate,@departmentID,@designationID)
end

-----


create proc spDepartment_insert

	@DepartmentID int ,
	@departmentName varchar(100)
as
begin 
	 insert into Department(DepartmentID ,departmentName)
	  values (@DepartmentID ,@departmentName)
end


----

create proc spDesigntaion_inser 

	@DesignationID int ,
	@DesignationName varchar (100)
as
begin 
	insert into Designation(DesignationID ,DesignationName)
	values(@DesignationID ,@DesignationName)
end

---

exec spDepartment_insert 1,'Admin'
exec spDepartment_insert 2,'IT'
exec spDepartment_insert 3,'HR'
exec spDepartment_insert 4,'Account'


select * from Department

exec spDesigntaion_inser 11,'Jobber'
exec spDesigntaion_inser 12 ,'Welder'
exec spDesigntaion_inser 13,'Clerk'
exec spDesigntaion_inser 14,'Manager'
exec spDesigntaion_inser 15,'CEO'


select * from Designation


exec spPerson_Insert 'Rahul','Anshu',56000,'01-01-1990',1,12
exec spPerson_Insert 'Hardik','Hinsu',18000,'09-25-1990',2,11
exec spPerson_Insert 'Bhavin ','Kamani',25000,'05-14-1991',null,11
exec spPerson_Insert 'Bhoomi','Patel',39000,'02-20-2014',1,13
exec spPerson_Insert 'Rohit','Rajgor',17000,'07-23-1990',2,15
exec spPerson_Insert 'Priya','Mehta',25000,'10-18-1990',2,null
exec spPerson_Insert 'Neha','Trivedi',18000,'02-20-2014',3,15


select * from person
delete from person
--drop table person


----lab 4 function 

--11--
alter function FirstNameWithB( )
returns table 
as
return
	select * from person
	where FirstName like 'B%'

select * from DBO.FirstNameWithB()

--12--


create function UniqueNAme( )
returns table 
as
return
	select Distinct FirstName from person  

select * from dbo.UniqueNAme()


--13--

alter function DEP_withdetails(@DepartmentID int)
returns table 
as
return 
	select p.WorkerID,p.Firstname,p.LastName,p.Salary,D.DepartmentName
	from person p
	inner join Department D
	on p.DepartmentID=D.DepartmentID
	where D.DepartmentID=@DepartmentID

select *from dbo.DEP_withdetails(3)
	




---update 

create proc spPerson_update
	@WorkerID int,
	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8,2),
	@JoiningDate datetime ,
	@departmentID int ,
	@designationID int 
as
begin 
	update person
	set FirstName=@FirstName,
		lastName=@LastName,
		salary =@Salary,
		joiningDate=@JoiningDate,
		DepartmentID=@departmentID,
		DesignationID=@designationID
	where WorkerID=@workerID
end


--



create proc spDepartment_update
	@DepartmentID int ,
	@DEpartmentName varchar(100)

As
begin 
	update Department
	set DepartmentID=@DepartmentID,
		DepartmentName=@DEpartmentName
end


--

create proc spDesignation_update
	@DesignationID int ,
	@DesignationName varchar(100)

As
begin 
	update Designation
	set DesignationID=@DesignationID,
		DesignationName=@DesignationName
end



--- Delete

create proc spPerson_Dalete
	@WorkerID int 

as
begin 
	delete from person
	where WorkerID=@WorkerID
END


--


create proc spDepartment_deLETE
	@DepartmentID int

As
begin 
	DELETE FROM  Department
	where DepartmentID=@DepartmentID
end

--



create proc spDesignation_delete
	@DesignationID int 
As
begin 
	delete from  Designation
	where DesignationID=@DesignationID
end 





--select pk 

create proc spPerson_selete_pk
	@WorkerID int
as
begin 
	select *from person
	where WorkerID=@WorkerID
end

--

create proc spDepartment_select_pk
	@DepartmentID int

As
begin 
	select * FROM  Department
	where DepartmentID=@DepartmentID
end
exec spDepartment_select_pk 1

--

create proc spDesignation_select_pk
	@DesignationID int 
As
begin 
	delete from  Designation
	where DesignationID=@DesignationID
end




---select all data 

create proc spPerson_select_all
as
begin 
	select 
		p.WorkerID,
		p.FirstName,
		p.LastName,
		p.Salary,
		p.JoiningDate,
		d.DepartmentName,
		ds.DesignationName
		from person p
	left outer join Department d
	on p.DepartmentID=d.DepartmentID
	left outer join Designation ds
	on p.DesignationID=ds.DesignationID
end 

exec spPerson_select_all

--


create proc spDepartment_select_all
As
begin 
	select * FROM  Department
	
end


--


create proc spDesignation_select_all
	as
begin 
	select * from  Designation
end


