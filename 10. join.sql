
--------------------------- Joins -------------------------

-- 1. Cross join (Cartisian Product)

select S.St_Fname, D.Dept_Name
from Student S, Department D -- ANSI (Cartisian Product)

select S.St_Fname,  D.Dept_Name
from Student S Cross Join Department D -- Microsoft (Cross Join)

/*
	Cartisian Product (Cross Join)
	{A,B,C} * {X,Y} = AX AY BX BY CX CY
	{small,medium,large} * {red,blue} = [small red] [small blue] [medium red] [medium blue] [large red] [large blue]
*/

-- this type used in testing 

-- 2. Inner Join (Equi Join)

-- Equi Join Syntax (ANSI)
select S.St_Fname,  D.Dept_Name
from Student S, Department D
where D.Dept_Id = S.Dept_Id 

-- Inner Join Syntax (Microsoft)
select S.St_Fname, D.Dept_Name
from Student S inner join Department D
	on D.Dept_Id= S.Dept_Id

select S.St_Fname , D.*
from Student S, Department D
where D.Dept_Id = S.Dept_Id

-- Multi Table Join
-- Equi Join Syntax
select S.St_Fname, Crs_Name, Grade
from Student S, Stud_Course SC, Course C
where S.St_Id = SC.St_Id and C.Crs_Id = SC.Crs_Id


-- Multi Table Join
-- Inner Join Syntax
select S.St_Fname, C.Crs_Name, SC.Grade
from Student s inner join Stud_Course SC
on S.St_Id = SC.St_Id 
inner join Course C
on C.Crs_Id = SC.Crs_Id

Select St_fname,Crs_name,grade,dept_name
From Student S inner join Stud_Course SC
	on S.St_Id=SC.St_Id 
	inner join
	Course C
	on C.Crs_Id=SC.Crs_Id
	inner join
	Department D
	on d.Dept_Id=s.Dept_Id


-- 3. Outer Join
-- 3.1 Left Outer Join
select S.St_Fname, D.Dept_Name
from Student S left outer join Department D
	on D.Dept_Id= S.Dept_Id

-- 3.2 Right Outer Join
select S.St_Fname, D.Dept_Name
from Student S right outer join Department D
	on D.Dept_Id= S.Dept_Id

-- 3.3 Full Outer Join
select S.St_Fname, D.Dept_Name
from Student S full outer join Department D
	on D.Dept_Id = S.Dept_Id


-- 4. Self Join
select S.St_Fname as emplyee_name, Super.St_Fname as supervisor
from Student S , Student Super
where Super.St_Id = S.St_Super  -- ANSI (EQI JOIN)

select S.St_Fname as emplyee_name , Super.St_Fname as supervisor
from Student S inner join Student Super
on Super.St_Id = S.St_Super     -- MICROSOFT (INNER JOIN)



