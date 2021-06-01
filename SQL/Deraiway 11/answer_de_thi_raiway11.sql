-- 2. Viết lệnh để
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
-- b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’

SELECT sv.masv, sv.hoten
FROM  huongdan hd  RIGHT JOIN sinhvien sv ON hd.masv = sv.masv
WHERE hd.madt IS NULL;
 
SELECT sv.masv, sv.hoten
FROM  sinhvien sv  
JOIN  huongdan hd ON hd.masv = sv.masv
JOIN  detai dt ON dt.madt = hd.madt
WHERE dt.tendt = 'CONG NGHE SINH HOC' ;
-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm: 
-- mã số, họ tên và tên đề tài
-- Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có"

DROP VIEW IF EXISTS SinhVienInfo ;
CREATE VIEW SinhVienInfo  AS
	SELECT sv.masv, sv.hoten, dt.tendt
		FROM detai dt
		LEFT JOIN huongdan hd  ON dt.madt = hd.madt
		RIGHT JOIN sinhvien sv ON sv.masv = hd.masv;        
SELECT masv, hoten,
IF( tendt IS NULL , 'Không có user nào', tendt) AS tendt
FROM SinhVienInfo;

-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900  
-- thì hiện ra thông báo "năm sinh phải > 1900"

DROP TRIGGER IF EXISTS Insert_birth_date;
DELIMITER $$
CREATE TRIGGER Insert_birth_date
BEFORE INSERT ON   Sinhvien
FOR EACH ROW 
	BEGIN 
		IF NEW.namsinh <= '1991-01-01' THEN 
		SIGNAL SQLSTATE '12345'
		SET MESSAGE_TEXT= 'nam sinh phai > 1990';
		END IF;
    END $$
DELIMITER ;

INSERT INTO `thuctap`.`sinhvien` (`masv`, `hoten`, `namsinh`, `quequan`) 
VALUES ('13', 'Long Le', '1990-12-31', 'Ninh Binh');

-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông 
-- tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi

DROP PROCEDURE IF EXISTS Delete_Sv_WithID;
DELIMITER $$
CREATE PROCEDURE Delete_Sv_WithID (IN in_masv TINYINT UNSIGNED)
BEGIN
		DELETE FROM huongdan WHERE masv = in_masv;
		DELETE FROM sinhvien WHERE masv = in_masv;
END$$
DELIMITER ;
CALL Delete_Sv_WithID(8);

