
--------------------------- Transaction -------------------------

-- 1. Implicit Transaction (DML Query [Insert, Update, Delete])

Insert Into Student(St_Id, St_Fname)
Values (100, 'Ahmed'), (101, 'Amr')

Update Student
	set St_Age = 30 
	where St_Age = 20


-- 2. Explicit Transaction (Set Of Implicit Transactions)

create table Parent (
						ParentId int primary key
					)

insert into Parent values(1)
insert into Parent values(2)
insert into Parent values(3)

create table Child (
						ChildId int primary key,
						ParentId_FK int references Parent(ParentId) on delete cascade
					)
----------------------------------------------------------

insert into Child values(1, 1)
insert into Child values(2, 10) -- Error
insert into Child values(3, 2)

-- Will insert 1,3 only 
------------------------------------------------------------

begin transaction
insert into Child values(4, 1)
insert into Child values(5, 10)  -- Error
insert into Child values(6, 2)
commit tran

-- Will insert 4,6 only 

------------------------------------------------------------

begin transaction
insert into Child values(7, 1)
insert into Child values(8, 10) -- Error
insert into Child values(9, 2)
rollback tran

-- Will not insert any row
-----------------------------------------------------------
begin try
	begin transaction
		insert into Child values(7, 1)
		insert into Child values(8, 2)
		insert into Child values(9, 10) -- Error
		insert into Child values(10, 3)
	commit tran
end try
begin catch
	rollback tran 
end catch

-- Will not insert any row

------------------------------------------------------------

begin try
	begin transaction
		insert into Child values(11, 1)
		save transaction p01
		insert into Child values(12, 2)
		insert into Child values(13, 10) -- Error
		insert into Child values(14, 3)
	commit tran
end try
begin catch
	rollback tran p01
end catch

-- insert only 11


