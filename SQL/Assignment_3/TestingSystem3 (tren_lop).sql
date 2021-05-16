Use TestingSystem3;

SELECT *
FROM `Account`
WHERE DepartmentID > 5 AND PositionID <=3 
ORDER BY DepartmentID DESC
LIMIT 10 
;

SELECT *
FROM `Account`
WHERE DepartmentID BETWEEN 2 AND 4
ORDER BY DepartmentID DESC
LIMIT 3
;

SELECT *
FROM `Account`
WHERE DepartmentID NOT IN (1, 2, 3)
;

SELECT *
FROM `Account`
WHERE FullName LIKE 'T%e';

SELECT *
FROM `Account`
WHERE DepartmentID NOT IN (1, 2, 3)
;

SELECT DISTINCT DepartmentID -- gia tri khong trung nhau
FROM  `Account`;

SELECT COUNT(*)
FROM `Account`;

SELECT SUM(AccountID)
FROM `Account`;

SELECT * 
FROM answer
GROUP BY (QuestionID) HAVING COUNT(QuestionID) >=4;

-- Question 2: lấy ra tất cả các phòng ban
SELECT *
FROM Department;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'Sale';
-- Question 4: lấy ra thông tin account có full name dài nhất
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT *
FROM `group`
WHERE CreateDate < '20-03-28'
;

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT *, COUNT(QuestionID)
FROM `Answer`
GROUP BY QuestionID HAVING COUNT(*) > 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT *
FROM `Exam`
WHERE Duration > 60 AND CreateDate < '20-04-07';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT * , COUNT(*)
FROM `Account`
GROUP BY DepartmentID HAVING DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM `Account`
WHERE FullName LIKE 'L%e';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE
FROM exam
WHERE CreateDate < '2018-08-13';
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"??? -- loi updeat
DELETE
FROM  question
WHERE Content LIKE 'Question%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE 	`Account`
SET 			Username = 'Nguyễn Bá Lộc',
				Email =    'loc.nguyenba@vti.com.vn'
WHERE 			AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE 			GroupAccount
SET 			AccountID = 5
WHERE 			GroupID= 100;


