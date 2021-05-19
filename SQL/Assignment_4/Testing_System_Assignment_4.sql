-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 	a.User_Name, d.Department_Name
FROM 	`Account` a
JOIN 	Department d	ON 	a.DepartmentID = d.DepartmentID
;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 06/12/2010
SELECT *
FROM `Account`
WHERE  CreateDate < '2020-12-07'
;

--  Question 3: Viết lệnh để lấy ra tất cả các deverlop -- lam sao de in tat ca thong cua moi nguoi cung position ???
SELECT 	*
FROM 	`Account` a
JOIN 	 Position  p	ON 	a.PositionID= p.PositionID 
WHERE 	 Position_Name = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >2 nhân viên
SELECT 	* , COUNT(a.AccountID) AS So_Nhan_vien
FROM 	Department d 
JOIN 	`Account` a 	ON d.DepartmentID =	a.DepartmentID 
GROUP BY d.DepartmentID 
HAVING   COUNT(a.AccountID) >2;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất???
SELECT 	 Q.Content , COUNT(Q.Content) AS 'So_luong_cau_hoi' 
FROM 	 Question Q
JOIN 	 ExamQuestion EQ ON  Q.QuestionID = EQ.QuestionID 
GROUP BY Q.Content
HAVING   COUNT(Q.Content) = (SELECT  MAX(CountQ) 
									FROM 
											(SELECT  COUNT(Q.QuestionID) AS CountQ
											FROM 	 ExamQuestion EQ
											JOIN 	 Question Q  ON  EQ.QuestionID = Q.QuestionID 
											GROUP BY Q.QuestionID) AS MaxContent)
                                            ;

-- Question 6 Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT 	 CQ.CategoryID, CQ.Category_Name , COUNT(CQ.CategoryID)  AS Thong_ke_so_su_dung_trong_Question
FROM 	 Question Q
JOIN 	 Category_Question CQ ON  CQ.CategoryID = Q.CategoryID
GROUP BY CQ.CategoryID ;
 
--   Question 7:  Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT 	 Q.QuestionID, Q.Content , COUNT(Q.QuestionID)  AS Thong_ke_so_su_dung_trong_Exam
FROM 	 ExamQuestion EQ
JOIN 	 Question Q ON  EQ.QuestionID = Q.QuestionID
GROUP BY Q.QuestionID ;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT 	 Q.Content , COUNT(Q.Content) AS 'So_luong_cau_hoi' 
FROM 	 Answer A
JOIN 	 Question Q ON  Q.QuestionID = A.QuestionID 
GROUP BY Q.Content
HAVING   COUNT(Q.Content) = (SELECT  MAX(CountQ) 
									FROM 
											(SELECT  COUNT(Q.QuestionID) AS CountQ
											FROM 	 Answer A
											JOIN 	 Question Q  ON  A.QuestionID  = Q.QuestionID 
											GROUP BY Q.QuestionID) AS MaxContent)
                                            ;
                                            
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT 	 GR.GroupID, GR.Group_Name, COUNT(GR.GroupID)  AS Thong_ke_so_so_luong_account_trong_moi_group
FROM 	 Group_Account GRA
JOIN 	 `Group` GR ON  GR.GroupID = GRA.GroupID
GROUP BY GR.GroupID ;

-- Question 10: Tìm chức vụ có ít người nhất 
SELECT 	  P.PositionID, P.Position_Name , COUNT(P.Position_Name) AS Chuc_vu
FROM 	 `Account` A
JOIN 	 Position P ON  P.PositionID = A.PositionID 
GROUP BY P.Position_Name
HAVING   COUNT(P.Position_Name) = (SELECT  MIN(CountP) 
									FROM 
											(SELECT  COUNT(P.PositionID) AS CountP
											FROM 	 `Account` A
											JOIN 	 Position P  ON  P.PositionID  = A.PositionID 
											GROUP BY P.PositionID) AS MinPosition)
                                            ;
 -- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM     
 
 -- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT 	Q.QuestionID AS Ma_cau_hoi , Q.Content AS Noi_dung_cau_hoi, CQ.Category_Name AS Loai_cau_hoi, TQ.Type_Name AS Dinh_danh_cau_hoi, A.User_Name AS Nguoi_tao_cau_hoi, Q.CreateDate AS Ngay_tao_cau_hoi
