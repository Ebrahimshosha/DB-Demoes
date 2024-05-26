
-------------------			DML => Data Manpulation Language		---------------------

-- DML : works with Data

-- 1. Insert

--------- 1.1 Simple Insert (Add Just Only One Row)

Insert Into Employee
Values('Ahmed', 'Nasr', 'Alex', 8000, 'M', '02-22-2003', Null, Null)

Insert Into Employee(Salary, FName, BDate, Gender)
Values(4000, 'Mohamed', '03-22-1999', 'M')

-- columns don't insert in it values must be one of next :
	-- 1. Identity Constraint
	-- 2. Default Value
	-- 3. Allow Null


--------- 1.2 Row Constructor Insert (Add More Than One Row)


Insert Into Employee
Values
('Mona', 'Nasr', 'Cairo',  8000, 'F','02-22-1963', 1, Null),
('Amr', 'Ibrahim', 'Tanta', 8000,'M', '02-22-1963',  1, Null),
('Aya', 'Ali','Giza',  8000,'F', '02-22-1963',  1, Null),
('Mohamed', 'Amr', 'Mansoura',8000,'M', '02-22-1963',   1, Null)



-- 2. Update

Update Employee
	Set Address = 'Dokki'
	where SSN = 1

Update Employee
	Set FName = 'Hamda', LName = 'Hambozo'
	where SSN = 2

Update Employee
	Set Salary += Salary * .1
	where Salary <= 5000 and Address = 'Cairo'


-- 3. Delete

Delete From Employee  -- delet all rows in table


Delete From Employee
	Where SSN = 9
