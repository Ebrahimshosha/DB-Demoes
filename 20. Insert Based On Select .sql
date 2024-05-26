-- Insert Based On Select
-- Take Just The Data Without Table Structure, 
-- but 2 tables must have same structure (Insert Based On Select)

select * into Newstudent
from student
where 1=2

Insert Into Newstudent
Select * from Dbo.student

create table StudentAddressAndAge
(
Address nvarchar (100),
age int
)

insert into StudentAddressAndAge
select st_Address,st_age
from student

