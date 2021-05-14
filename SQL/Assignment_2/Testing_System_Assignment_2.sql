DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE 		Testing_System_Assignment_1;
USE 					Testing_System_Assignment_1; 
-- create table : department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	DepartmentID		TINYINT UNSIGNED PRIMARY KEY,
    Department_Name		VARCHAR(50) UNIQUE KEY 
);

-- add data department
INSERT INTO Department (DepartmentID, Department_Name)
VALUE 
		(1, 'Marketing' 		),
        (2, 'Sale' 				),
		(3, 'Protect' 			),
        (4, 'Personnel' 		),
        (5, 'Technical' 		),
        (6, 'Accounting'		),
        (7,	'Audit'				),
        (8, 'Human Resources'	),
        (9, 'Administration'	);
        
-- create table : position
DROP TABLE IF EXISTS Position;
CREATE TABLE  Position (
	PositionID			TINYINT UNSIGNED PRIMARY KEY,
    Position_Name		ENUM('Dev','Test', 'Scrom Master','PM')
);

-- add data Position
INSERT INTO Position (PositionID, Position_Name)
VALUE 
		(1, 'Dev' 			),
        (2, 'Test' 			),
		(3, 'Scrom Master'	),
        (4, 'PM' 			);
        
-- create table : `Account`
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
	AccountID			TINYINT UNSIGNED PRIMARY KEY,
    Email				VARCHAR(50) UNIQUE KEY NOT NULL,
    User_Name			VARCHAR(50) UNIQUE KEY CHECK (LENGTH(User_Name) >= 4), -- độ dài user ít nhất là >= 4
    DepartmentID		TINYINT UNSIGNED,
    PositionID			TINYINT UNSIGNED,
    CreateDate			DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Position (PositionID)
);

-- add data `Account`
INSERT INTO `Account` (AccountID, Email, User_Name, DepartmentID, PositionID, CreateDate )
VALUE 
		(1, 'LanNguyenVTI@gmail.com'	, 'Lan Nguyen'	, 1, 1, '2020-03-03'	),
        (2, 'ThanLeVTI@gmail.com'		, 'Than Le'		, 2, 1, '2020-03-03' 	),
		(3, 'DucMinhVTI@gmail.com'		, 'Duc Minh'	, 3, 2, '2020-03-03' 	),
        (4, 'MinhDucVTI@gmail.com'		, 'Minh Duc'	, 3, 4, '2020-03-03' 	),
        (5, 'HoangLongVTI@gmail.com'	, 'Hoang Long'	, 4, 4, '2020-03-03' 	),
        (6, 'MinhNguyenVTI@gmail.com' 	, 'Minh Nguyen' , 3, 3, '2020-03-03'	),
        (7, 'ViDaVTI@gmail.com' 		, 'Vi Da'		, 2, 2, '2020-03-03'	),
      	(8, 'TranThanhVTI@gmail.com' 	, 'Tran Thanh'	, 9, 4, '2020-03-03'	),
        (9, 'TanTreVTI@gmail.com' 		, 'Tan Tre'		, 2, 3, '2020-03-03'	);
        
-- create table : Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
	GroupID			TINYINT UNSIGNED PRIMARY KEY,
    Group_Name			VARCHAR(50) UNIQUE KEY CHECK (LENGTH(Group_Name) >= 3),
    CreatorID			TINYINT UNSIGNED ,
    Create_Date			DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);


-- add data `Group`
INSERT INTO `Group` (GroupID, Group_Name, CreatorID, Create_Date )
VALUE 
		(1, 'Chien Binh',   1, '2020-12-17'	),
        (2, 'Sieu Nhan'	,   3, '2020-12-18'	),
		(3, 'Cung Tien'	,   2, '2020-12-19'	),
        (4, 'Ba Anh Em'	,   7, '2020-12-20'	),
        (5, 'La La'		,	6, '2020-12-21'	);
        
-- create table : Group_Account
DROP TABLE IF EXISTS Group_Account;
CREATE TABLE Group_Account (
	GroupID				TINYINT UNSIGNED PRIMARY KEY,
    AccountID			TINYINT UNSIGNED,
    Join_Date			DATE,
    FOREIGN KEY (GroupID) REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID)
);

-- add data Group_Account
INSERT INTO Group_Account (GroupID, AccountID, Join_Date )
VALUE 
		(1, 1, '2020-02-04'	),
        (2, 4, '2020-03-04'	),
		(3, 5, '2020-05-04'	),
        (4, 6, '2020-04-04'	),
        (5, 2, '2020-01-04'	);
       
        
