---------------------------------------------------------------
-- DDL [Create, Alter, Drop, Select Into]    
-- Create Physical Table

-- Select into : copy table (Structure With Data,constrain X , PK X, Realationship X) 
Select * into NewEmployees
From Dbo.Student


-- Create Just The Structure Without Data
Select * into NewInstructors
From Dbo.Instructor
Where 1 = 2