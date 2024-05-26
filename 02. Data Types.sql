
--------------------------- Data Types ----------------------------

-------------------		1.Numeric Data Types		------------------
bit         -- Boolean Value 0[false]  : 1[true] 
tinyint		-- 1 Byte => -128:127		| 0:255 [Unsigned(Positive)]
smallint	-- 2 Byte => -32768:32767	| 0:65555 [Unsigned] 
int			-- 4 Byte 
bigint		-- 8 Byte


-------------------		2.Fractions Data Types		------------------
smallmoney	4B .0000             -- 4 Numbers After Point
money		8B .0000             -- 4 Numbers After Point 
real		8B .0000000          -- 7 Numbers After Point
float		8B .000000000000000  -- 15 Numbers After Point
dec			-- Datatype and Make Valiadtion at The Same Time => Recommended
dec(5, 2) 124.22	18.1 XXX	12.2212 XXX


-------------------		3.String Data Types		------------------
char(10)		[Fixed Length Character]	Ahmed take from memory 10 byte,	Ali take from memory 10 byte	* Only English Data
varchar(10)		[Variable Length Character]	Ahmed take from memory 5  byte,	Ali take from memory 3 byte		* Only English Data
varchar(max)																								* Only English Data
nchar(10)		[like char(),	 But With UniCode]    على take from memory 10 byte						    * All Language Data 
nvarchar(10)	[like varchar(), But With UniCode]    على take from memory  3 byte							* All Language Data 
nvarchar(max)	[Up to 2GB]																					* All Language Data 

--> varchar is beeter than char

-------------------		 4.DateTime Data Types-------------------		
Date			MM/dd/yyyy
Time			hh:mm:ss.123 --Defualt=> Time(3)
Time(5)			hh:mm:ss.12345
smalldatetime	MM/dd/yyyy hh:mm:00
datetime		MM/dd/yyyy hh:mm:ss.123
datetime2(4)	MM/dd/yyyy hh:mm:ss.1234
datetimeoffset	11/23/2020 10:30 +2:00 Timezone

-------------------		5. Binary Data Types-------------------		
binary 01110011 11110000
image

-------------------		 6. Other Data Types-------------------		
Xml
sql_variant -- Like Var In Javascript