-- create table : Type_Question
DROP TABLE IF EXISTS Type_Question;
CREATE TABLE 	Type_Question (
	TypeID				TINYINT UNSIGNED PRIMARY KEY ,
    Type_Name			ENUM ('Essay', 'Multiple-Choice')
);

-- add data Type_Question
INSERT INTO Type_Question (TypeID, Type_Name)
VALUE 
		(1, 'Essay'				),
        (2, 'Multiple-Choice'	);
		
-- create table : Category_Question
DROP TABLE IF EXISTS Category_Question; 
CREATE TABLE 	Category_Question (
	CategoryID			TINYINT UNSIGNED PRIMARY KEY,
    Category_Name		ENUM ('Essay', 'Multiple-Choice')
);

-- add data Category_Question
INSERT INTO Category_Question (CategoryID, Category_Name)
VALUE 
		(1, 'Essay' 			),
        (2, 'Multiple-Choice' 	);
		
       
-- create table : Question
DROP TABLE IF EXISTS Question;
CREATE TABLE 	Question (
	QuestionID			TINYINT UNSIGNED PRIMARY KEY,
    Content				VARCHAR(50) NOT NULL,
    CategoryID			TINYINT UNSIGNED,
    TypeID				TINYINT UNSIGNED,
    CreatorID			TINYINT UNSIGNED,
    CreateDate			DATE,
    FOREIGN KEY (CategoryID) REFERENCES Category_Question(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES Type_Question (TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

-- add data Question
INSERT INTO Question (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUE 
		(1, 'What is Java?'						, 2, 1, 1, '2020/04/05' ),
        (2, 'What is .NET?'						, 2, 2, 2, '2020/04/05' ),
		(3, 'What is SQL?'						, 1, 2, 3, '2020/04/05' ),
        (4, 'What is Ruby?'						, 1, 1, 4, '2020/04/05' ),
        (5, 'What is C#?' 						, 2, 2, 2, '2020/04/05' ),
        (6, 'What is your major?' 				, 1, 1, 7, '2020/04/05' ),
        (7, 'Which company do you work for?' 	, 2, 1, 8, '2020/04/05' ),
        (8, 'How long have you had that job' 	, 1, 2, 9, '2020/04/05' ),
        (9, 'Do you like your job?' 			, 2, 2, 6, '2020/04/05' );
     
-- create table : Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE 	Answer (
	AnswerID			TINYINT UNSIGNED PRIMARY KEY,
    Content				VARCHAR(50) NOT NULL,
    QuestionID			TINYINT UNSIGNED,
    isCorrect			ENUM ('true','fail'),
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

-- add data Answer
INSERT INTO Answer (AnswerID, Content, QuestionID, isCorrect)
VALUE 
		(1, 'Help me!'				, 1, 'true'		),
        (2, 'Somebody helps!'		, 2, 'true' 	),
		(3, 'I’m here'				, 3, 'fail'		),
        (4, 'Be careful!'			, 4, 'fail' 	),
        (5, 'There is a fire'		, 4, 'fail' 	),
		(6, 'I’ve been mugged.'		, 6, 'true' 	),
		(7, 'I’m lost.'				, 4, 'true' 	),
		(8, 'Call an ambulance!'	, 4, 'fail' 	),
		(9, 'Call the fire brigade!', 9, 'true' 	);
		
        
-- create table : Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE 	Exam (
	ExamID				TINYINT UNSIGNED PRIMARY KEY,
    `Code`				TINYINT UNSIGNED UNIQUE KEY,
    Title				VARCHAR(50),
    CategoryID			TINYINT UNSIGNED,
    Duration			TINYINT UNSIGNED,
    CreatorID			TINYINT UNSIGNED,
    Create_Date			DATE,
    FOREIGN KEY (CategoryID) REFERENCES Category_Question (CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);   

-- add data Exam
INSERT INTO Exam (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, Create_Date) 
VALUE 
		(1, '11'	, 'cccJava?', 1, 90, 2, '2021/04/05' ),
        (2, '22'	, 'ccc.NET?', 1, 60, 1, '2021/04/06' ),
		(3, '33'	, 'cccSQL?' , 2, 75, 3, '2021/04/07' ),
        (4, '44'	, 'cccRuby?', 2, 45, 4, '2021/04/08' );
        
-- create table : ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE 	 ExamQuestion (
	ExamID				TINYINT UNSIGNED, 
    QuestionID			TINYINT	UNSIGNED,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam (ExamID)
);
-- add data ExamQuestion
INSERT INTO ExamQuestion (ExamID, QuestionID) 
VALUE 
		(1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (1, 5),
        (2, 6),
        (3, 8),
        (4, 9),
        (1, 1),
        (2, 2),
        (3, 3),
        (2, 4);
        




