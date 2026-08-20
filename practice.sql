create table Student1(
studentId int,
name varchar(50),
age int,
dept varchar(20)
)
------------------------------
truncate table Student1
----------------------------------
select * from Student1
------------------------------------
insert into student1
values (1,'A',20,'CMPN'),
       (2,'B',20,'CMPN'),
	   (3,'C',20,'CMPN'),
	   (4,'D',21,'INFT'),
	   (5,'E',23,'EXTC'),
	   (6,'F',21,'EXTC')
-----------------------------------
select dept,count(studentId) as stud_ID from Student1
group by dept
having count(studentId)>1
------------------------------
delete from student1
where studentID=1
---------------------
alter table student1 add email varchar(40) unique
-----------------------------------
update student1
set email='abc@gmail.com'
where studentID=1
----------------------------
alter table student1 rename column name to Full_Name

create table learners(
studentid int primary key,
name varchar (50),
age int,
email varchar (70) unique
)
insert into learners
values (1,'Amit Sharma',17,'amit17@gmail.com'),
		(2,'Anjali Verma',18,'anjali18@gmail.com'),
		(3,'Ravi Yadav',19,'ravi19@gmail.com')
select * from learners
delete from learners where age<18
truncate table 
-----------------------------------------------------------------------------
create table company(
EmpName varchar(50) not Null,
EmpId int primary key not null,
age int,
email varchar(40),
gender char(1),
check (gender in('M','F'))
)
insert into company 
values ('Anjali',349,35,'anjaligaikwad@gmail.com','F'),
		('sunita',1934,40,'sunitadahate@gmail.com','F'),
		('sangeeta',1976,48,'sangeetaKhadge@gmail.com','F'),
		('Akshay',971,50,'akshaykumar@gmail.com','M'),
		('yogesh',781,51,'yogeshtiwari@yahoo.com','M')
---
select * from company
---
select * from company where empname in ('Anjali')
------
alter table company add job_id varchar(90)
----
update company 
set job_id=case empid
when 349 then 'senior developer'
when 874 then 'Manager'
when 781 then 'Manager'
when 971 then 'Developer'
when 1976 then 'Clerk'
end
---
alter table company add salary decimal(8,2)
update company
set salary=case job_id
when 'senior developer' then 75000.00
when 'Manager' then 68000.00
when 'Developer' then 56000.00
when 'Clerk' then 48000.00
end
----
update company set EmpID=874 where Empname = 'sunita'
---
insert into company 
values ('abc',34,23,'xyz','M')
delete from company
where Empname='abc'
----
select empid,empname,job_id,salary from company
where salary not in ( select salary from company where job_id='Manager')
and job_id <>'Manager'
-----
select empid,empname,job_id,salary from company 
where salary<Any(select salary from company where job_id='Manager')
and job_id <>'Manager'
--------
select * from company where not exists (select empid from company where empid=349) --not working

select * from company where empid<>349
---------
select empid,empname,job_id,salary from company
where salary <(select avg(salary) from company) 
--------

create table students(
name varchar(10) default 'UNKNOWN',
Sid int primary key,
departid int references departments(departid)
)
--------
create table departments(
Dname varchar(50),
departid int primary key
)
--------
insert into students
values (default, 123),
		('amey',54)
-----
select * from students
drop table students
drop table departments 

create table depart(
depid int primary key,
depart_name varchar(50)
)
create table emp1(
empname varchar(50),
empid int primary key,
depid int references depart(depid)
)
insert into depart
values (1,'developer'),
		(2,'senior developer'),
		(3,'Manager')
insert into emp1 values ('anjali',48,1)
insert into emp1
values ('ravi',34,1),
	('anup',55,2)

select * from emp1	

select e.empname,d.depart_name
from emp1 as e
join depart as d
on e.depid=d.depid
---------leetcode----------------
create table address(
addressid int primary key,
personid int references person(personid),
city varchar(90),
state varchar(50)
)
create table person(
personId int primary key,
lastName varchar(70),
firstName varchar(60)
)

insert into person
values (1,'wang','allen'),
		(2,'alice','bob')
insert into address
values (1,2,'new york city','new york')

select p.firstName,p.lastName,a.city,a.state
from person as p
left join address as a
on p.personId=a.personId
------------------------
alter table address
add country char(70)

