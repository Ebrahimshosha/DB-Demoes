
------------------------------------------------------
-- Union Family (union | union all | intersect | except)
-- Have 2 Conditions:
-- 1- The Same Datatype
-- 2- The Same Number Of Selected Columns

Select St_Id, St_FName from Student
-- except --intersect --union all --union
Select Ins_Id, Ins_Name from Instructor

-- Example (Select The Student Names At All Route Branches)

-- union     : combine the data from the result of two or more SELECT command queries into a single distinct result set.
--			   This operator removes any duplicates present in the results being combined

-- union all : combine result set of two or more SELECT queries.
--			   The UNION ALL operator does not remove duplicate rows from SELECT statement result set.

-- intersect : combines two select statements and returns only the dataset that is common in both the statements.

-- except	 : combine two SELECT statements and returns distinct rows from the first SELECT statement that are not available in the second SELECT statement.