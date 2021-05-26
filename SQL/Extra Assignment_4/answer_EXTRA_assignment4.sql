-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT	 E.Employee_Name
FROM 	Employee_Skill_Table ES
JOIN 	Employee_Table E ON E.Employee_Number = ES.Employee_Number
WHERE	ES.Skill_Number = 1;
 -- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >2 nhân viên
 SELECT	 D.Department_Name
FROM 	department D
JOIN 	Employee_Table E ON E.Department_Number = D.Department_Number
GROUP BY E.Department_Number
HAVING	COUNT(E.Department_Number) > 2;
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban. 
SELECT	 D.Department_Name, E.Employee_Name
FROM 	 department D
LEFT JOIN 	Employee_Table E ON E.Department_Number = D.Department_Number
GROUP BY E.Department_Number, E.Employee_Number
ORDER BY D.Department_Name ASC;
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
 SELECT	 E.Employee_Number,E.Employee_Name, COUNT(ES.Employee_Number)AS so_skills
FROM 	 Employee_Skill_Table ES
JOIN 	Employee_Table E ON E.Employee_Number = ES.Employee_Number
GROUP BY ES.Employee_Number
HAVING	COUNT(ES.Employee_Number) > 1;