
use route

-- Order By

select St_Id, St_Fname, St_Age
from Student
order by St_Fname, St_Age				-- order by St_Fname Asc then St_Age desc

select St_Id, St_Fname, St_Age
from Student
order by 1, 2							-- order by St_Id Asc then St_Fname Asc

select St_Id, St_Fname, St_Age
from Student
order by St_Fname, St_Age desc			-- order by St_Fname Asc then St_Age desc

select St_Id, St_Fname, St_Age
from Student
order by 1, 2 desc						-- order by St_Id Asc then St_Fname desc

select * from Student order by 1		-- order by first column in table Asc

select * from Student order by 5 desc   -- order by fifth column in table desc