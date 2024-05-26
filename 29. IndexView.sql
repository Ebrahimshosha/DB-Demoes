-----------------------------     IndexedView     --------------------------
Create View IndexedView
With Encryption 
As
	Select S.St_Id, S.St_FName, D.Dept_Id, D.Dept_Name
	from dbo.Student S, dbo.Department D
	Where D.Dept_Id = S.Dept_Id

-- if U drop Student table, Department table Engine will excute and this is the problem because the table in a view
-- But If used 'SchemaBinding' with view and tried drop Student table, Department table-> Engine will don't drop tables


Create View StudentsDepartmentView
With SchemaBinding, Encryption
As
	Select S.St_Id, S.St_FName, D.Dept_Id, D.Dept_Name
	from dbo.Student S, dbo.Department D
	Where D.Dept_Id = S.Dept_Id

-- Advantage of SchemaBinding :
-- 1-  prevent any inadvertent modifications to the objects
-- 2- SQL Server optimizer does'nt check on Meta data

Create unique clustered Index IX_View
On StudentsDepartmentView(St_Id)

-- IndexedView works with only 'SchemaBinding'
