=======================================================
--------------------- Built-in Functions --------------
=======================================================

------------------- 1. Aggregate Functions ---------------
--  Return Just Only One Value (Scalar Functions) 
--  That Value is Not Existed In Database
--	Count, Sum, Avg, Max, Min  

select count(*)
from student

select count(St_Id)
from student

--The Count of Students That have Ages (Not Null)
select count(st_age) 
from student

select count(*) , count(st_id), count(st_lname), count(st_age)
from Student

select sum(salary)
from instructor


select avg(st_age)
from Student -- 26

select sum(st_age)/COUNT(*)
from Student -- 19

select sum(st_age)/COUNT(st_age)
from Student -- 26


select Max(Salary) as MaxSalary, Min(Salary) as MinSalary
from Instructor


-- Minimum Salary For Each Department
select Dept_Id, Min(Salary) as MininmumSalary
from Instructor
Group By Dept_Id


-- You Can't Group By With * or PK 
-- We Grouping With Repeated Value Column


-- Get Number Of Student For Each Department [Need Join?]
select Dept_id, Count(St_Id) as NumberOfStudents
from Student
group by Dept_Id

select Dept_id, Count(*) as NumberOfStudents
from Student
group by Dept_Id

select Dept_id, Count(St_Id) as NumberOfStudents
from Student
where dept_id is not null
group by Dept_Id

Select Dept_Id, St_Address, Count(St_Id) as NumberOfStudents
From Student
Group By Dept_Id, St_Address 

-- Will Group Here With Which Column?
-- If You Select Columns With Aggregate Functions, 
-- You Must Group By With The Same Columns 

select Dept_id,st_address, Count(St_Id) as NumberOfStudents
from Student
where dept_id is not null
group by Dept_Id, st_address 
---
select Dept_id,st_address, Count(St_Id) as NumberOfStudents
from Student
where dept_id is not null and st_address is not null
group by st_address, Dept_Id 
-- or
select Dept_id,st_address, Count(St_Id) as NumberOfStudents
from Student
where dept_id is not null and st_address is not null
group by Dept_Id, st_address
order by Dept_Id
-- or
select Dept_id,st_address, Count(St_Id) as NumberOfStudents
from Student
where dept_id is not null and st_address is not null
group by Dept_Id, st_address
order by Dept_Id,Count(St_Id)


-- having : Codition on Group By

-- Get Number Of Student For Each Department [that has more than 3 students]
--
select Dept_id, Count(St_Id) as NumberOfStudents
from Student
where dept_id is not null 
group by Dept_Id
having Count(St_Id) > 3  -- The best in terms of performance
-- or
select Dept_id, Count(*) as NumberOfStudents
from Student
where dept_id is not null 
group by Dept_Id
having Count(*) >  -- The best in terms of performance
--or
select S.Dept_Id, Count(St_Id) as NumberOfStudents
from Student S, Department D
where D.Dept_Id = S.Dept_Id
group by S.Dept_Id 
having Count(St_Id) > 3  
--

select S.Dept_Id, D.Dept_Name, Count(St_Id) as NumberOfStudents
from Student S, Department D
where D.Dept_Id = S.Dept_Id
group by S.Dept_Id , D.Dept_Name
having Count(St_Id) > 3


-- You Can't Use Agg Functions Inside Where Clause (Not Valid)
-- Because Aggreagate Generate Groups That 'Having' Works With it
-- Where Works With Rows => in order to Make Filteration
select Sum(Salary)
from Instructor
where count(Ins_Id) < 100 -- Not Valid

-- You Can Use Having Without Group By Only In Case Of Selecting Just Agg Functions
select Sum(Salary)
from Instructor
having count(*) < 100 -- Valid

select Sum(Salary),count(Ins_Id)
from Instructor
having count(Ins_Id) < 100 -- Valid

-- Get Sum Salary of Instructors For Each  [Which has more than 3 Instructors]
select Dept_Id, Sum(Salary) as SumOfSalary
from Instructor
having Count(Ins_Id) > 3 -- not valid , if U select any data must use group by

select Dept_Id, Sum(Salary) as SumOfSalary
from Instructor
group by Dept_Id
having Count(Ins_Id) > 3

-- Group By With Self Join
select Super.St_FName, Count(Stud.St_Id)
from Student Stud, Student Super
where Super.St_Id = Stud.St_Super
group by Super.St_FName  
-- ther is an issue beacuse there are two supervisor thier name is Ahmed
-- To solve that , we add a column primary key as super ID
select Super.St_Id, Super.St_FName, Count(Stud.St_Id)
from Student Stud, Student Super
where Super.St_Id = Stud.St_Super
group by Super.St_Id, Super.St_FName 

