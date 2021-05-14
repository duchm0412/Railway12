-- Create database Testing_System_Assignment_12
DROP DATABASE IF EXISTS Testing_System_Assignment_12; -- Kiem tra xem database co tan tai khong, neu ma ton tai thi se xoa no di
CREATE DATABASE Testing_System_Assignment_12;
USE 			Testing_System_Assignment_12; -- Su dung database Testing_System_Assignment_12
-- Create table Department
DROP TABLE IF EXISTS  Department; -- -- Kiem tra xem table co tan tai khong, neu ma ton tai thi se xoa no di
CREATE TABLE Department (
 DepartmentID 		INT,
 Department_Name 	VARCHAR(50)
);
-- Create table Position 
DROP TABLE IF EXISTS  Position;
CREATE TABLE Position (
 PositionID 	INT,
 Position_Name 	VARCHAR(50)
);
-- Create table  Account 
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
 AccountID 		INT,
 Email 			VARCHAR(100),
 Username		VARCHAR(50),
 FullName  		VARCHAR(50),
 DepartmentID	INT,
 PositionID		INT,
 CreateDate		DATE
);
-- Create table   Group 
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
 GroupID 		INT,
 Group_Name 	VARCHAR(100),
 CreatorID		INT
);
-- Create table    Group_Account 
DROP TABLE IF EXISTS  Group_Account;
CREATE TABLE Group_Account(
 GroupID 		INT,
 AccountID 		INT,
 Join_Date		DATE
);
-- Create table     Type_Question 
DROP TABLE IF EXISTS  Type_Question;
CREATE TABLE Type_Question(
 TypeID 		INT,
 Type_Name		VARCHAR(50)
);
-- Create table     Category_Question
DROP TABLE IF EXISTS  Category_Question;
CREATE TABLE Category_Question(
 CategoryID 		INT,
 Category_Name		VARCHAR(50)
);
-- Create table      Question
DROP TABLE IF EXISTS   Question;
CREATE TABLE  Question(
 QuestionID 		INT,
 Content			VARCHAR(50),
 CategoryID			INT,
 TypeID				INT,
 CreatorID			INT,
 CreateDate			DATE
);
-- Create table     Answer
DROP TABLE IF EXISTS  Answer;
CREATE TABLE Answer(
 AnswerID 		INT,
 Content		VARCHAR(50),
 QuestionID		INT,
 isCorrect		VARCHAR(50)
);
-- Create table     Exam
DROP TABLE IF EXISTS   Exam;
CREATE TABLE  Exam(
 ExamID 		INT,
 `Code`			INT,
 Title			VARCHAR(50),
 CategoryID		INT,
 Duration		VARCHAR(50),
 CreatorID		INT,
 CreateDate		DATE
);
-- Create table     Exam_Question
DROP TABLE IF EXISTS    Exam_Question;
CREATE TABLE   Exam_Question(
 ExamID			INT,
 QuestionID		INT
 );