
------------------------ Delete Vs Truncate -----------------------

Delete From Student  ---> the deleted data will be in LDF  ---> log file  --> soft delete
					 ---> Gaps in identity

Truncate Table Student  --> hard delete --> faster than delete
						--> all data is deleted
						--> reset identity
drop table student