------------------------------------------------------------
---------------------- 2. Null Functions -------------------

------- 1. IsNull (   ,   )
select st_Fname
from Student

select st_Fname
from Student
where St_Fname is not null

select isnull(st_Fname, '')
from Student

select isnull(st_Fname, 'No Data')
from Student

select isnull(st_Fname, St_Lname)
from Student

select isnull(st_Fname, isnull(St_Lname, 'No Data')) as NewName
from Student

------- 2. Coalesce
-- The COALESCE() function returns the first non-null value in a list.
select coalesce(st_Fname, St_Lname, St_Address, 'No Data')
from Student


---------------------------------------------------------
---------------------- 3. Casting Functions -------------

select St_Fname +' '+ St_Age
from student  -- Not Valid

------- 1. Convert [Convert From Any DateType To DateType]
select St_Fname +' '+ Convert(varchar(2), St_Age)
from student

select 'Student Name= ' + St_Fname + ' & Age= '+ Convert(varchar(2), St_Age)
from student -- if St_Fname is null the result = null

select 'Student Name= ' + IsNull(St_Fname,'')+' '+ Convert(varchar(2), IsNull(St_Age, 0))
from student

-- Concat => Convert All Values To String Even If Null Values (Empty String)
select Concat('Student Name= ', St_Fname,' & Age= ', St_Age)
from student


------- 2. Cast [Convert From Any DateType To DateType]
--
select St_Fname +' '+ Convert(varchar(2), St_Age)
from student
select St_Fname +' '+ cast(St_Age as varchar(2) )
from student
--
select getdate() -- DATE
--
select convert(varchar(50),getdate()) --string
-- or
select cast(getdate() as varchar(50)) --string

-- vip
-- Convert --> Take Third Parameter If You Casting From Date To String
-- For Specifying The Date Format You Need
select convert(varchar(50),getdate(),101) -- 05/04/2024
select convert(varchar(50),getdate(),102) -- 2024.05.04
select convert(varchar(50),getdate(),110) -- 05-04-2024
select convert(varchar(50),getdate(),111) -- 2024/05/04

------- 3. Format [Convert From Date To String only]
 
select format(getdate(),'dd-MM-yyyy')				-- 04-05-2024
select format(getdate(),'dddd MMMM yyyy')			-- Saturday May 2024
select format(getdate(),'ddd MMM yy')				-- Sat May 24
select format(getdate(),'dd')						-- 04
select format(getdate(),'dddd')						-- Saturday
select format(getdate(),'dddd','ar')				-- السبت
select format(getdate(),'MMMM')						-- May
select format(getdate(),'hh:mm:ss')					-- 12:09:36
select format(getdate(),'tt')						-- PM
select format(getdate(),'hh')						-- 12	--12 hours
select format(getdate(),'HH')						-- 12	--24 hours
select format(getdate(),'hh tt')					-- 12 PM
select format(getdate(),'dd MM yyyy hh:mm:ss')		-- 04 05 2024 12:09:36
select format(getdate(),'dd MM yyyy hh:mm:ss tt')	-- 04 05 2024 12:09:36 PM
-- convert string to DATE
select convert(Date,'11/1/1998')					-- 1998-11-01
select format(convert(Date,'11/1/1998'),'dddd')		-- Sunday

-- Note : format return string
---------------------------------------------------------
------------------- 4. DateTime Functions ---------------

select getdate()						 -- 2024-05-04 12:16:02.870
select day(getdate())					 -- 4							-- Note : return int
select Month(getdate())					 -- 5							-- Note : return int
select year(getdate())					 -- 2024						-- Note : return int
select eomonth(getdate())				 -- 2024-05-31					-- Note : return date
select eomonth('1/1/2000')				 -- 2000-01-31
select format(eomonth(getdate()),'dd')	 -- 31
select format(eomonth(getdate()),'ddd')	 -- Fri
select format(eomonth(getdate()),'dddd') -- Friday

---------------------------------------------------------
------------------- 5. String Functions -----------------

select lower(st_fname),upper(st_lname)
from Student

select st_fname, len(st_fname)
from Student

select substring(st_fname,2,5)
from Student
-- start from the second letter and get 5 letters

---------------------------------------------------------
--------------------- 6. Math Functions -----------------

select power(2,2)


-- log sin cos tan

---------------------------------------------------------
--------------------- 7. System Functions ---------------

select db_name()

select suser_name()

select @@ServerName