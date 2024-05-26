
---------------------- Sub Query -----------------------------
-- Output Of Sub Query[Inner] As Input To Another Query[Outer]
-- SubQuery Is Very Slow (Not Recommended Except Some Cases)

/* 
select *
from student
where st_age > avg(st_age) => Not Valid
*/

select *
from student
where st_age > (select avg(st_age) from student) 

/*
select *, count(st_id)
from student => Not Valid
*/
select *,(select count(st_id) from student) as #studens --14
from student

-- VIP
-- SubQuery Vs Join

-- Get Departments Names That Have Students
select D.Dept_Name
from Department D inner join Student S
on D.Dept_Id = S.Dept_Id

select distinct D.Dept_Name
from Department D inner join Student S
on D.Dept_Id = S.Dept_Id

select dept_name
from Department
where Dept_Id in (	select distinct(Dept_Id)
					from Student
				) -- SubQuery with Join



----------------			Subquery   +   DML				--------------------------------

--Delete Students Grades Who Are Living in Cairo

-- Delete With join
Select s.St_Id, s.St_Address, sc.grade
from Student s, Stud_Course sc
where s.St_Id= sc.St_Id and St_Address = 'Cairo'

delete sc
from Student s, Stud_Course sc
where s.St_Id= sc.St_Id and St_Address = 'Cairo'

-- SubQuery With Delete

select distinct St_Id
from Stud_Course
where St_Id in (
				Select St_Id from Student 
				where St_Address = 'Cairo' )

delete from Stud_Course
where St_Id in (
				Select St_Id from Student 
				where St_Address = 'Cairo'
				)	


				---------------------------------------------------------------------------------------
-- Summary :

-- insert With join
insert into Stud_Course ( crs_id, St_Id, grade)
select 100,11,100
from  Student s
where S.St_Id = 11

-- Delete With join
delete SC
from Student S inner join Stud_Course SC
on S.St_Id = SC.St_Id 
where S.St_Address = 'mansoura'
