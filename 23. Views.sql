---------------------- Views --------------------------------

/*

if you want to get the same result set, you can save this query into a text file, open it, and execute it again.

SQL Server provides a better way to save this query in the database catalog through a view.

A view is a named query stored in the database catalog that allows you to refer to it later

*/

-- Table : physical table (exists in hardDisk) 
-- View  : Virtual  table (not exists in hardDisk) [Saved Query] [Select Statement]

-- Body in View always select statement

/*

Advantages of views :

1. Security (Hide meta data)
You can restrict users to access directly to a table and allow them to access a subset of data via views.

For example, you can allow users to access customer name, phone, email via a view but restrict them to access the bank account and other sensitive information.

2. Simplicity
A relational database may have many tables with complex relationships e.g., one-to-one and one-to-many that make it difficult to navigate.

However, you can simplify the complex queries with joins and conditions using a set of views.

3. Consistency
Sometimes, you need to write a complex formula or logic in every query.

To make it consistent, you can hide the complex queries logic and calculations in views.

Once views are defined, you can reference the logic from the views rather than rewriting it in separate queries.

4. Limit Access of Data

*/
-- 1. Standard View (Contains Just Only One Select Statement)

GO
Create View AlexStudentsView
as
	Select St_Id, St_FName, St_Address
	from Student
	Where St_Address = 'Alex'
GO

--  you can reference to the view in the SELECT statement like a table as follows:
Select * from AlexStudentsView

-----

GO
Create or alter View CairoStudentsView
as
	Select St_Id, St_FName, St_Address
	from Student
	Where St_Address = 'Cairo'
GO


Select * from CairoStudentsView

---------------------------------------------------------------
-- 2. Partitioned View (Contains More Than One Select Statement)
GO
Create View CairoAlexStudentsView
as
	Select * from CairoStudentsView
	Union
	Select * from AlexStudentsView
GO

Select * from CairoAlexStudentsView

----
GO
create schema HR
GO

Alter Schema HR
Transfer dbo.CairoAlexStudentsView


select * from HR.CairoAlexStudentsView


GO
Create or alter View StudentDepartmentDataView(StdId, StdName, DeptId, DeptName)
With Encryption
as
	Select St_Id, St_FName, D.Dept_Id, D.Dept_Name
	from Student S inner join Department D
	on D.Dept_Id = S.Dept_Id
GO

Select * from StudentDepartmentDataView

SP_HelpText 'StudentDepartmentDataView' 

-- SP_HelpText : displays the definition that is used to create an object in multiple rows So we use 'With Encryption'

GO
Create View StudentGradesView (StdName, CrsName, StdGrade)
With Encryption
as
	Select S.St_FName, C.Crs_Name, SC.Grade
	from Student S, Stud_Course SC, Course C
	where S.St_Id = SC.St_Id and C.Crs_Id = SC.Crs_Id
GO

Select * from StudentGradesView

---------------------------------------------------------
-- View + DML
-- View =>  One Table

-- To insert to view 
-- 1 : View must include Primary key of table
-- 2 : all required coulmns in table must be selected in the view

/*
Create View CairoStudentsView
as
	Select St_Id, St_FName, St_Address
	from StudentsView
	Where St_Address = 'Cairo'
*/

Insert Into CairoStudentsView
Values(105, 'Pola', 'Cairo')

update CairoStudentsView
set St_FName ='omar'
where St_Id = 1

delete from CairoStudentsView
where St_Id = 5

-- View  =>  Multi Table

GO
create or Alter View StudentDepartmentDataView(StdId, StdName, FK_DeptId, DeptId, DeptName)
With Encryption
as
	Select St_Id, St_FName, S.Dept_Id, D.Dept_Id, D.Dept_Name
	from Student S inner join Department D
	on D.Dept_Id = S.Dept_Id
GO

Select * from StudentDepartmentDataView

--- DELETE XXXXX
Delete From StudentDepartmentDataView
	Where StdId = 1

-- Insert Update
Insert Into StudentDepartmentDataView(StdId, StdName, FK_DeptId)
Values(9709, 'Ay 7aga', 1000)  -- not valid if there not FK_DeptId = 1000

Insert Into StudentDepartmentDataView(DeptId, DeptName)
Values(1000, 'Test')
-- you don"t insert to two table in one statement, U must select only table

Insert Into CairoStudentsView
Values(97397, 'Ronaldo', 'tanta')  -- valid but if U select * from CairoStudentsView this row don't appear 
								   -- To slove this issue [use Check Constraint]

Insert Into CairoStudentsView
Values(97397, 'Ronaldo', 'Cairo') -- valid

GO
Alter View CairoStudentsView
With Encryption
as
	Select St_Id, St_FName, St_Address
	from Student
	Where St_Address = 'Cairo' -- Make Check Constraint
	With Check Option
GO

Insert Into CairoStudentsView
Values(97397, 'Ronaldo', 'tanta') -- Not Valid