----------------------------- Index -------- -------------------
create clustered index myindex
on student(st_fname) -- Not Valid [Table already has a clustered index on PK]


create nonclustered index myindex
on student(st_fname)

create nonclustered index myindex2
on student(dept_id)

---------------------------------------------------------------- 

-- Primary Key --->  uniqe + Not Null				--- Constraint   ---> Clustered Index

-- Unique Key  --->  uniqe + only one value = Null	--- Constraint   ---> Nonclustered Index

create table test
(
 X int primary key,
 Y int unique,
 Z int unique
)

create unique index i3
on student(st_age)

-- This Query Will Make 2 Things If There is No Repeated Values on st_age
-- 1. Make Unique Constraint On St_Age 
-- 2. Make Non-Clustered Index On St_Age


-- Clustered Index                   Vs      Nonclustered Index
-- Just One							...      Many Up To 999
-- Last Level Is The Actual Data	...      PreLast Level Is Pointer To Actual Data
-- Faster							...	     Slower
-- PK => Clustered					...      Unique => Nonclustered


-- How Can I Select The Columns To Make Indexes On It?
-- 1. Analysis
-- 2. Testing (Using SQL Server Profiler and Tuning Advisor)
