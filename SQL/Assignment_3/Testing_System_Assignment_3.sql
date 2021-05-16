-- Bài 2:lấy ra tất cả các phòng ban
SELECT *
FROM  Department ;

-- Bài 3: lấy ra id của phòng ban "Sale" 
SELECT *
FROM Department 
WHERE Department_Name = 'sale';

-- Bài 4: lấy ra thông tin account có User_name dài nhất 
SELECT *
FROM `Account`
WHERE LENGTH(User_Name) = (SELECT MAX(LENGTH(User_Name)) FROM `Account`)
ORDER BY User_Name DESC
;
-- Bài 5:  Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM `Account`
WHERE LENGTH(User_Name) = (SELECT MAX(LENGTH(User_Name)) FROM `Account`) AND DepartmentID = 3
ORDER BY User_Name DESC
;
-- Bài 6: Lấy ra tên group đã tham gia trước ngày 20/12/2020
SELECT Group_Name
FROM `Group`
WHERE Create_Date < '2020-12-20'
;

-- Bài 7:  Lấy ra ID của question có >= 4 câu trả lời
SELECT 		QuestionID
FROM   		Answer
GROUP BY 	QuestionID
HAVING 	 	COUNT(QuestionID) >= 4
;
-- bài 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 04/07/2021 
SELECT 		`Code`
FROM   		Exam
WHERE 	 	Duration >= 60  AND Create_Date < '2021/04/07' 
;

-- Bài 9: Lấy ra 3 group được tạo gần đây nhất
SELECT 			*
FROM   			`Group`
ORDER BY 		Create_Date DESC
LIMIT 3
;

--  Bai 10: Đếm số nhân viên thuộc department có id = 2

SELECT 			*, COUNT(AccountID) AS 'SO_NHAN_VIEN' -- lam sao de hien tat ca thong tin cua nhan vien thuoc phong iD =2 ????
FROM   			`Account`
WHERE			DepartmentID = 2 
;
 --  Bai 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "H"
SELECT 		*
FROM   		`Account`
WHERE  		 User_Name LIKE 'D%h' 
;



