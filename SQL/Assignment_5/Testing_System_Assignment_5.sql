-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
-- Cach 1: 
DROP VIEW IF EXISTS `list of sales staff` ;
CREATE VIEW `list of sales staff`  AS
		SELECT A.Username, A.FullName, A.Email
		FROM `Account` A
		JOIN Department D ON A.DepartmentID = D.DepartmentID
		WHERE D.DepartmentName = 'sale';
        
-- Cach 2: Subquery
DROP VIEW IF EXISTS `list of sales staff` ;
CREATE VIEW `list of sales staff`  AS
		SELECT A.Username, A.FullName, A.Email
		FROM `Account` A
		JOIN Department D ON A.DepartmentID = D.DepartmentID
		WHERE D.DepartmentID = ( SELECT D.DepartmentID
									FROM Department D 
                                    WHERE D.DepartmentName = 'sale');
        
SELECT *
FROM `list of sales staff`;


-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

-- Cach1: Subquery
DROP VIEW IF EXISTS `list of account` ;
CREATE VIEW `list of account`  AS 
		SELECT A.AccountID, A.Username, A.Email, COUNT(A.Username) AS Danh_sach_nhan_vien
		FROM  Groupaccount GA
		JOIN `Account` A ON GA.AccountID = A.AccountID
		GROUP BY A.Username
		HAVING COUNT(A.Username) = ( SELECT MAX(COUNTA)
										FROM 
												(SELECT 	COUNT(A.AccountID) AS COUNTA
												FROM 		Groupaccount GA
												JOIN  		`Account` A ON GA.AccountID = A.AccountID
												GROUP BY 	A.AccountID) AS MaxUsername) -- MaxUsername dung de lam gi 
                                                LIMIT 5
												;
 
SELECT *
FROM `list of account`;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 25 từ  được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS `Remove_long_content`;
CREATE VIEW `Remove_long_content`  AS (
           
	SELECT QuestionID,  LENGTH(Content) AS dem_so_chu 
    FROM Question
    WHERE LENGTH(Content) >= 25 
);
	DELETE
    FROM Question Q
    WHERE Q.QuestionID IN 	(SELECT a.QuestionID 
							 FROM `Remove_long_content` a) ;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS `List of departments`;
CREATE VIEW `List of departments`  AS 
SELECT D.*, COUNT(A.DepartmentID) AS Dach_sach_phong_ban_co_nhieu_nhan_vien_nhat
FROM 		`Account` A
JOIN 		Department D ON A.DepartmentID = D.DepartmentID
GROUP BY 	A.DepartmentID
HAVING  	COUNT(A.DepartmentID) IN (SELECT MAX(COUNTA)
									    FROM 
											( SELECT 		COUNT(A.DepartmentID) AS COUNTA
											  FROM  		`Account` A
											  JOIN   		Department D ON A.DepartmentID = D.DepartmentID
											  GROUP BY 		A.DepartmentID) AS MaxDepartmentName)
                                              ;

-- Cách 2: Làm bằng CTE 
WITH MAX_COUNT_DEPARTMENTID AS(
	SELECT MAX(COUNTA)
			FROM 
					( SELECT 		COUNT(A.DepartmentID) AS COUNTA
					  FROM  		`Account` A
					  JOIN   		Department D ON A.DepartmentID = D.DepartmentID
					  GROUP BY 		A.DepartmentID) AS MaxDepartmentName ),
COUNT_DEPARTMENTID AS (
		SELECT 		D.*, COUNT(A.DepartmentID) AS Dach_sach_phong_ban_co_nhieu_nhan_vien_nhat
		FROM 		`Account` A
		JOIN 		Department D ON A.DepartmentID = D.DepartmentID
		GROUP BY 	A.DepartmentID
		HAVING  	COUNT(A.DepartmentID))
        
        SELECT *
        FROM COUNT_DEPARTMENTID
        WHERE Dach_sach_phong_ban_co_nhieu_nhan_vien_nhat = ( 	SELECT *
																FROM MAX_COUNT_DEPARTMENTID);
															   
                                      
SELECT *
FROM `List of departments`;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
SELECT Q.QuestionID, Q.Content, A.FullName
FROM   Question Q
JOIN   `Account` A ON A.AccountID = Q.CreatorID
WHERE	SUBSTRING_INDEX(FullName,' ',1) LIKE '%Lyman%'; -- Nguoi tao khac voi nguoi trong account

										

    
                                    
         

