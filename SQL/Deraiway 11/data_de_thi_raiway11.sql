-- Create database Testing_System_Assignment_12
DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE ThucTap;
USE 			ThucTap;
-- Create table GiangVien
DROP TABLE IF EXISTS  GiangVien;
CREATE TABLE GiangVien(
 magv 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 hoten 		NVARCHAR(50) NOT NULL,
 luong		INT NOT NULL
);

-- Create table SinhVien 
DROP TABLE IF EXISTS SinhVien;
CREATE TABLE SinhVien (
 masv 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
 hoten		NVARCHAR(50) NOT NULL,
 namsinh	DATE NOT NULL,
 quequan	NVARCHAR(50) NOT NULL
);

-- Create table DeTai 
DROP TABLE IF EXISTS DeTai;
CREATE TABLE DeTai (
 madt 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
 tendt		NVARCHAR(50) NOT NULL,
 kinhphi	INT NOT NULL,
 NoiThucTap	NVARCHAR(50) NOT NULL
);

-- Create table HuongDan 
DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan(
 id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 masv		TINYINT UNSIGNED  NOT NULL,
 madt		TINYINT UNSIGNED  NOT NULL,
 magv		TINYINT UNSIGNED  NOT NULL,
 ketqua 	ENUM ('Pass', 'Fail') NOT NULL,
 FOREIGN KEY(magv) 	REFERENCES GiangVien (magv),
 FOREIGN KEY(masv)	REFERENCES SinhVien (masv),
 FOREIGN KEY(madt)	REFERENCES DeTai (madt)
);

 -- INSERT data GiangVien
INSERT INTO GiangVien (hoten, luong)
VALUE 	('Lan Nguyen'	, 10	), 
		('Than Le'		, 12	),
        ('Duc Minh'		, 13	),
        ('Vi Da'		, 20	),
        ('Tran Thanh'	, 30	),
        ('Tan Tre'		, 50	),
        ('Van Linh'		, 12	);
        
-- INSERT data SinhVien
INSERT INTO SinhVien (hoten, namsinh, quequan)
VALUE 	('Thuy Nguyen'	, '1999-12-13'	, 'Thanh Hoa'	), 
		('Kieu Chinh'	, '1996-11-04'	, 'Bac Giang' 	),
        ('Phuong Truong', '1998-10-23'	, 'Ha Noi'		),
        ('Diep Chi'		, '1999-07-17'	, 'Ninh Binh'	),
        ('Hoang Long'	, '2000-08-24'	, 'Thanh Hoa'	),
        ('Minh Nguyen'	, '2001-05-25'	, 'Ha Noi'		),
        ('Nguyen Linh'	, '1993-04-26'	, 'Thanh Hoa'	),
        ('Thanh Long'	, '1995-03-04'	, 'Ha Noi'		),
        ('Mui Truong '	, '1999-04-02'	, 'Thanh Hoa'	),
        ('Thu Tran'		, '2000-05-01'	, 'Ninh Binh'	);
        
-- -- INSERT data DeTai
INSERT INTO DeTai (tendt, kinhphi, NoiThucTap)
VALUE 	('CONG NGHE SINH HOC'	,  4	, 'VTI'	), 
		('CONG NGHE THUC PHAM'	,  5	, 'FBT' ),
        ('CONG NGHE HANG KHONG'	,  4	, 'VNPT'),
        ('CONG NGHE VU TRU'		,  8	, 'VIN'	),
        ('CONG NGHE HOA'		,  2	, 'VTI'	),
        ('CONG NGHE AI'			,  3	, 'VIN'	),
        ('CONG NGHE ICT'		,  5	, 'VTI'	),
        ('CONG NGHE IOT'		,  4	, 'VNPT'),
        ('CONG NGHE JA '		,  4	, 'VTI'	),
        ('CONG NGHE AS'			,  6	, 'FBT'	);
        
-- INSERT data HuongDan
INSERT INTO HuongDan (masv, madt, magv, ketqua)
VALUE 
		( 1	 , 1, 1, 'Pass'  ),
        ( 3	 , 2, 2, 'Fail'  ),
		( 4	 , 2, 3, 'Pass'  ),
        ( 2	 , 4, 5, 'Pass'  ),
        ( 10 , 5, 5, 'Pass'  ),
        ( 9  , 6, 4, 'Pass'  ),
        ( 8  , 6, 3, 'Fail'  ),
        ( 5  , 8, 2, 'Pass'  ),
        ( 7  , 4, 2, 'Pass'  );