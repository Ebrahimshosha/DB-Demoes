
------------------- Ranking Function -----------------------

-- 1. Row_Number()
-- 2. Dense_Rank()
-- 3. Rank()
-- 4.NTile

select Ins_Name, Salary,
	Row_Number() over (Order by Salary desc) as RNumber,
	Dense_Rank() over (Order by Salary desc) as DRank,
	Rank()       over (Order by Salary desc) as R
from Instructor


-- 1. Get The 2 Older Students at Students Table

-- Using Ranking (not Recommended in this prolem) beeacuse there is subquery
select *
from (select St_Fname, St_Age, Dept_Id,
		Row_number() over(order by St_Age desc) as RN
	from Student) as newtable
where RN <= 2

-- Using Top [Best practise]
Select top(2) St_Fname, St_Age, Dept_Id
from Student
Order By St_Age Desc

-- 2. Get The 2th Younger Student 

-- Using Ranking 
select * from 
(select St_Fname, St_Age, Dept_Id,
		row_number() over(order by St_age ) as RN		
		from Student where St_Age is not null) as newtable
where RN = 2

-- Using Top 
select top(1)* from
(select top(5)*
from Student
order by St_Age desc) as newTable
order by St_Age

-- 2. Get The Younger Student At Each Department
select Dept_Id,min(St_Age)
from student 
group by Dept_Id
-- note : we need to return the employyee him self but in group by return the value only

-- Using Ranking Only
select * from 
(select Dept_Id, St_Fname, St_Age, 
		row_number() over(partition by Dept_id order by St_age ) as RN
from Student where St_Age is not null) as newtable
where RN = 1  



-- 4.NTile

-- We Have 15 Instructors, and We Need to Get The 5th Instructors Who Take the lowest salary
select *
from
(
select Ins_Name, Salary, Ntile(3) over(order by Salary) as G
from Instructor
) as newTable
where G = 1
