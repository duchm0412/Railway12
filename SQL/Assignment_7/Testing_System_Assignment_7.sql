-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

DROP TRIGGER IF EXISTS check_create_date_group;
DELIMITER $$
CREATE TRIGGER check_create_date_group
BEFORE INSERT ON `Group`
FOR EACH ROW 
	BEGIN 
		DECLARE v_Create DATETIME;
        SET v_Create = DATE_SUB(NOW(), interval 1 year); -- Hàm DATE_SUB trả về một ngày mà sau đó một khoảng thời gian/ngày nhất định đã bị trừ.
        IF NEW.CreateDate < v_Create THEN 
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'F roi nhe';
        END IF;
	END $$
DELIMITER ;

INSERT INTO `testingsystem3`.`group` 	(`GroupID`	, `GroupName`	, `CreatorID`	, `CreateDate`) 
VALUES 									('11'		, 'o o o'		, '3'			, '2018-04-10 00:00:00');

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào 
 -- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
 -- "Sale" cannot add more user"
 
DROP TRIGGER IF EXISTS check_create_user;
DELIMITER $$
CREATE TRIGGER check_create_user
BEFORE INSERT ON `Account`
FOR EACH ROW 
	BEGIN 
		DECLARE v_DepartmentID TINYINT;
        SELECT DepartmentID INTO v_DepartmentID  FROM department WHERE DepartmentName = 'sale';
        IF NEW.DepartmentID = v_DepartmentID  THEN 
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
        END IF;
	END $$
DELIMITER ;

INSERT INTO `testingsystem3`.`account` (`AccountID`, `Email`, `Username`, `FullName`, `DepartmentID`, `PositionID`, `CreateDate`) 
VALUES ('255', 'pmattys71@exblog.jp3', 'pmattys713', 'Paton Mattys3', '8', '4', '2020-12-03 00:00:00');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user

DROP TRIGGER IF EXISTS check_create_User;
DELIMITER $$
		CREATE TRIGGER check_create_User
		BEFORE INSERT ON groupaccount
		FOR EACH ROW
		BEGIN
			DECLARE v_countACC MEDIUMINT;
			SELECT count(AccountID) INTO v_countACC FROM groupaccount GROUP BY GroupID HAVING GroupID = NEW.GroupID;
			IF v_countACC >= 18 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT= 'Nhom nay da co 18 acc khong the them nua';
            END IF;
			END $$
DELIMITER ;

INSERT INTO `testingsystem3`.`groupaccount` (`GroupID`, `AccountID`, `JoinDate`) 
VALUES ('1', '22', '2020-05-11 00:00:00');

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS check_create_Question;
DELIMITER $$
		CREATE TRIGGER check_create_Question
		BEFORE INSERT ON examquestion
		FOR EACH ROW
		BEGIN
			DECLARE v_countQUES MEDIUMINT;
			SELECT count(QuestionID) INTO v_countQUES FROM examquestion GROUP BY ExamID HAVING ExamID = NEW.ExamID;
			IF v_countQUES >= 35 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT= 'Nhom nay da co 35 question khong the them nua';
            END IF;
			END $$
DELIMITER ;

INSERT INTO `testingsystem3`.`examquestion` (`ExamID`, `QuestionID`) 
VALUES ('1', '3');

	
-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là 
 -- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), 
 -- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó
  
DROP TRIGGER IF EXISTS before_accounts_delete;
DELIMITER $$
CREATE TRIGGER before_accounts_delete 
BEFORE DELETE ON `account`
FOR EACH ROW
BEGIN
	DECLARE v_accountID INT;
    SELECT AccountID INTO v_accountID FROM `Account` WHERE Email = OLD.Email ; 
		IF OLD.Email = 'admin@gmail.com' THEN 
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT= 'This is Admin account, you can not delete!';
		ELSE 
			DELETE FROM Groupaccount WHERE AccountID = v_accountID;
            UPDATE Exam		SET CreatorID = NULL WHERE  CreatorID = v_accountID;
            UPDATE `GROUP`	SET CreatorID = NULL WHERE  CreatorID = v_accountID;
            UPDATE Question SET CreatorID = NULL WHERE  CreatorID = v_accountID;
		END IF;
            
END$$
DELIMITER ;

DELETE FROM `account`
WHERE email = 'admin@gmail.com';


-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table 
 -- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền 
--  vào departmentID thì sẽ được phân vào phòng ban "waiting Department"

DROP TRIGGER IF EXISTS Insert_accounts_waiting_Department;
DELIMITER $$
CREATE TRIGGER Insert_accounts_waiting_Department 
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
	DECLARE v_departmentID INT;
	SELECT DepartmentID INTO v_departmentID  FROM Department WHERE DepartmentName = 'waiting Department';
			 IF NEW.DepartmentID IS NULL THEN 
			 SET NEW.DepartmentID = v_departmentID;
			 END IF;
END$$
DELIMITER ;

INSERT INTO `testingsystem3`.`account` ( `Email`, `Username`, `FullName`, `PositionID`, `CreateDate`) 
VALUES ( 'cccccc', 'jjjjj', 'fffff',  '4', '2020-12-03 00:00:00');


-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi 
 -- question, trong đó có tối đa 2 đáp án đúng.
 
 DROP TRIGGER IF EXISTS Insert_answers;