FROM 	Question Q
JOIN 	Category_Question CQ	ON 	CQ.CategoryID = Q.CategoryID
JOIN 	Type_Question TQ		ON 	TQ.TypeID = Q.TypeID
JOIN 	`Account` A				ON 	A.AccountID = Q.CreatorID
;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT 	T.Type_Name AS Dinh_danh_cau_hoi , COUNT(Q.TypeID) AS So_luong_cau_hoi
FROM 	Question Q
JOIN 	Type_Question T ON T.TypeID =	Q.TypeID 
GROUP BY Q.TypeID 
;

-- Question 14:Lấy ra group không có account nào C1
SELECT 		G.GroupID, G.Group_Name
FROM 		`Group` G
LEFT JOIN 	Group_Account GA ON GA.GroupID = G.GroupID
WHERE 		GA.GroupID IS NULL
;

-- Question 15:Lấy ra group không có account nào C2
SELECT *
FROM `Group`
WHERE GroupID NOT IN ( SELECT 	GroupID
						FROM 	Group_Account);

-- Question 16: Lấy ra question không có answer nào
SELECT 		Q.QuestionID, Q.Content
FROM 		Question Q
LEFT JOIN 	Answer A ON A.QuestionID = Q.QuestionID
WHERE 		A.QuestionID  IS NULL
;

-- Exercise 2: Union Question 17: 
-- a) Lấy các account thuộc nhóm thứ 1
SELECT 	 A.*
FROM 	`Account` A 
JOIN 	 Group_Account GA 	ON GA.AccountID = A.AccountID
WHERE    GA.GroupID = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT 	 A.*
FROM 	`Account` A 
JOIN 	 Group_Account GA 	ON GA.AccountID = A.AccountID
WHERE    GA.GroupID = 2;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT 	 A.*
FROM 	`Account` A 
JOIN 	 Group_Account GA 	ON GA.AccountID = A.AccountID
WHERE    GA.GroupID = 1

UNION

SELECT 	 A.*
FROM 	`Account` A 
JOIN 	 Group_Account GA 	ON GA.AccountID = A.AccountID
WHERE    GA.GroupID = 2;


-- Question 18: 
-- a) Lấy các group có lớn hơn 3 thành viên
SELECT 	*, COUNT(GA.AccountID) AS So_thanh_vien
FROM 	`Group` G 
JOIN 	 Group_Account GA 	ON GA.GroupID =	G.GroupID 
GROUP BY G.GroupID 
HAVING   COUNT(GA.AccountID) >3;

-- b) Lấy các group có nhỏ hơn 5 thành viên
SELECT 	*, COUNT(GA.AccountID) AS So_thanh_vien
FROM 	`Group` G 
JOIN 	 Group_Account GA 	ON GA.GroupID =	G.GroupID 
GROUP BY G.GroupID 
HAVING   COUNT(GA.AccountID) >4;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT 	*, COUNT(GA.AccountID) AS So_thanh_vien
FROM 	`Group` G 
JOIN 	 Group_Account GA 	ON GA.GroupID =	G.GroupID 
GROUP BY G.GroupID 
HAVING   COUNT(GA.AccountID) >3

UNION

SELECT 	*, COUNT(GA.AccountID) AS So_thanh_vien
FROM 	`Group` G 
JOIN 	 Group_Account GA 	ON GA.GroupID =	G.GroupID 
GROUP BY G.GroupID 
HAVING   COUNT(GA.AccountID) >4;
