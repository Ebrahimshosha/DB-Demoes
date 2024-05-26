-- Types of SP
---- 1. User defined
			Sp_GetStudentNameById   SP_Getdata   SP_Sumdata
---- 2. Built-In SP
			Sp_helptext     Sp_Rename 
---- 3. Trigger (Special Stored Procedure)
----------- Can't Call
----------- Can't take parameters

--- Types of Triggers (Through Its Level)
---------- Server Level
---------- DB Level
---------- Table Level (Our Interest)
----------------- Actions In Table?(Insert   Update   Delete) [Events]
---------------------------------(Select Truncate) Not Logged In Log File

Create Trigger Tri01
on Student
after insert
as
	Select 'Welcome To Route'
--
	Insert Into Student(St_Id, St_FName)
	Values(23723, 'Amr')

---------------------------------------------------

create trigger Tri02
on student
after update 
as 
	select getdate(),suser_name()
--
	update student 
	set st_age = 22
	where st_id = 23723

--------------------------------

Create or alter Trigger Tri03
On Student
Instead of Delete
as
	Select 'U Can Not Delete From This Table' ,  suser_name()
--
	Delete From Student
		Where St_Id = 23723

-----------------------------------

create or Alter Trigger Tri04
on Department
instead of Delete, Insert, Update
as
	Select 'You Can Not Do Any Operation On This Table  ' + SUser_Name()
--
	Insert into Department(Dept_Id, Dept_Name)
	Values(8232, 'Test')

-- it is possible to define multiple triggers for a given table that have the same trigger event and action time.

---------------------------------------

-- Drop | Disable | Enable Trigger

Drop Trigger Tri04

Alter Table Department
Enable Trigger Tri04

Alter Table Department
disable Trigger Tri04


----------------------------------------------------
-- When You Write Trigger, You Must Write Its Schema (Except Default [dbo])
-- Trigger Take By Default The Schema Of Its Table In Creation
-- When You Change The Schema Of Table, All Its Triggers Will Follow

create schema DA

alter Schema DA
transfer [dbo].student

Alter trigger da.tri01
on DA.student
after insert
as
	Select 'Welcome To ITI'


--------------------------------------------
-- The Most Important Point Of Trigger 
-- 2 Tables: Inserted & Deleted Will Be Created With Each Fire Of Trigger
-- In Case Of Delete:  Deleted Table Will Contain Deleted Values
-- In Case Of Insert:  Inserted Table Will Contain Inserted Values
-- In Case Of Update:  Deleted Table Will Contain Old Values
--						Inserted Table Will Contain New Values		

-- Error (Have No Meaning Without Trigger): Just Created at Trigger RunTime 

Select * from inserted -- Error
select * from deleted  -- Error


-- With Trigger
create or alter trigger tri5
on course
after update
as
	Select * from inserted
	select * from deleted


update course
	set Crs_Name='Cloud'
	where crs_id=200

	-- inserted Table : 200	Cloud	       60	1
	-- Deleted  Table : 200	C Progamming   60	1

-----------------------------------------

Create or alter Trigger Tri06
on Course 
Instead OF Delete
as
	Select 'U Can Not Delete From This Table : ' + (Select Crs_Name from deleted)

Delete From Course	
	Where Crs_Id = 900

-------------------------------------------------
drop Trigger Tri03 -- beacuse Tri03 can conflict on Tri07

create or alter Trigger Tri07
on Student
Instead OF Delete
as
	if Format( GETDATE(), 'dddd') != 'wednesday'
		Delete From Student
			Where St_Id in (Select St_Id from deleted)
			
Delete from Student
	Where St_Id = 2222
	 