DELIMITER $$
CREATE TRIGGER Insert_answers 
BEFORE INSERT ON answer
FOR EACH ROW
BEGIN
		DECLARE v_answerID MEDIUMINT;
        DECLARE v_answerID_isCorrect MEDIUMINT;
        
			SELECT count(AnswerID) INTO v_answerID
            FROM answer 
            WHERE QuestionID = NEW.QuestionID;
            
            SELECT count(AnswerID) INTO v_answerID_isCorrect
            FROM answer 
            WHERE QuestionID = NEW.QuestionID  AND isCorrect = 1 ; -- 31 
            
			IF v_answerID >= 4 THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT= 'Question nay da co 4 answer khong the them nua';
            END IF;
            
            IF v_answerID_isCorrect >= 2 THEN 
            SIGNAL SQLSTATE '12345' 
			SET MESSAGE_TEXT= ' Chi co 2 cau tra loi dung thoi ';
            END IF;
END$$
DELIMITER ;

INSERT INTO `testingsystem3`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) 
VALUES (256, 'Answers VTI 3999', 26 , 0);
 
 -- Question 8: Viết trigger sửa lại dữ liệu cho đúng: 
 -- Nếu người dùng nhập vào isCorrect của answer là 1, 0
 -- Thì sẽ đổi lại thành T, F cho giống với cấu hình ở database
 
 
DROP TRIGGER IF EXISTS change_Answer_database;
DELIMITER $$
CREATE TRIGGER change_Answer_database 
BEFORE INSERT ON Answer
FOR EACH ROW
BEGIN
	IF NEW.isCorrect = 1 THEN 
    SET NEW.isCorrect = 'T';
	ELSEIF NEW.isCorrect = 0 THEN 
    SET NEW.isCorrect = 'F';
    END IF;
END $$
DELIMITER ;

INSERT INTO `testingsystem3`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) 
VALUES ('255', 'Answers VTI 3898', '122', 0);

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày

DROP TRIGGER IF EXISTS Delete_exam_2_day;
DELIMITER $$
CREATE TRIGGER Delete_exam_2_day 
BEFORE DELETE ON Exam 
FOR EACH ROW
BEGIN
	DECLARE v_Create DATETIME;
        SET v_Create = DATE_SUB(NOW(), interval 2 day); -- Hàm DATE_SUB trả về một ngày mà sau đó một khoảng thời gian/ngày nhất định đã bị trừ.
        IF OLD.CreateDate > v_Create THEN 
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'F roi nhe';
        END IF;
END $$
DELIMITER ;

 INSERT INTO `testingsystem3`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) 
 VALUES ('11', 'VTIQ011', 'Đề thi ASP.NET1', '7', '90', '3', '2021-05-29 00:00:00');

DELETE FROM exam
WHERE ExamID = 11;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update,
-- delete các question khi question đó chưa nằm trong exam nào

DROP TRIGGER IF EXISTS Update_question_when_no_exam;
DELIMITER $$
CREATE TRIGGER Update_question_when_no_exam
BEFORE UPDATE ON Question  
FOR EACH ROW 
	BEGIN
		DECLARE v_questionID MEDIUMINT;
		IF OLD.questionID IN ( SELECT DISTINCT QuestionID FROM answer)
        OR OLD.questionID IN ( SELECT DISTINCT QuestionID FROM ExamQuestion) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'F roi nhe';
        END IF;
    END $$
DELIMITER ;

-- cach2 

DROP TRIGGER IF EXISTS Update_question_when_no_exam1;
DELIMITER $$
CREATE TRIGGER Update_question_when_no_exam1
BEFORE UPDATE ON Question  
FOR EACH ROW 
	BEGIN
		DECLARE v_count MEDIUMINT;
		SELECT count(*) into v_count FROM ExamQuestion WHERE QuestionID = NEW.QuestionID;
        IF v_count > 0 THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'F roi nhe';
        END IF;
    END $$
DELIMITER ;

UPDATE Question
SET content = 'a'
WHERE QuestionID = 5;

DROP TRIGGER IF EXISTS DELETE_question_when_no_exam;
DELIMITER $$
CREATE TRIGGER DELETE_question_when_no_exam
BEFORE DELETE ON Question  
FOR EACH ROW 
	BEGIN
		DECLARE v_questionID MEDIUMINT;
		IF OLD.questionID IN ( SELECT DISTINCT QuestionID FROM answer)
        OR OLD.questionID IN ( SELECT DISTINCT QuestionID FROM ExamQuestion) THEN
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT = 'F roi nhe';
        END IF;
    END $$
DELIMITER ;

DELETE FROM question
WHERE questionID = 5;

-- -- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"

SELECT `code`, title, duration,
CASE 
	WHEN duration <= 30 THEN 'Short time'
    WHEN 30 < duration <= 60 THEN 'Medium time'
    ELSE 'Long time'
END AS duration_text
FROM exam;

-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa 
-- có tên là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group <= 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
SELECT g.group_name, COUNT(ga.account_id) AS number_of_accounts,
CASE 
	WHEN COUNT(ga.account_id) <= 5 THEN 'few'
    WHEN 5 < COUNT(ga.account_id) <= 20 THEN 'normal'
    ELSE 'higher'
END AS the_number_user_amount
FROM `groups` g
JOIN group_account ga ON g.group_id = ga.group_id
GROUP BY g.group_id;

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, 
-- nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành "Không có user nào" 
SELECT d.departmentname, IF(COUNT(a.accountid) = 0, 'Không có user nào', COUNT(a.accountid)) AS number_of_accounts
FROM department d
LEFT JOIN `account` a ON d.departmentid = a.departmentid
GROUP BY d.departmentid;


