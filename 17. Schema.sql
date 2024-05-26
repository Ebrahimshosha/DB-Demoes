
---------------------------- Schema ---------------------

-- Schema Solved 3 Problems:
-- 1.You Can't Create 2 DB Objects With The Same Name
--	[Table, View, Index, Trigger, Stored Procedure, Rule]
-- 2. There Is No Logical Meaning (Logical Name)
-- 3. Permissions

-- DBO [Default Schema] => Database Owner

/*
select *
from ServerName.DBName.SchemaName.objectName
*/

select *
from Student

select *
from  [DESKTOP-LDHPFFI].iti.dbo.student


Create Schema HR



Alter Schema HR 
Transfer student


select * from Student  -- not valid

select * from Hr.Student -- valid

Alter Schema dbo
Transfer HR.student

drop Schema HR