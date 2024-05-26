
---------------- User Defined Function ------------------

-- Any SQL Server Function must return value
-- Specify Type Of User Defined Function That U Want Based On The Type Of Return
-- User Defined Function Consist Of
--- 1. Signature (Name, Parameters, ReturnType)
--- 2. Body
-- Body Of Function Must be Select Statement Or Insert Based On Select
-- May Take Parameters Or Not
 
----------------------------------------------------------------------

-- 1. Scalar Fun (Return Just only One Value)


GO
Create Function GetStudentNameByStudentId(@StId int)
returns varchar(20) -- Function Signature
begin
	declare @StudentName varchar(20)
	Select @StudentName = St_FName
	from Student
	where St_Id = @StId
	return @StudentName
end
GO
     
Select	Dbo.GetStudentNameByStudentId(8)

-- any DB object exists in default schema (dbo)
-- when u call it don't write schema name(dbo) before object except when call function 
-- When calling functions you must write schema name before function even if (dbo) why ?!
-- because Db engine doesn't consider it a built-in function

-----------------------------------------------------

use CompanyCycle40

GO
Create Function GetDepartmentManagerNameByDepartmentName(@DeptName varchar(20))
Returns varchar(20) -- Function Signature
begin
	declare @MangerName varchar(20)
	Select @MangerName = E.FName
	From Employee E, Department D
	where E.SSN = D.MGRSSN and D.Name =  @DeptName
	return @MangerName
end
GO

Select	Dbo.GetDepartmentManagerNameByDepartmentName('DP2')




-- =================================================================
-- 2. Inline Table Function (Return Table)

GO
Create or alter Function GetDepartmenInstructorsByDepartmentId(@DeptId int)
Returns Table  -- Function Signature
as
	Return
	(
		Select Ins_Id, Ins_Name, Dept_Id
		from Instructor
		Where Dept_Id = @DeptId
	)
GO

Select * from dbo.GetDepartmenInstructorsByDepartmentId(20)

-- =================================================================
-- 3. Multistatment Table Fuction
--    => Return Table With Logic [Declare, If, While] Inside Its Body

GO
create Function GetStudentDataBasedPassedFormat(@Format varchar(20))
Returns @t table
		(
			StdId int,
			StdName varchar(20)
		)
With Encryption
as
	Begin
		if @format = 'first'
			Insert Into @t
			Select St_Id, St_FName
			from Student
		else if @format = 'last'
			Insert Into @t
			Select St_Id, St_LName
			from Student
		else if @format = 'full'
			Insert Into @t
			Select St_Id, Concat(St_FName, ' ', St_LName)
			from Student
		
		return 
	End
GO

select * from dbo.GetStudentDataBasedPassedFormat('fullname') -- return empty table
select * from dbo.GetStudentDataBasedPassedFormat	('FIRST')

