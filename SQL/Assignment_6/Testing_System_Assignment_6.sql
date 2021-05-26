-- CREATE Procedure
DROP PROCEDURE IF EXISTS getQuestionByInputCreator ;
DELIMITER $$
	CREATE PROCEDURE getQuestionByInputCreator( IN in_Creator_UserName VARCHAR(50)) 
		BEGIN
			SELECT 	q.QuestionID, q.Content, q.CreatorID, a.FullName
            FROM 	Question q
            JOIN 	`Account` a ON a.AccountID = q.CreatorID
            WHERE 	a.FullName =  (in_Creator_UserName);
		END $$
DELIMITER ;

-- Using Procedure
call testingsystem3.getQuestionByInputCreator('Verna Kiernan');

-- ---------------------------------------------

DROP PROCEDURE IF EXISTS getQuestionByInputCreator ;
DELIMITER $$
	CREATE PROCEDURE getQuestionByInputCreator( OUT out_question_id MEDIUMINT UNSIGNED) 
		BEGIN
			SELECT 	q.QuestionID   INTO out_question_id
            FROM 	Question q
            JOIN 	`Account` a ON a.AccountID = q.CreatorID
            WHERE 	a.FullName = 'Lyman Goodge'; -- Lyman Goodge -- chi tra out ra 1 gia tri, ra 2 gia tri laf bi loi vi pham ???
		END $$
DELIMITER ;

-- Using Procedure
SET @x = 0;
CALL getQuestionByInputCreator(@x);
SELECT @x;
SELECT 	*
FROM 	Question 
WHERE 	QuestionID = @x; -- lam sao de duoc 2 gia tri???

-- Question 0: Tạo store để người dùng nhập vào ID phòng ban và in ra ten phong ban

DROP PROCEDURE IF EXISTS get_deparmentName_inputdeparment_ID;
DELIMITER $$
CREATE PROCEDURE get_deparmentName_inputdeparment_ID (IN in_department_id MEDIUMINT UNSIGNED)
BEGIN 
	SELECT departmentName FROM department WHERE departmentID = in_department_id;
END $$
DELIMITER ;


-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DELIMITER $$
	DROP PROCEDURE IF EXISTS get_Account_by_Input_Department;
	CREATE PROCEDURE get_Account_by_Input_Department (IN in_department_Name VARCHAR(30))
		BEGIN 
			SELECT a.AccountID, a.Username, a.FullName, d.DepartmentName
			FROM `account` a 
			JOIN department d  ON d.DepartmentID = a.DepartmentID
            WHERE 	d.DepartmentName =  (in_department_Name);
        END $$
DELIMITER ;
-- using
call testingsystem3.get_Account_by_Input_Department('Services');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DELIMITER $$
DROP PROCEDURE IF EXISTS get_Count_Account_by_Input_Group;
CREATE PROCEDURE get_Count_Account_by_Input_Group (IN in_Input_Group MEDIUMINT UNSIGNED)
	BEGIN
		SELECT GroupID, COUNT(AccountID) AS `So_luong_account_trong_moi_group`
		FROM GroupAccount 
        WHERE GroupID = in_Input_Group
		GROUP BY  GroupID;
    END $$
DELIMITER ;

-- using
call testingsystem3.get_Count_Account_by_Input_Group(10);

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo  trong tháng hiện tại
DELIMITER $$
DROP PROCEDURE IF EXISTS get_Question_by_type_question;
CREATE PROCEDURE get_Question_by_type_question (IN in_type_question MEDIUMINT UNSIGNED)
	BEGIN
		SELECT 		TypeID, COUNT(TypeID) AS `So_luong_question_trong_moi_type_question`
		FROM 		Question 
        WHERE 		month(CreateDate)= month(NOW())
        GROUP BY 	TypeID
        HAVING 		TypeID = (in_type_question);
    END $$
DELIMITER ;
-- using 
call testingsystem3.get_Question_by_type_question(1);

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS get_Max_Question_by_type_question;
DELIMITER $$
CREATE PROCEDURE get_Max_Question_by_type_question (OUT out_type_question_id MEDIUMINT UNSIGNED)
	BEGIN
		SELECT 		TypeID   INTO out_type_question_id
		FROM 		Question  	
		GROUP BY 	TypeID
		HAVING		COUNT(TypeID) = (SELECT MAX(COUNTT)
											  FROM 		(SELECT 	COUNT(TypeID) AS COUNTT
														 FROM 		Question 
														 GROUP BY 	TypeID) AS MaxQuestion);
    END $$
DELIMITER ;

