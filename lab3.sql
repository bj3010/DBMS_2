--lab 3 stored proc.
--1
create proc spPerson_top3
as
begin
	select top(3)*from person
end


--2
create proc spDepartmentName_allreturn
@DepartmentName varchar(100)
as
begin 
	select 
		p.WorkerID,
		p.FirstName,
		p.LastName,
		p.Salary,
		p.JoiningDate,
		d.DepartmentName
		from person p
	left outer join Department d
	on p.DepartmentID=d.DepartmentID
	where DepartmentName= @DepartmentName
end 


--3


create proc spDepartmentName_designationName_allreturn
@DepartmentName varchar(100),
@designtioanName varchar (100)
as
begin 
	select
		p.FirstName,
		p.Salary,
		p.JoiningDate,
		d.DepartmentName
		from person p
	left outer join Department d
	on p.DepartmentID=d.DepartmentID
	left outer join Designation ds
	on p.DesignationID=ds.DesignationID
	where DepartmentName= @DepartmentName
	and DesignationName= @designtioanName
end



--4

create proc spPerson_Return_allData
	@FirstName varchar(100)
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
	
	where p.FirstName=@FirstName
end 

--5


create proc spDepartent_max_min_total
as
begin 
	select
		d.DepartmentName,
		max(p.Salary) as[max salary],	
		min(P.Salary) as [min salary],
		sum(p.Salary) as [total salary]
	from person p	
	left outer join Department d
	on p.DepartmentID=d.DepartmentID
	group by d.DepartmentName
end 


--6

create proc spDesignation_max_min_total
as
begin 
	select
		d.DesignationName,
		max(p.Salary) as[max salary],	
		min(P.Salary) as [min salary],
		sum(p.Salary) as [total salary]
	from person p	
	left outer join Designation d
	on p.DesignationID=d.DesignationID
	group by d.DesignationName
end 
