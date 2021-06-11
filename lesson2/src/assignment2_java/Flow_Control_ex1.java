package assignment2_java;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.Locale;



public class Flow_Control_ex1 {

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
// 		IF
//		Question 1:
//			Kiểm tra account thứ 2
//			Nếu không có phòng ban (tức là department == null) thì sẽ in ra text 
//			"Nhân viên này chưa có phòng ban"
//			Nếu không thì sẽ in ra text "Phòng ban của nhân viên này là …"
//.........................................................................................
//		if (account2.department == null) {
//			System.out.println("Nhân viên này chưa có phòng ban");
//		} else {
//			System.out.println("Phòng ban của nhân viên này là: " + account2.department.departmentName);
//		}

//		// Question 2: 
//		Kiểm tra account thứ 2
//		Nếu không có group thì sẽ in ra text "Nhân viên này chưa có group"
//		Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text "Group của nhân viên 
//		này là Java Fresher, C# Fresher"
//		Nếu có mặt trong 3 Group thì sẽ in ra text "Nhân viên này là người 
//		quan trọng, tham gia nhiều group"
//		Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là 
//		người hóng chuyện, tham gia tất cả các group"
//..................................................................................

//		if (account2.groups == null) {
//			System.out.println("Nhân viên này chưa có group");
//		} else {
//			int countGroup = account2.groups.length;
//			if (countGroup == 1 || countGroup == 2) {
//				System.out.println("Group của nhân viên này là: ");
//				for (Group group : groupsOfAccount2) {
//					System.out.println(group.groupName);
//				}
//			}
//
//			if (countGroup == 3) {
//				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
//			}
//			if (countGroup >= 4) {
//				System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
//			}
//			System.out.println("\n");
//		}

//		Question 3:
//			Sử dụng toán tử ternary để làm Question 1
		// ................................................................

//		System.out.println(account2.department == null ? "Nhân viên này chưa có phòng ban"
//				: "Phòng ban của nhân viên này là: " + account2.department.departmentName);
//		System.out.println("\n");

//		Question 4:
//			Sử dụng toán tử ternary để làm yêu cầu sau:
//			Kiểm tra Position của account thứ 1
//			Nếu Position = Dev thì in ra text "Đây là Developer"
//			Nếu không phải thì in ra text "Người này không phải là Developer"
//.....................................................................................
//		System.out.println(account1.position.positionName == PositionName.DEV ? "Đây là Developer"
//				: "Người này không phải là Developer");

// SWITCH CASE		

//		Question 5:
//			Lấy ra số lượng account trong nhóm thứ 1 và in ra theo format sau:
//			Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
//			Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên"
//			Nếu số lượng account = 3 thì in ra "Nhóm có ba thành viên"
//			Còn lại in ra "Nhóm có nhiều thành viên"
//................................................................................................
//		switch (group1.accounts.length) { // NUll khac voi khoang trang "case 0"
//		case 1:
//			System.out.println("Nhóm có một thành viên");
//			break;
//		case 2:
//			System.out.println("Nhóm có hai thành viên");
//			break;
//		case 3:
//			System.out.println("Nhóm có ba thành viên");
//			break;
//
//		default:
//			System.out.println("Nhóm có nhiều thành viên");
//			break;
//		}

//		Question 6:
//			Sử dụng switch case để làm lại Question 2
//....................................................................................................
//		switch (group2.accounts.length) {
//		case 0:
//			System.out.println("Nhân viên này chưa có group");
//			break;
//		case 1:
//		case 2:
//			System.out.println("Group của nhân viên này là:");
//			for (Group group : groupsOfAccount2) {
//				System.out.println(group.groupName);
//			}
//			break;
//		case 3:
//			System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
//			break;
//		case 4:
//			System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
//			break;
//		default:
//			break;
//		}
//		System.out.println("\n");

//		Question 7:
//			Sử dụng switch case để làm lại Question 4

//.........................................................................
//		String positionName = account1.position.positionName.toString(); // khai báo string trước
//		switch (positionName) {
//		case "Dev":
//		System.out.println("Đây là Developer");
//		break;
//		default:
//		System.out.println("Người này không phải là Developer");
//		break;
//		}

		// FOREACH

//		Question 8: 
//			In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ
//................................................................................................
//		Account[] accounts = { account1, account2, account3 };
//		for (int j = 0; j < accounts.length; j++) {
//			System.out.println("Thông tin account thứ " +(j+1) + " là:");
//			System.out.println("Email: " + accounts[j].email);
//			System.out.println("Full Name: " + accounts[j].fullName);
//			System.out.println("Phòng ban: " + accounts[j].department.departmentName);
//			System.out.println("\n");
//		}
//		

//		Question 9:
//			In ra thông tin các phòng ban bao gồm: id và name
//...........................................................................................
//		Department[] departments = { department1, department2, department3 };
//		int i = 0;
//		for (Department department : departments) {
//			System.out.println("Thông tin department thứ " + (i+1) + " là:");
//			System.out.println("Id: " + department.departmentId);
//			System.out.println("Name: " + department.departmentName);
//			System.out.println("\n");
//			i++;
//		}

//		Question 10:
//			In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của
//			họ theo định dạng như sau:
//			Thông tin account thứ 1 là:
//			Email: NguyenVanA@gmail.com
//			Full name: Nguyễn Văn A
//			Phòng ban: Sale
//			Thông tin account thứ 2 là:
//			Email: NguyenVanB@gmail.com
//			Full name: Nguyễn Văn B
//			Phòng ban: Marketting

// ....................................................................................		
//		Account[] accounts = { account1, account2 };
//		for (int i = 0; i < accounts.length; i++) {
//			System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//			System.out.println("Email: " + accounts[i].email);
//			System.out.println("Full Name: " + accounts[i].fullName);
//			System.out.println("Phòng ban: " + accounts[i].department.departmentName);
//			System.out.println("\n");
//		}

