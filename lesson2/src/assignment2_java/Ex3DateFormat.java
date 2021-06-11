package assignment2_java;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

public class Ex3DateFormat {

	public static void main(String[] args) {

		// Create Department
		Department department1 = new Department();
		department1.departmentId = 1;
		department1.departmentName = "Sale";

		Department department2 = new Department();
		department2.departmentId = 2;
		department2.departmentName = "Marketing";

		Department department3 = new Department();
		department3.departmentId = 3;
		department3.departmentName = "IT";

		// Create positions

		Position position1 = new Position();
		position1.positionId = 1;
		position1.positionName = PositionName.DEV;

		Position position2 = new Position();
		position2.positionId = 2;
		position2.positionName = PositionName.TEST;

		Position position3 = new Position();
		position3.positionId = 3;
		position3.positionName = PositionName.PM;

		// Create accounts

		Account account1 = new Account();
		account1.accountId = 1;
		account1.email = "nguyenvana@gmail.com";
		account1.userName = "nguyenvana";
		account1.fullName = "Nguyen Van A";
		account1.department = department1;
		account1.position = position1;
		account1.createDate = LocalDate.of(2021, 6, 1);
		;

		Account account2 = new Account();
		account2.accountId = 2;
		account2.email = "lethib@gmail.com";
		account2.userName = "lethib";
		account2.fullName = "Le Thi B";
		account2.department = department2;
		account2.position = position2;
		account2.createDate = LocalDate.of(2021, 06, 04);

		Account account3 = new Account();
		account3.accountId = 3;
		account3.email = "tranvanc@gmail.com";
		account3.userName = "tranvanc";
		account3.fullName = "Tran Van C";
		account3.department = department3;
		account3.position = position3;
		account3.createDate = LocalDate.of(2021, 6, 5);

		// Create groups

		Group group1 = new Group();
		group1.groupId = 1;
		group1.groupName = "C++ Fresher";
		group1.creator = account1;
		group1.createDate = LocalDate.of(2021, 6, 1);

		Group group2 = new Group();
		group2.groupId = 2;
		group2.groupName = "Java Fresher";
		group2.creator = account2;
		group2.createDate = LocalDate.of(2021, 6, 2);

		Group group3 = new Group();
		group3.groupId = 3;
		group3.groupName = "C# Fresher";
		group3.creator = account3;
		group3.createDate = LocalDate.of(2021, 6, 3);

		Group[] groupsOfAccount1 = { group1, group2 };
		account1.groups = groupsOfAccount1;

		Group[] groupsOfAccount2 = { group2, group3 };
		account2.groups = groupsOfAccount2;

		Group[] groupsOfAccount3 = { group1, group3 };
		account3.groups = groupsOfAccount3;

		Account[] accountsOfGroup1 = { account1, account3 };
		group1.accounts = accountsOfGroup1;

		Account[] accountsOfGroup2 = { account1, account2 };
		group2.accounts = accountsOfGroup2;

		Account[] accountsOfGroup3 = { account2, account3 };
		group3.accounts = accountsOfGroup3;

		// Create types of question
		TypeQuestion type1 = new TypeQuestion();
		type1.typeId = 1;
		type1.name = TypeName.ESSAY;

		TypeQuestion type2 = new TypeQuestion();
		type2.typeId = 2;
		type2.name = TypeName.MULTIPLE_CHOICE;

		// Create categories of question
		CategoryQuestion category1 = new CategoryQuestion();
		category1.categoryId = 1;
		category1.categoryName = "Java";

		CategoryQuestion category2 = new CategoryQuestion();
		category2.categoryId = 2;
		category2.categoryName = ".NET";

		CategoryQuestion category3 = new CategoryQuestion();
		category3.categoryId = 3;
		category3.categoryName = "SQL";

		// Create questions
		Question question1 = new Question();
		question1.questionId = 1;
		question1.content = "Question 1";
		question1.category = category1;
		question1.type = type1;
		question1.creator = account1;
		question1.createDate = LocalDate.of(2020, 6, 1);

		Question question2 = new Question();
		question2.questionId = 2;
		question2.content = "Question 2";
		question2.category = category2;
		question2.type = type2;
		question2.creator = account2;
		question2.createDate = LocalDate.of(2020, 6, 2);

		Question question3 = new Question();
		question3.questionId = 3;
		question3.content = "Question 3";
		question3.category = category3;
		question3.type = type1;
		question3.creator = account3;
		question3.createDate = LocalDate.of(2020, 6, 3);

		// Create answers
		Answer answer1 = new Answer();
		answer1.answerId = 1;
		answer1.content = "Answer 1";
		answer1.question = question1;
		answer1.isCorrect = true;

		Answer answer2 = new Answer();
		answer2.answerId = 2;
		answer2.content = "Answer 2";
		answer2.question = question2;
		answer2.isCorrect = false;

		Answer answer3 = new Answer();
		answer3.answerId = 3;
		answer3.content = "Answer 3";
		answer3.question = question3;
		answer3.isCorrect = true;

		// Create exams
		Exam exam1 = new Exam();
		exam1.examId = 1;
		exam1.code = "Code 1";
		exam1.title = "Title 1";
		exam1.category = category1;
		exam1.duration = 60;
		exam1.creator = account1;
		exam1.createDate = LocalDate.of(2020, 6, 1);

		Exam exam2 = new Exam();
		exam2.examId = 2;
		exam2.code = "Code 2";
		exam2.title = "Title 2";
		exam2.category = category2;
		exam2.duration = 90;
		exam2.creator = account2;
		exam2.createDate = LocalDate.of(2020, 6, 2);

		Exam exam3 = new Exam();
		exam3.examId = 3;
		exam3.code = "Code 3";
		exam3.title = "Title 3";
		exam3.category = category3;
		exam3.duration = 180;
		exam3.creator = account3;
		exam3.createDate = LocalDate.of(2020, 6, 3);

		Exam[] examsOfQuestion1 = { exam1, exam2 };
		question1.exams = examsOfQuestion1;

		Exam[] examsOfQuestion2 = { exam2, exam3 };
		question2.exams = examsOfQuestion2;

		Exam[] examsOfQuestion3 = { exam1, exam3 };
		question3.exams = examsOfQuestion3;

		Question[] questionsOfExam1 = { question1, question3 };
		exam1.questions = questionsOfExam1;

		Question[] questionsOfExam2 = { question1, question2 };
		exam2.questions = questionsOfExam2;

		Question[] questionsOfExam3 = { question2, question3 };
		exam3.questions = questionsOfExam3;

//		Question 2:
//			In ra thông tin: Exam đã tạo ngày nào theo định dạng
//			Năm – tháng – ngày – giờ – phút – giây
//..................................................................................

//		String pattern = "yyyy-MM-dd-HH-mm-ss";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);   // tai sao lai loi o date  ( ngày không thể được giải quyết cho một biến)
//		Exam[] exams = { exam1, exam2, exam3 };
//		for (Exam exam : exams) {
//			date = simpleDateFormat.format(exam.createDate);
//			System.out.println(exam.code + ": " + date);
//
//		}
		
//		Question 3:
//			Chỉ in ra năm của create date property trong Question 2
//.................................................................................
//		String pattern = "yyyy";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//		Exam[] exams = { exam1, exam2, exam3 };
//		for (Exam exam : exams) {
//		date = simpleDateFormat.format(exam.createDate);
//		System.out.println(exam.code + ": " + date);
//		}
		
//		Question 4:
//			Chỉ in ra tháng và năm của create date property trong Question 2
//.........................................................................................		
//		String pattern = "yyyy-MM";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//		Exam[] exams = { exam1, exam2, exam3 };
//		for (Exam exam : exams) {
//		date = simpleDateFormat.format(exam.createDate);System.out.println(exam.code + ": " + date);
//		}
		
//		Question 5:
//			Chỉ in ra "MM-DD" của create date trong Question 2
		
//		String pattern = "MM-dd";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//		Exam[] exams = { exam1, exam2, exam3 };
//		for (Exam exam : exams) {
//		date = simpleDateFormat.format(exam.createDate);
//		System.out.println(exam.code + ": " + date);
//		}




		
		
		
	}

}
