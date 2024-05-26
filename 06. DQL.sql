

use Route

-----------------		 DQL => Data Query Language			------------------------
-- DQL : select == Dispaly Data

-- select -> just for display

select *
from Student

select St_Fname +' '+ St_Lname FullName
from Student

select St_Fname +' '+ St_Lname  [Full Name]
from Student

select [Full Name] = St_Fname +' '+ St_Lname  
from Student


select * 
from Student
where St_Age > 23

select * 
from Student
where St_Age > 21 and St_Age < 25
 
select * 
from Student
where St_Age between 21 and 25

select *
from Student
where St_Address ='Alex' or St_Address = 'Mansoura' or St_Address = 'Cairo'

select *
from Student
where St_Address in ('Alex', 'Mansoura', 'Cairo')


select *
from Student
where St_Address not in ('Alex', 'Mansoura', 'Cairo')

Select * 
from Student
where St_super is Null

Select * 
from Student
where St_super is not Null