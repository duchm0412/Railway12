-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =20. Sau đó xem kết quả.
SELECT *
FROM Trainee
WHERE ET_IQ = 20;
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, 
-- và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20
SELECT *
FROM Trainee
WHERE ET_IQ >= 15 AND ET_Gmath >= 15 AND ET_English >= 40;

-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc bằng chữ C
SELECT *
FROM Trainee
WHERE Full_Name LIKE ('T%n');
-- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G
SELECT *
FROM Trainee
WHERE Full_Name LIKE ('_o%');
-- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C
SELECT *
FROM Trainee
WHERE Full_Name LIKE ('%c') AND length(Full_Name) = 14  ;
-- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau.
SELECT DISTINCT full_name  -- Loại bỏ tên trùng nhau.
FROM Trainee
WHERE TraineeID; 
-- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này theo thứ tự từ A-Z.
SELECT *
FROM Trainee
ORDER BY Full_Name  ASC ;
-- Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
SELECT *, length(Full_Name)
FROM Trainee
WHERE length(Full_Name) = ( SELECT MAX(length(Full_Name))
							FROM Trainee);
                            
-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT TraineeID, Full_Name, Birth_Date, length(Full_Name) AS So_tu_ngay_sinh
FROM Trainee
WHERE length(Full_Name) = ( SELECT MAX(length(Full_Name))
							FROM Trainee);
-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất
SELECT  Full_Name,ET_IQ,ET_Gmath,ET_English, length(Full_Name) AS So_tu_ngay_sinh
FROM Trainee
WHERE length(Full_Name) = ( SELECT MAX(length(Full_Name))
							FROM Trainee);
-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT *
FROM Trainee
ORDER BY  Birth_Date DESC
LIMIT 5 ;
-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người thỏa mãn số điểm như sau:
-- ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
-- ET_English>=18
 SELECT *
 FROM Trainee
 WHERE (ET_IQ + ET_Gmath) >= 35  AND ET_IQ>=8 AND ET_Gmath>=8  AND ET_English>=18;
 
 -- Question 15: Xóa thực tập sinh có TraineeID = 5
 DELETE
 FROM trainee
 WHERE TraineeID = 5;
-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15
 DELETE
 FROM trainee
 WHERE ( ET_IQ + ET_Gmath) <= 35;
 -- Question 17: Xóa thực tập sinh quá 20 tuổi
SELECT *
FROM trainee ;
SELECT  year(curdate());
SELECT Full_name, Year(curdate()) - year(Birth_date) AS tuoi
FROM trainee;

DELETE 
FROM trainee 
WHERE year(curdate()) - year(Birth_date) > 25;



 -- Question 18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật thông tin vào database
 UPDATE 	Trainee
 SET 		Training_Class = 'VTI003' -- chỉ khi có nhieu colum mới co ","
 WHERE 		TraineeID = 3;
 
 -- Question 19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai,
 -- hãy cập nhật lại tên thành “LeVanA”, điểm ET_IQ =10, điểm ET_Gmath =15, điểmET_English = 30.
 
 UPDATE 	Trainee
 SET 		Full_Name = 'LeVanA',
			ET_IQ =10,
            ET_Gmath =15,
            ET_English = 30
			
 WHERE 		TraineeID = 9;
 -- Question 20: Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh.
 SELECT Training_Class,COUNT(*)
 FROM Trainee
 GROUP BY Training_Class;
 -- Question 22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh
 WITH Cte_tong_sinh_vien AS (
 SELECT  (COUNT(*)) as tong
 FROM Trainee
 GROUP BY Training_Class
 HAVING Training_Class = 'VTI001' OR Training_Class = 'VTI003'
 ), 
 tong_sv AS (
  SELECT SUM(tong) AS tong_sv
  FROM Cte_tong_sinh_vien
  GROUP BY tong 
  )
  SELECT *
  FROM tong_sv;
 -- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown.
 SELECT Gender, COUNT(*)
 FROM 	Trainee 
 GROUP BY Gender;
 -- Question 24: Lấy ra lớp có lớn hơn 5 thực tập viên
  SELECT 	Training_Class, COUNT(Training_Class)
 FROM 		Trainee 
 GROUP BY	Training_Class
 HAVING  	COUNT(Training_Class) >3;
 -- Question 26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học
   SELECT 	Evaluation_Notes, COUNT(Evaluation_Notes)
 FROM 		Trainee 
 GROUP BY	Evaluation_Notes
 HAVING  	COUNT(Evaluation_Notes) <2;
 -- Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI001'
-- Bước 2: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI002'
-- Bước 3: Sử dụng UNION để nối 2 kết quả ở bước 1 và 2
SELECT TraineeID, Full_Name, Training_Class
FROM Trainee
WHERE Training_Class =  'VTI001'

UNION 

SELECT TraineeID, Full_Name, Training_Class
FROM Trainee
WHERE Training_Class =  'VTI002';


 
 

 
 


 