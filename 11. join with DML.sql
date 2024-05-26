
-------------		 Join + DML			-------------------

-- Update , delete, insert

-- Updates Grades Of Student Who 're Living in Cairo

select S.st_fname, S.St_Id ,St_Address, sc.grade
from Student S , Stud_Course SC
where S.St_Id = SC.St_Id and St_Address = 'cairo'   -- ANSI (EQI JOIN)

update SC
	set grade += 10
from Student S , Stud_Course SC
where S.St_Id = SC.St_Id and St_Address = 'cairo'

update SC
	set grade += 10
from Student S inner join Stud_Course SC
on  S.St_Id = SC.St_Id and St_Address = 'cairo'  -- MICROSOFT (INNER JOIN )

-- Self Study
-- Delete with join
-- Insert
----------------------------------------------------------
-- Delete With join
select s.St_Fname, s.st_address, sc.grade
from student s, Stud_Course sc
where S.St_Id = SC.St_Id  and S.St_Address = 'Cairo'

select s.St_Fname, s.st_address, sc.grade
from Student S inner join Stud_Course SC
on S.St_Id = SC.St_Id 
where S.St_Address = 'Cairo'

delete SC
from Student S inner join Stud_Course SC
on S.St_Id = SC.St_Id 
where S.St_Address = 'mansoura'	-- Delete With join

-- insert With join

insert into Stud_Course ( crs_id, St_Id, grade)
select 100,11,100
from Stud_Course sc inner join Student s
on S.St_Id = SC.St_Id 
where S.St_Id = 11  -- Not valid

insert into Stud_Course ( crs_id, St_Id, grade)
select 300,11,100
from  Student s
where S.St_Id = 11  --valid
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

-- update With join
update SC
	set grade += 10
from Student S , Stud_Course SC
where S.St_Id = SC.St_Id and St_Address = 'cairo'

