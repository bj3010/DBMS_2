create database  person_info
CREATE TABLE Department(
DepartmentID Int Primary Key,
DepartmentName	Varchar (100) Not Null Unique,
DepartmentCode	Varchar (50) Not Null Unique,
Location Varchar (50) Not Null)

INSERT INTO Department VALUES(1,'Admin','Adm','A-Block')
INSERT INTO Department VALUES(2,'Computer','CE','C-Block')
INSERT INTO Department VALUES(3,'Civil','CI','G-Block')
INSERT INTO Department VALUES(4,'Electrical','EE','E-Block')
INSERT INTO Department VALUES(5,'Mechanical','ME','B-Block')

CREATE TABLE Person(
PersonID Int Primary Key,
PersonName Varchar(100) Not Null,
DepartmentID Int Null FOREIGN KEY REFERENCES Department(DepartmentID),
Salary Decimal(8,2) Not Null,
JoiningDate	Datetime Not Null,
City Varchar(100) Not Null)

INSERT INTO Person VALUES(101,'Rahul Tripathi',2,56000,'01-01-2000','Rajkot')
INSERT INTO Person VALUES(102,'Hardik Pandya',3,18000,'25-sep-2001','Ahmedabad')
INSERT INTO Person VALUES(103,'Bhavin Kanani',4,25000,'14-may-2000','Baroda')
INSERT INTO Person VALUES(104,'Bhoomi Vaishnav',1,39000,'08-feb-2005','Rajkot')
INSERT INTO Person VALUES(105,'Rohit Topiya',2,17000,'23-jul-2001','Jamnagar')
INSERT INTO Person VALUES(106,'Priya Menpara',NULL,9000,'18-oct-2000','Ahmedabad')
INSERT INTO Person VALUES(107,'Neha Sharma',2,34000,'25-dec-2002','Rajkot')
INSERT INTO Person VALUES(108,'Nayan Goswami',3,25000,'01-jul-2001','Rajkot')
INSERT INTO Person VALUES(109,'Mehul Bhundiya',4,13500,'09-jan-2005','Baroda')
INSERT INTO Person VALUES(110,'Mohit Maru',5,14000,'25-may-2000','Jamnagar')


--1
Select P.PersonName, D.DepartmentName, D.DepartmentCode
from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID

--2
Select P.PersonName
from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.Location = 'C-Block'

--3
Select P.PersonName, P.Salary, D.DepartmentName
from Person p
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where P.City = 'Jamnagar'

--4
Select P.PersonName, P.Salary, D.DepartmentName
from Person p
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where P.City <> 'Rajkot'

--5
select * from Person P
Left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName = 'Computer'

--6
select * from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName is null

--7
select P.PersonName from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where D.DepartmentName = 'Civil'
and P.JoiningDate > '1/08/2001'

--8
select P.PersonName, D.DepartmentName from Person P
left outer join Department D
on P.DepartmentID = D.DepartmentID
where datediff(day,p.joiningDate,getdate())>365

--9

select D.DepartmentName, count(p.personID)
from person p
left outer join Department D
on p.DepartmentID=d.DepartmentID
group by D.DepartmentName


--10

select D.DepartmentName,max(p.Salary),min(p.Salary)from person p
inner  join Department D
on p.DepartmentID=D.DepartmentID
group by D.DepartmentName

--11
select p.City,min(p.Salary),max(p.Salary),sum(p.Salary),avg(p.Salary)
from Person p
group by city


--12
select D.DepartmentName,sum(p.Salary)
from Department D
left outer join Person p
on D.DepartmentID=p.DepartmentID
group by D.DepartmentName
having sum(p.Salary)>100000

--13

select avg(p.Salary) from Person p
where City='Ahmedabad'

--14

select  D.DepartmentName,count(p.personID)
from Person p
left outer join Department D
on D.DepartmentID=p.DepartmentID
group by D.DepartmentName
having COUNT(p.personID) is null


--15
select D.DepartmentName,count(p.personID)
from Person P
left outer join Department D
on D.DepartmentID=p.DepartmentID
group by D.DepartmentName
having count(p.personID)>2

--16

select  p.personName +'lives in '+ p.City +'and works in '+ D.DepartmentName +'Department'  from person p
left outer join Department D
on D.DepartmentID=p.DepartmentID

--17
select p.personName +'erans '+ cast(p.Salary as varchar) +'from department'+ D.DepartmentName +'monthly' from Person p
left outer join Department D
on d.DepartmentID=p.DepartmentID

--18

select D.DepartmentName , p.City , avg(p.Salary),sum(p.Salary),max(p.Salary) from person p
inner join Department D
on d.DepartmentID=p.DepartmentID
group by  D.DepartmentName , p.City

--19

update person  
set person.Salary =person.Salary+(0.1)*person.Salary
from Person 
left outer join Department
on Department.DepartmentID=Person.DepartmentID
where Department.DepartmentName='Computer'