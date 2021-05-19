
DROP DATABASE IF EXISTS Assignment_bonus;
CREATE DATABASE Assignment_bonus;
USE Assignment_bonus;

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu

-- Tao bang Trainee
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee ( 
	TraineeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Full_Name 			VARCHAR (50) NOT NULL,
	Birth_Date 			DATE NOT NULL,
    Gender				ENUM('MALE', 'FEMALE', 'UNKNOWN') NOT NULL ,
    ET_IQ 				TINYINT UNSIGNED CHECK ((ET_IQ) <= 20),
    ET_Gmath 			TINYINT UNSIGNED CHECK ((ET_Gmath) <= 20),
    ET_English			TINYINT UNSIGNED CHECK ((ET_English) <= 50),
    Training_Class		CHAR(6) ,
    Evaluation_Notes	VARCHAR(50) 
    );

-- Question 2: Thêm ít nhất 10 bản ghi vào table
-- Add data cho bang Trainee
INSERT INTO Trainee (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes )
VALUEs
		( 'Hoang Minh Duc'		, 	'1999-12-04' , 	'FEMALE' ,	20	, 	17	,   45, 'VTI001', 'DHBKHN' 	),
        ( 'Than Thi Le'			, 	'1999-09-26' , 	'MALE'	 ,	18	, 	19	,	44, 'VTI001', 'DHBKHN'	),
		( 'Than Duc Minh' 		, 	'2004-07-08' ,	'FEMALE' ,	16	, 	20	,	50, 'VTI001', 'DHBKHN'	),
        ( 'Than Anh Van' 		, 	'2002-07-03' ,	'FEMALE' ,	20	, 	20	,	49, 'VTI002', 'DHQGHN'	),
        ( 'Nguyen Thi Thuy' 	,	'2004-05-08' ,	'MALE'	 ,	19	, 	17	,	39, 'VTI003', 'DHQGHN'	),
        ( 'Tran Thi Thu'		,	'2001-09-18' ,	'MALE'	 ,	14	,	18	,	47, 'VTI002', 'DHBKHN'	),
        ( 'Hoang Van Linh'		,	'2004-07-28' ,	'FEMALE' ,	15  ,	19	,	35, 'VTI002', 'DHBKHN'	),
        ( 'Hoang Thi Thuy Trang', 	'2004-11-12' ,	'MALE'	 ,	17  , 	14	,	30, 'VTI002', 'DHBKHN'	),
        ( 'Hoang Van Linh'		,	'2004-07-30' ,	'FEMALE' ,	13  ,	20	,	45, 'VTI003', 'HVBCVT'	);
        



    
    



