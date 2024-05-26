
------------------		 DDL => Data Definition Language		-----------------------

-- DDL : works with metadata & structure

-- 1. Create 

Create Database CompanyCycle40

Use CompanyCycle40

create table Employee
(
SSN bigint primary key identity(1, 1),
FName varchar(15) not null, -- Required
LName varchar(15),          -- optional
Address varchar(20) default 'Cairo',
Salary Money,
Gender char(1),
BDate Date,
DNo int,
SuperSSN bigint references Employee(SSN) -- Self Relationship
)

create table Department
(
Number int primary key identity(10, 10),
Name varchar(15) not null,
StarteDate Date,
MGRSSN bigint references Employee(SSN)
)

create table DeptLocations
(
Number int references Department(Number),
Name varchar(15),
primary key(Number, Name) -- Composite PrimaryKey
)

create table Project
(
PNum int primary key identity, 
PName varchar(20) not null,
Location varchar(20),
DNo int references Department(Number)
)

create table Dependent
(
Name varchar(20) not null,
Gender char(1),
BDate Date,
Relationship varchar(20),
ESSN bigint references Employee(SSN),
primary key(ESSN, Name)
)

create table Works_On
(
ESSN bigint references Employee(SSN),
PNo int references Project(PNum),
Hours tinyint ,
primary key(ESSN, PNo)
)

-- 2. ALter [Update] [add coulmn, modify coulmn datatype, drop coulmn, rename coulmn]

-- add coulmn
Alter Table Employees
Add Test int

-- modify coulmn datatype
Alter Table Employees
Alter Column Test bigint

-- drop coulmn
Alter Table Employees
Drop Column Test


ALTER Table Employee
Add foreign key (DNo) references Department(Number)
 

-- 3. Drop [Remove]

drop table Employee
drop database CompanyCycle40