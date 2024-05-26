
------------------------ Stored Procedure -------------------------
-- Benefits Of SP:
-- 1. Performance
-- 2. Security (Hide Meta Data)
-- 3. Network Wise 
-- 4. Hide Business Rules
-- 5. Handle Errors (SP Contain DML)
-- 6. Accept Input And Out Parameteres => Make It More Flexbile 


Create Procedure SP_GetStudentById @StdId int
as
	Select *
	from Student
	Where St_Id =  @StdId

	SP_GetStudentById 1

	declare @X  int = 1 
	exec SP_GetStudentById @X

create schema HR

alter schema HR 
transfer SP_GetStudentById

HR.SP_GetStudentById 1

declare @X  int = 1 
exec SP_GetStudentById @X

------------------------- Error Handling -----------------------------

Delete From Topic
	Where Top_Id = 1
	-- output : The DELETE statement conflicted with the REFERENCE constraint "FK_Course_Topic".
	--			The conflict occurred in database "ITI", table "dbo.Course", column 'Top_Id'.
	-- if a hacker sees that erros he knew DB name and  this represents a risk because he can do an sql injection and drop DB
	-- So we can Handle error with Stored Procedures

go
create or Alter Proc SP_DeleteTopicById @TopicId int
With Encryption
as
	Begin Try
		Delete From Topic
		Where Top_Id = @TopicId
	End Try 
	Begin Catch
		Select 'Error'			-- Error
		select @@error			-- 547
		select error_message()  -- The DELETE statement conflicted with the REFERENCE constraint "FK_Course_Topic". The conflict occurred in database "ITI", table "dbo.Course", column 'Top_Id'.
	End Catch

SP_DeleteTopicById 1

Sp_HelpText 'SP_DeleteTopicById'

------------------ Input Parameters ------------------------
go
create or Alter Procedure SP_SumData @X int = 2, @Y varchar(10) = '8'
as
	Select @X + @Y

SP_SumData 3,7			-- Passing Parameters by Position -- 10
SP_SumData @y=7,@x=3    -- Passing Parameters by name     -- 10
SP_SumData 6			-- Default Values				  -- 14
SP_SumData				-- Default Values				  -- 10

-------------------- Dynamic Query -------------------------
go
Create OR Alter Proc SP_GetData @TableName varchar(20), @ColumName varchar(20)
With Encryption
As
	--Select @ColumName from @TableName
	execute('Select ' +  @ColumName + ' From ' + @TableName)

SP_GetData 'Department', '*'


------------------------------- Insert Based On Execute  ------------------------
go
Create Proc SP_GetStudentByAddress @StdAddress varchar(20)
With Encryption
As
	Select St_Id, St_FName, St_Address
	From Student
	Where St_Address = @StdAddress
go
	SP_GetStudentByAddress 'Alex'

go
Create Table StudentsWithAddresss
(
StdId int Primary Key,
StdName varchar(20),
StdAddress varchar(20)
)

-- Insert Based On Execute
Insert Into StudentsWithAddresss
exec SP_GetStudentByAddress 'Alex'


---------------------------------------
-- Return Of SP

go
Create Proc SP_GetStudentNameAndAgeById @StdId int , @StdName varchar(20) output, @StdAge int output
With Encryption
As
	Select @StdName = St_FName, @StdAge = St_Age -- [Output]
	from Student
	Where St_Id = @StdId -- 10 [Input]

	declare @StudentName varchar(20), @Age int 
	exec SP_GetStudentNameAndAgeById 1, @StudentName output, @Age output 
	Select @StudentName, @Age



-- Input Output Parameter
go
Create Proc SP_GetStudentNameAndAgeByIdV02 @Data int output, @Name varchar(20) output
With Encryption
As
	Select @Name = St_FName, @Data = St_Age -- [Output]
	from Student
	Where St_Id = @Data -- 10 [Input]

	declare @StudentName varchar(20), @Data int = 10
	exec SP_GetStudentNameAndAgeByIdV02 @Data output, @StudentName output
	Select @StudentName, @Data