update address
set country='california'
where addressId=1;

select * from address

--DESC person
alter table company 
add address varchar(90)

update company
set address='Navi Mumbai'
where age=35
select * from company


select distinct empname from company

select * from company order by age desc

create table Faculty(
Faculty_code int primary key,
Faculty_Name varchar(70),
dob date,
subject varchar(10),
hours int
)

insert into Faculty
values (100,'Yogesh','1964/07/17','DSA',16),
		(101,'Amit','1972/12/24','MIS',16),
		(102,'omprakash','1980/02/03','PWRC',8),
		(103,'Nitin','1966/11/28','DT',10)

select * from faculty order by Faculty_Name
select * from faculty order by Faculty_Name DESC
select * from faculty order by dob desc
select * from faculty where hours>12
select * from faculty where hours<>16
select * from faculty where subject='DT'
select * from faculty where subject<>'DT' And hours<>10
select * from faculty where subject<>'DT' or hours>10
select * from faculty where subject<>'DT'
select * from faculty where hours between 10 and 20
select * from faculty where hours not between 10 and 20

------------pattern matching operation--------
select * from faculty where faculty_name like 'A%'
select * from faculty where faculty_name like 'om%'
select * from faculty where faculty_name like '%h'
select * from faculty where faculty_name like '%a%'
select * from faculty where faculty_name like '_o%e%h'
select * from faculty where faculty_name like '_m%'
select * from faculty where faculty_name like '%_s%'

---------------restricting row (limit)------------
select * from faculty order by hours desc limit 2

create table exam(
sid int primary key,
sname varchar(90),
marks int
)
insert into exam
values (1,'Mahesh',90),
		(2,'Suhas',80),
		(3,'jyendra',89),
		(4,'Sachin',99),
		(5,'Vishal',88),
		(6,'Payal',90)
select * from exam
select count(sid) as sid_count from exam
select count(distinct sid) as dist_count from exam
select count(distinct marks) as dist_marks from exam
select avg(marks) as Avg_marks from exam
select min(marks) as mini_marks from exam
select max(marks) as max_marks from exam
select sname, marks from exam where marks>89

--------------
create table person2(
driverid int primary key,
pname varchar(80),
address varchar(100)
)

create table car(
license varchar(70) primary key,
model varchar(50),
myear varchar(60)
)
create table accident(
reportCno varchar(70),
acc_date date,
acc_location varchar(80)
)
create table owns(
driverid int references person2(driverid),
license varchar(70) references car(license)
)
create table participated(
driverid int references person2(driverid),
report_number int,
damage_amount decimal(8,2)
)
-------
INSERT INTO person2 (driverid, pname, address)
VALUES
    (101, 'Ravi Sharma', 'Mumbai'),
    (102, 'Anjali Patil', 'Pune'),
    (103, 'Akshay Kumar', 'Nashik'),
    (104, 'Sunita Deshmukh', 'Thane'),
    (105, 'Yogesh Tiwari', 'Nagpur'),
	(106, 'Ajay','Navi Mumbai')
INSERT INTO car (license, model, myear)
VALUES
    ('MH01AB1234', 'Hyundai Creta', '2022'),
    ('MH12CD5678', 'Honda City', '2021'),
    ('MH15EF9012', 'Tata Nexon', '2023'),
    ('MH04GH3456', 'Maruti Swift', '2020'),
    ('MH31IJ7890', 'Toyota Innova', '2022'),
	('MH478X1973','Tesla','2023')
INSERT INTO accident (reportCno, acc_date, acc_location)
VALUES
    ('R001', '2026-01-15', 'Andheri, Mumbai'),
    ('R002', '2026-02-20', 'Kothrud, Pune'),
    ('R003', '2026-03-10', 'Nashik Road'),
    ('R004', '2026-04-05', 'Thane West'),
    ('R005', '2026-05-18', 'Nagpur Highway'),
	('R006','2026-06-19','Panvel')
INSERT INTO owns (driverid, license)
VALUES
    (101, 'MH01AB1234'),
    (102, 'MH12CD5678'),
    (103, 'MH15EF9012'),
    (104, 'MH04GH3456'),
    (105, 'MH31IJ7890'),
	(106,'MH478X1973')
