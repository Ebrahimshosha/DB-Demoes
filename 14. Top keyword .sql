------------------------- Top keyword ----------------------------
-- TOP is SQL server keyword , not a function

-- First 5 Students From Table
select top(5)*
from  Student

select top(5)st_fname
from  student

-- Last 5 Students From Table
select top(5)*
from  student
order by st_id desc

-- Get The Maximum 2 Salaries From Instractors Table
select top(2)salary
from Instructor
order by Salary desc   -- retrieve row

-- Get The second Maximum Salary From Instractors Table
select Max(Salary)
from Instructor
where Salary <> (Select Max(Salary) from Instructor)  -- retrieve value
-- or
select top(1)* from 
(select top(2)*
from Instructor
order by Salary desc) as newTable
order by Salary 

-- Get The third Maximum Salary From Instractors Table
select top(1)* from 
(select top(3)*
from Instructor
order by Salary desc) as newTable
order by Salary

-- note : Top retrieve a row ,max retrieve a value


-- Top With Ties, Must Make Order by
select top(5) st_age
from student 
order by st_age desc

select top(5) with ties st_age
from student
order by st_age  desc


-- Randomly Select
-- when you have composite pk (more than 3) you should use GUID 
select newid()   -- Return GUID Value (Global Universal ID)  -- uniqe id in the server

select St_Fname, newid()
from Student

select top(3)*
from student
order by newid()  -- Randomly Select