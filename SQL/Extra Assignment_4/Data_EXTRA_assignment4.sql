-- Create database Testing_System_Assignment_25_05_21
DROP DATABASE IF EXISTS Testing_System_Assignment_25_05_21;
CREATE DATABASE Testing_System_Assignment_25_05_21;
USE 			Testing_System_Assignment_25_05_21;
-- Create table Department
DROP TABLE IF EXISTS  Department; 
CREATE TABLE Department(
 Department_Number 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Department_Name 		NVARCHAR(50) NOT NULL
);
-- Create table Employee_Table
DROP TABLE IF EXISTS  Employee_Table; 
CREATE TABLE Employee_Table(
 Employee_Number		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
 Employee_Name 			NVARCHAR(50) NOT NULL,
 Department_Number  	TINYINT UNSIGNED NOT NULL,
 FOREIGN KEY(Department_Number) REFERENCES Department (Department_Number)
);

-- Create table Skill_Table
DROP TABLE IF EXISTS  Skill_Table; 
CREATE TABLE Skill_Table(
 Skill_Number 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Skill_Name 			NVARCHAR(50) NOT NULL
);

-- Create table Employee_Skill_Table
DROP TABLE IF EXISTS  Employee_Skill_Table; 
CREATE TABLE Employee_Skill_Table (
 Employee_Number  		TINYINT UNSIGNED NOT NULL,
 Skill_Number 			TINYINT UNSIGNED NOT NULL,
 `Date Registered`  	DATETIME DEFAULT NOW(),
 FOREIGN KEY(Employee_Number) REFERENCES Employee_Table (Employee_Number),
 FOREIGN KEY(Skill_Number) REFERENCES Skill_Table (Skill_Number)
);


 -- INSERT DATA 
 
 -- INSERT data department
INSERT INTO Department (Department_Name)
VALUE 	('deverlop'			), 
		('sale'				),
        ('Marketing'		),
        ('Protect'	 		),
        ('Personnel'		),
        ('Technical'		),
        ('Accounting'		),
        ('Audit'			),
        ('Human Resources'	),
        ('Administration'	);
        
-- INSERT data Employee_Table
INSERT INTO Employee_Table (Employee_Name, Department_Number)
VALUE 	('Lan Nguyen'	,	2		), 
		('Than Le'		,	1		),
        ('Duc Minh'		,	2		),
        ('Minh Duc'		,	4 		),
        ('Hoang Long'	,	5		),
        ('Minh Nguyen'	,	6		),
        ('Vi Da'		,	9		),
        ('Tran Thanh'	,	2		),
        ('Tan Tre'		,	3		),
        ('Thuy Trang'	,	5		);
        
-- NSERT data Skill_Table
INSERT INTO Skill_Table ( Skill_Name)
VALUE 	('JAVA'				), 
		('C#'				),
        ('SQL'				),
        ('C++'				);

        
	-- INSERT data Employee_Skill_Table
INSERT INTO Employee_Skill_Table (Employee_Number, Skill_Number)
VALUE 	(1	,	2		), 
		(2	,	1		),
        (3	,	2		),
        (4	,	4 		),
        (6	,	3		),
        (9	,	3		),
        (6	,	3		),
        (6	,	2		),
        (2	,	3		),
        (4	,	1		);



