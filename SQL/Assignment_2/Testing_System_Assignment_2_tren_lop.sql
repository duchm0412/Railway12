-- Create database Testing_System_Assignment_12
DROP DATABASE IF EXISTS Testing_System_Assignment_12; -- Kiem tra xem database co tan tai khong, neu ma ton tai thi se xoa no di
CREATE DATABASE Testing_System_Assignment_12;
USE 			Testing_System_Assignment_12; -- Su dung database Testing_System_Assignment_12
-- Create table Department
DROP TABLE IF EXISTS  Department; -- -- Kiem tra xem table co tan tai khong, neu ma ton tai thi se xoa no di
CREATE TABLE Department (
 DepartmentID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
 Department_Name 	NVARCHAR(50) -- NVARCHAR de luu tieng viet
);

-- Create table Position 
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
 PositionID 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY , -- AUTO_INCREMENT tu tang id len.
 Position_Name		ENUM('Dev','Test', 'Scrom Master','PM') NOT NULL UNIQUE KEY
);
-- Create table  Account 
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
 AccountID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Email 			VARCHAR(100) UNIQUE KEY  NOT NULL,
 Username		VARCHAR(50)  UNIQUE KEY NOT NULL,
 FullName  		NVARCHAR(50)  NOT NULL,
 DepartmentID	TINYINT UNSIGNED NOT NULL,
 PositionID		TINYINT UNSIGNED NOT NULL,
 CreateDate		DATETIME DEFAULT NOW(), -- lay gio ngay thang hien tai
 FOREIGN KEY(DepartmentID) 	REFERENCES Department (DepartmentID),
 FOREIGN KEY(PositionID)	REFERENCES `Position` (PositionID)
);
-- Create table   Group 
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
 GroupID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Group_Name 	NVARCHAR(50) CHECK (LENGTH(Group_Name) >= 3),
 CreatorID		TINYINT UNSIGNED NOT NULL UNIQUE KEY,
 FOREIGN KEY(CreatorID) REFERENCES `Account` (AccountID)
);
-- Create table    Group_Account 
DROP TABLE IF EXISTS  Group_Account;
CREATE TABLE Group_Account(
 GroupID 		TINYINT UNSIGNED,
 AccountID 		TINYINT UNSIGNED,
 Join_Date		DATETIME DEFAULT NOW(), 
 FOREIGN KEY(GroupID) REFERENCES `Group` (GroupID),
 FOREIGN KEY(AccountID) REFERENCES `Account` (AccountID)
);
-- Create table     Type_Question 
DROP TABLE IF EXISTS  Type_Question;
CREATE TABLE Type_Question(
 TypeID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Type_Name			ENUM ('Essay', 'Multiple-Choice') NOT NULL UNIQUE KEY
);

-- Create table     Category_Question
DROP TABLE IF EXISTS  Category_Question;
CREATE TABLE Category_Question(
 CategoryID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Category_Name		ENUM ('Java', 'NET', 'SQL','Postman','Ruby' ) NOT NULL UNIQUE KEY
);
-- Create table      Question
DROP TABLE IF EXISTS   Question;
CREATE TABLE  Question(
 QuestionID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Content			VARCHAR(100) NOT NULL,
 CategoryID			TINYINT UNSIGNED NOT NULL,
 TypeID				TINYINT UNSIGNED NOT NULL,
 CreatorID			TINYINT UNSIGNED NOT NULL,
 CreateDate			DATETIME DEFAULT NOW(),
 FOREIGN KEY(CategoryID	) 	REFERENCES Category_Question (CategoryID),
 FOREIGN KEY(TypeID) 		REFERENCES  Type_Question (TypeID),
 FOREIGN KEY(CreatorID)	 	REFERENCES `Account` (AccountID)
);
-- Create table     Answer
DROP TABLE IF EXISTS  Answer;
CREATE TABLE Answer(
 AnswerID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Content		NVARCHAR(100),
 QuestionID		TINYINT UNSIGNED NOT NULL,
 isCorrect		ENUM ('true','fail') NOT NULL UNIQUE,
 FOREIGN KEY(QuestionID) REFERENCES Question (QuestionID)
);
-- Create table     Exam
DROP TABLE IF EXISTS   Exam;
CREATE TABLE  Exam(
 ExamID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 `Code`			TINYINT UNSIGNED NOT NULL ,
 Title			NVARCHAR(50) NOT NULL,
 CategoryID		TINYINT UNSIGNED NOT NULL, -- UNSIGNED phai de truoc NOT NULL 
 Duration		TINYINT NOT NULL CHECK ( Duration >= 45 AND Duration <= 180),
 CreatorID		TINYINT UNSIGNED NOT NULL ,
 CreateDate		DATETIME DEFAULT NOW(),
 FOREIGN KEY(CategoryID) REFERENCES Category_Question (CategoryID),
 FOREIGN KEY(CreatorID)	 	REFERENCES `Account` (AccountID)
);
-- Create table     Exam_Question
DROP TABLE IF EXISTS    Exam_Question;
CREATE TABLE   Exam_Question(
 ExamID			TINYINT UNSIGNED NOT NULL,
 QuestionID		TINYINT UNSIGNED NOT NULL,
 FOREIGN KEY(ExamID) REFERENCES Exam (ExamID),
 FOREIGN KEY(QuestionID) REFERENCES Question (QuestionID)
 );
 
 -- INSERT DATA 
 
 -- INSERT data department
INSERT INTO Department (Department_Name)
VALUE 	('deverlop'), 
		('sale'),
        ('Marketing');

 -- INSERT data Position
 INSERT INTO `Position` ( Position_Name)
 VALUE ('Dev'), 
	   ('Test'),
       ('Scrom Master'),
       ('PM');
       
	-- INSERT data Position
    