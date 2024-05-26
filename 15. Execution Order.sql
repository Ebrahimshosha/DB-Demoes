-- Execution Order
Select CONCAT(St_FName, ' ', St_Lname) as FullName
from Student
Where FullName = 'Ahmed Hassan' -- Not Valid


Select CONCAT(St_FName, ' ', St_Lname) as FullName
from Student
Where CONCAT(St_FName, ' ', St_Lname) = 'Ahmed Hassan' --valid but it is not perfect

Select *
from  (Select CONCAT(St_FName, ' ', St_Lname) as FullName
	   from Student) as Newtable
Where FullName = 'Ahmed Hassan'

Select CONCAT(St_FName, ' ', St_Lname) as FullName
from Student
Order By FullName


--execution order
----from
----join
----on
----where 
----group by
----having
----select
----order by
----top