		// Question 11
//		In ra thông tin các phòng ban bao gồm: id và name theo định dạng sau:
//			Thông tin department thứ 1 là:
//			Id: 1
//			Name: Sale
//			Thông tin department thứ 2 là:
//			Id: 2
//			Name: Marketing
//........................................................................................
//		Department[] departments = { department1, department2};
//		for (int i = 0; i < departments.length; i++) {
//			System.out.println("Thông tin department thứ " + (i + 1) + " là:");
//			System.out.println("Id: " + departments[i].departmentId);
//			System.out.println("Name: " + departments[i].departmentName);
//			System.out.println("\n");
//		}

//Question 12: 	Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
//.......................................................................................

//	 Department[] departments = {department1, department2, department3 };
//	 for ( int i=0 ; i< 2 ; i++) {
//			System.out.println("Thông tin department thứ " + (i + 1) + " là:");
//			System.out.println("Id: " + departments[i].departmentId);
//			System.out.println("Name: " + departments[i].departmentName);
//			System.out.println("\n");	 
//	 }

//		Question 13:
//			In ra thông tin tất cả các account ngoại trừ account thứ 2
//......................................................................................

//		Account[]  accounts = { account1, account2, account3};
//		for ( int i =0; i < accounts.length; i++) {
//			if (i != 1) {
//				System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//				System.out.println("Email: " + accounts[i].email);
//				System.out.println("Full Name: " + accounts[i].fullName);
//				System.out.println("Phòng ban: " + accounts[i].department.departmentName);
//				System.out.println("\n");
//			}
//		}

//		Question 14: In ra thông tin tất cả các account có id < 4
//......................................................................................

//		Account[]  accounts = { account1, account2, account3};
//		for ( int i =0; i < accounts.length; i++) {
//			if (accounts[i].accountId < 4) {
//				System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//				System.out.println("Email: " + accounts[i].email);
//				System.out.println("Full Name: " + accounts[i].fullName);
//				System.out.println("Phòng ban: " + accounts[i].department.departmentName);
//				System.out.println("\n");
//			}
//		}

//		Question 15:
//			In ra các số chẵn nhỏ hơn hoặc bằng 20

//		for ( int i = 0 ; i <= 20 ; i++) {
//			if(i%2 == 0){
//				System.out.println("Cac so chan la : " + i + "  ");
//				
//			}
//		}

		// WHILE

//		Question 16-10:
//			Làm lại các Question ở phần FOR bằng cách sử dụng WHILE kết hợp với
//			lệnh break, continue
//....................................................................................
//		Account[] accounts = { account1, account2, account3 };
//		int i = 0;
//		while (i < accounts.length) {
//			System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//			System.out.println("Email: " + accounts[i].email);
//			System.out.println("Full Name: " + accounts[i].fullName);
//			System.out.println("Phòng ban: " + accounts[i].department.departmentName);
//			System.out.println("\n");
//			i++;
//		}
//  Question 16- 15: In ra các số chẵn nhỏ hơn hoặc bằng 20
//................................................................................
//		int i = 0;
//		while (i <= 20) {
//			if (i % 2 == 0) {
//				System.out.println("sp nay la so chan : " + i + " ");
//			}
//			i++;
//
//		}
		
		
//		DO-WHILE
//		Question 17:
//		Làm lại các Question ở phần FOR bằng cách sử dụng DO-WHILE kết hợp với
//		lệnh break, continue
		
//		Question 17-10: In ra thông tin các account bao gồm: Email, 
//		FullName và tên phòng ban của họ theo định dạng
		
//...........................................................................................
		
//		Account[] accounts = {account1, account2, account3};
//		int i = 0;
//		do { 
//			System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//			System.out.println("Email: " + accounts[i].email);
//			System.out.println("Full Name: " + accounts[i].fullName);
//			System.out.println("Phòng ban: " + accounts[i].department.departmentName);
//			System.out.println("\n");	
//			i++;
//		}
//		while (i < accounts.length ) ;
		
		
// Question 17- 15: In ra các số chẵn nhỏ hơn hoặc bằng 20
//.............................................................................
//		int i = 1; 
//		do {
//			if (i % 2 == 0 ) {
//			System.out.println("Day la so chan do :" + i + " " );
//			}
//			i++;
//		}
//		while (i <= 20 );
		
				
	};

}
