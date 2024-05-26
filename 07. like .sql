
-- like With Some Patterns
/*
 _  => one Char
 %  => Zero or More Chars 

*/ 

select *
from Student
where St_Fname like '_A%' -- Na Fady Kamel Hassan Nada Nadia 

/*

'a%h'        ah aghjklh
'%a_'        ak hjkak
'[ahm]%'     start with a or h or m -> amr hassan mohamed 
'[^ahm]%'    not start with any this character
'[a-h]%'     - means range a to h
'[^a-h]%'    not in this range a to h
'[346]%'     start with 3 or 4 or 6
'%[%]'       ghjkl%
'%[_]%'      Ahmed_Ali
'[_]%[_]'   _Ahmed_

*/
select *
from Employee
where FName like '[_]A%'   -- _Ahmed
