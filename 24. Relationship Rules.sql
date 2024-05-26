--------------------- Relationship Rules -----------------------------
--- 1. Delete Rule
--- 2. Update Rule

--- Before Delete Department No (40) With Its Instructors and Students
Delete From Department
	Where Dept_Id = 40 -- Error

-- Firstly, For Instructors
	-- 1. Transfer Instructors Of Department No (40) to another Department
			Update Instructor	
				Set Dept_Id = 10
				Where Dept_Id = 40
			
	-- or
	-- 2. Transfer Instructors Of Department No (40) To No Department (Null)
			Update Instructor	
				Set Dept_Id = Null
				Where Dept_Id = 40
			
	-- or
	-- 3. Delete Instructors Of Department No (40) 
			Delete From Instructor
				Where Dept_Id = 40

-- Secondly, For Students also The Same Idea
	-- 1. Transfer Student Of Department No (40) to another Department
	    	Update Student	
	    		Set Dept_Id = 10
	    		Where Dept_Id = 40
			
	-- or
	-- 2. Transfer Student Of Department No (40) To No Department (Null)
			Update Student	
				Set Dept_Id = Null
				Where Dept_Id = 40
			
	-- or
	-- 3. Delete Student Of Department No (40) 
			Delete From Student
				Where Dept_Id = 40

-- Now U can Delete Department No 40
Delete From Department
	Where Dept_Id = 40 -- valid