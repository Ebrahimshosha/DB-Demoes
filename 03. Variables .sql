
--------------------------- Variables ----------------------------

-- Variables not case sensetive

-- 1. Global Variables
print @@Version
print @@ServerName

-- 2. Local Variables (user-Defined)
declare @age int = 3
set @age = 55
print @age

declare @name varchar(10) ='Ahmed'  --5
print @name
set @name = 'ahmedshosha'
print @name
set @name = 'ahmedshoshaaaaaaaaaaaaaaa'
print @name