-- using 
SET @Type_ID = 0;
CALL get_Max_Question_by_type_question(@Type_ID);
SELECT @Type_ID;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
SELECT TypeName
FROM  typequestion 
WHERE 	@Type_ID=TypeID;
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa 
-- chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS sp_get_name_or_group;
DELIMITER $$
CREATE PROCEDURE sp_get_name_or_group
( IN nhap_chuoi VARCHAR(50))
	BEGIN
		SELECT  g.GroupName
		FROM 	`Group` g
		WHERE 	g.GroupName  LIKE CONCAT("%", nhap_chuoi, "%") --  hàm concat để nối chuỗi, các chuỗi con cách nhau bởi dấu ,
	UNION 
		SELECT a.UserName
		FROM `Account` a 
		WHERE a.UserName LIKE CONCAT ( "%", nhap_chuoi,"%");
	END $$
DELIMITER ;
-- using
call testingsystem3.sp_get_name_or_group('si');
 
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và  trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi positionID: sẽ có default là developer departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

DROP PROCEDURE IF EXISTS insert_fullName_by_Email;
DELIMITER $$
CREATE PROCEDURE insert_fullName_by_Email
( IN var_Email VARCHAR(50), IN var_Fullname VARCHAR(50))
BEGIN
	DECLARE v_username VARCHAR(50) DEFAULT substring_index(var_Email,'@',1);
    DECLARE v_positionID VARCHAR(50) DEFAULT 1;
    DECLARE v_departmentID VARCHAR(50) DEFAULT 11;
    DECLARE v_CreateDate DATETIME DEFAULT now();
    INSERT INTO `Account` (`Email`, `Username`, `FullName`,`DepartmentID`, `PositionID`, `CreateDate`)
    VALUES (var_Email, v_Username, var_Fullname, v_DepartmentID, v_PositionID, v_CreateDate);
END$$

Call insert_Account_by_Email('minhducjojo1999@gmail.com','Minh Duc');

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice 
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất ???

DROP PROCEDURE IF EXISTS get_Question_by_type_question_name;
DELIMITER $$
CREATE PROCEDURE get_Question_by_type_question_name (IN in_type_question_name ENUM('Essay','Multiple-Choice'))
	BEGIN
			DECLARE v_typeID TINYINT UNSIGNED;
            SELECT typeID INTO v_typeID
            FROM typequestion 
            WHERE TypeName = in_type_question_name; 
            
            WITH Cte_lengthcontent AS(
            SELECT length(Content) AS leng
            FROM Question 
            WHERE  TypeID = v_typeID
            )
            SELECT *, Length(Content)
            FROM Question 
            WHERE  Length(Content) = (SELECT MAX(leng)
									  FROM Cte_lengthcontent);
            
    END $$
DELIMITER ;
-- using 
call testingsystem3.get_Question_by_type_question_name('Essay');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS sp_Delete_Exam_WithID;
DELIMITER $$
CREATE PROCEDURE sp_Delete_Exam_WithID (IN in_ExamID TINYINT UNSIGNED)
BEGIN
-- Bảng Exam có liên kết khóa ngoại đến bảng examquestion vì vậy trước khi xóa dữ liệu trong
-- bảng exam cần xóa dữ liệu trong bảng examquestion trước hoặc sử dụng ON DELETE CASCADE
		DELETE FROM examquestion WHERE ExamID = in_ExamID;
		DELETE FROM Exam WHERE ExamID = in_ExamID;
END$$
DELIMITER ;
CALL sp_Delete_Exam_WithID(7);

-- -- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
DROP PROCEDURE IF EXISTS Delete_department_input_departmentName;
DELIMITER $$
CREATE PROCEDURE  Delete_department_input_departmentName ( IN in_department_Name varchar(50))
	BEGIN
    
		DECLARE v_DepartmentID TINYINT;
        SELECT DepartmentID INTO v_DepartmentID
        FROM Department 
        WHERE DepartmentName = in_department_Name; 
        
        UPDATE `Account`
        SET DepartmentID = 11 
        WHERE DepartmentID = v_DepartmentID;
        
        DELETE 
        FROM Department 
        WHERE DepartmentName = in_department_Name;        
    END $$
DELIMITER ;
-- Using
call testingsystem3.Delete_department_input_departmentName('Business Development');
-- Kiem tra so luong nhan vien vao phong cho 
SELECT A.AccountID,  A.FullName, D.DepartmentName, COUNT(D.DepartmentName)
FROM `Account` A 
JOIN Department  D ON D.DepartmentID = A.DepartmentID
WHERE A.DepartmentID = 11;




    