INSERT INTO participated (driverid, report_number, damage_amount)
VALUES
    (101, 1, 25000.00),
    (102, 2, 15000.50),
    (103, 3, 45000.00),
    (104, 4, 12000.75),
    (105, 5, 30000.00),
	(106,6,18400.50)
---------
select count(*) from accident 
where reportCno in (select report_number from participated 
where driverid in (select driverid from person2 where pname='Anjali Patil' 
))
--------
alter table participated 
alter column report_number type varchar(70)
--------
alter table participated add car varchar(50)
------
UPDATE participated
SET car = 'Hyundai Creta'
WHERE driverid=101;

UPDATE participated
SET car = 'Honda City'
WHERE driverid=102;

UPDATE participated
SET car = 'Tata Nexon'
WHERE driverid=103;

UPDATE participated
SET car = 'Maruti Swift'
WHERE driverid=104;

UPDATE participated
SET car = 'Toyota Innova'
WHERE driverid=105;

update participated
set car = 'Tesla'
where driverid=106;
-------------
alter table car drop column car
-----------------------------------------
create table employee(
eid int primary key,
name varchar(40),
street varchar(80),
city varchar(60)
)
select * from employee
insert into employee
values (101,'Ajay', 'malad','Mumbai'),
		(102,'Anjali', 'Panvel','Navi Mumbai'),
		(103,'devyani','kharghar','Navi Mumbai'),
		(104,'Harsha', 'kamothe','Navi Mumbai'),
		(105,'Jagdish','Kamal chowk','Nagpur'),
		(106,'Amey','pimpri chinchwad','Pune')
---------------------
create table works(
eid int references employee(eid),
cid int primary key,
salary decimal(8,2)
)
insert into works
values (101,1001,45000.00),
		(102,1002,85000.00),
		(103,1003,25000.00),
		(104,1004,50000.00),
		(105,1005,100000.00),
		(106,1006,55000.00)
------------------
create table manager(
eid int references employee(eid),
manager_name varchar(90)
)
insert into manager
values (102, 'Anjali'),
		(105,'Jagdish')
---------------------
create table company1(
cid int references works(cid),
company_name varchar(80),
city varchar(50)
)
insert into company1
values (1001, 'TCS','Mumbai'),
		(1002,'Reliance','Mumbai'),
		(1003,'Godreg','Bangorole'),
		(1004,'Jio','turbhe'),
		(1005,'TCS','Mumbai'),
		(1006,'Infosys','Pune')
----------------------------------
update employee
set city='Mumbai',
	street='Bandra'
where eid=104
----------------------------------
select * from employee order by eid
-----------------------------
select eid,name,city from employee
where city in (select city from company1
				where eid=employee.eid)
-------------------------
select * from employee
select name,city from employee
select name,city from employee where city='Navi Mumbai'
select eid,name from employee where eid>103
select eid,name from employee where eid between 102 and 105
select eid,name from employee where name='Anjali'
select eid,name,city from employee where city in (select city from employee where city='Mumbai' or city= 'Pune')
select eid,name,city from employee where city<>'Mumbai'
select name from employee where name like 'A%'
-------------------------------
update works 
set salary=60000.00
where eid=106

update works
set salary= salary+5000
select * from works

select max(salary) from works

select min(salary) from works

select avg(salary) from works

select count(eid) from works

select count(salary) from works where salary>50000

select avg(salary) from works where salary>50000

select city,count(city) as count_city from employee group by city

select e.city,avg(w.salary) As average_sal from employee as e 
join works as w
on e.eid=w.eid
group by e.city
---------------------------
select max(w.salary) as max_sal,e.city from employee as e
join works as w
on e.eid=w.eid
group by e.city
-----------------------
select avg(w.salary) as avg_sal,e.city from employee as e
join works as w
on e.eid=w.eid
group by e.city
having avg(w.salary)>50000
------------------
---textbook questions
select e.eid,e.name,m.manager_name from employee as e
join manager as m
on e.eid=m.eid
-------------
select city,count(*) "total_emp"
from employee 
group by city
---------------
select avg(salary) from works 
where salary>35000
group by eid
----------------
select city,count(*) from employee 
group by city
having count(*)>1
---------------
select max(salary) "second highest" from works
where salary<(select max(salary) from works)
----------------------
select salary from works
order by salary desc
limit 1 offset 1
select * from works













