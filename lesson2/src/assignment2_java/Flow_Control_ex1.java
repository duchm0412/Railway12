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
//			Ki???m tra account th??? 2
//			N???u kh??ng c?? ph??ng ban (t???c l?? department == null) th?? s??? in ra text 
//			"Nh??n vi??n n??y ch??a c?? ph??ng ban"
//			N???u kh??ng th?? s??? in ra text "Ph??ng ban c???a nh??n vi??n n??y l?? ???"
//.........................................................................................
//		if (account2.department == null) {
//			System.out.println("Nh??n vi??n n??y ch??a c?? ph??ng ban");
//		} else {
//			System.out.println("Ph??ng ban c???a nh??n vi??n n??y l??: " + account2.department.departmentName);
//		}

//		// Question 2: 
//		Ki???m tra account th??? 2
//		N???u kh??ng c?? group th?? s??? in ra text "Nh??n vi??n n??y ch??a c?? group"
//		N???u c?? m???t trong 1 ho???c 2 group th?? s??? in ra text "Group c???a nh??n vi??n 
//		n??y l?? Java Fresher, C# Fresher"
//		N???u c?? m???t trong 3 Group th?? s??? in ra text "Nh??n vi??n n??y l?? ng?????i 
//		quan tr???ng, tham gia nhi???u group"
//		N???u c?? m???t trong 4 group tr??? l??n th?? s??? in ra text "Nh??n vi??n n??y l?? 
//		ng?????i h??ng chuy???n, tham gia t???t c??? c??c group"
//..................................................................................

//		if (account2.groups == null) {
//			System.out.println("Nh??n vi??n n??y ch??a c?? group");
//		} else {
//			int countGroup = account2.groups.length;
//			if (countGroup == 1 || countGroup == 2) {
//				System.out.println("Group c???a nh??n vi??n n??y l??: ");
//				for (Group group : groupsOfAccount2) {
//					System.out.println(group.groupName);
//				}
//			}
//
//			if (countGroup == 3) {
//				System.out.println("Nh??n vi??n n??y l?? ng?????i quan tr???ng, tham gia nhi???u group");
//			}
//			if (countGroup >= 4) {
//				System.out.println("Nh??n vi??n n??y l?? ng?????i h??ng chuy???n, tham gia t???t c??? c??c group");
//			}
//			System.out.println("\n");
//		}

//		Question 3:
//			S??? d???ng to??n t??? ternary ????? l??m Question 1
		// ................................................................

//		System.out.println(account2.department == null ? "Nh??n vi??n n??y ch??a c?? ph??ng ban"
//				: "Ph??ng ban c???a nh??n vi??n n??y l??: " + account2.department.departmentName);
//		System.out.println("\n");

//		Question 4:
//			S??? d???ng to??n t??? ternary ????? l??m y??u c???u sau:
//			Ki???m tra Position c???a account th??? 1
//			N???u Position = Dev th?? in ra text "????y l?? Developer"
//			N???u kh??ng ph???i th?? in ra text "Ng?????i n??y kh??ng ph???i l?? Developer"
//.....................................................................................
//		System.out.println(account1.position.positionName == PositionName.DEV ? "????y l?? Developer"
//				: "Ng?????i n??y kh??ng ph???i l?? Developer");

// SWITCH CASE		

//		Question 5:
//			L???y ra s??? l?????ng account trong nh??m th??? 1 v?? in ra theo format sau:
//			N???u s??? l?????ng account = 1 th?? in ra "Nh??m c?? m???t th??nh vi??n"
//			N???u s??? l?????ng account = 2 th?? in ra "Nh??m c?? hai th??nh vi??n"
//			N???u s??? l?????ng account = 3 th?? in ra "Nh??m c?? ba th??nh vi??n"
//			C??n l???i in ra "Nh??m c?? nhi???u th??nh vi??n"
//................................................................................................
//		switch (group1.accounts.length) { // NUll khac voi khoang trang "case 0"
//		case 1:
//			System.out.println("Nh??m c?? m???t th??nh vi??n");
//			break;
//		case 2:
//			System.out.println("Nh??m c?? hai th??nh vi??n");
//			break;
//		case 3:
//			System.out.println("Nh??m c?? ba th??nh vi??n");
//			break;
//
//		default:
//			System.out.println("Nh??m c?? nhi???u th??nh vi??n");
//			break;
//		}

//		Question 6:
//			S??? d???ng switch case ????? l??m l???i Question 2
//....................................................................................................
//		switch (group2.accounts.length) {
//		case 0:
//			System.out.println("Nh??n vi??n n??y ch??a c?? group");
//			break;
//		case 1:
//		case 2:
//			System.out.println("Group c???a nh??n vi??n n??y l??:");
//			for (Group group : groupsOfAccount2) {
//				System.out.println(group.groupName);
//			}
//			break;
//		case 3:
//			System.out.println("Nh??n vi??n n??y l?? ng?????i quan tr???ng, tham gia nhi???u group");
//			break;
//		case 4:
//			System.out.println("Nh??n vi??n n??y l?? ng?????i h??ng chuy???n, tham gia t???t c??? c??c group");
//			break;
//		default:
//			break;
//		}
//		System.out.println("\n");

//		Question 7:
//			S??? d???ng switch case ????? l??m l???i Question 4

//.........................................................................
//		String positionName = account1.position.positionName.toString(); // khai b??o string tr?????c
//		switch (positionName) {
//		case "Dev":
//		System.out.println("????y l?? Developer");
//		break;
//		default:
//		System.out.println("Ng?????i n??y kh??ng ph???i l?? Developer");
//		break;
//		}

		// FOREACH

//		Question 8: 
//			In ra th??ng tin c??c account bao g???m: Email, FullName v?? t??n ph??ng ban c???a h???
//................................................................................................
//		Account[] accounts = { account1, account2, account3 };
//		for (int j = 0; j < accounts.length; j++) {
//			System.out.println("Th??ng tin account th??? " +(j+1) + " l??:");
//			System.out.println("Email: " + accounts[j].email);
//			System.out.println("Full Name: " + accounts[j].fullName);
//			System.out.println("Ph??ng ban: " + accounts[j].department.departmentName);
//			System.out.println("\n");
//		}
//		

//		Question 9:
//			In ra th??ng tin c??c ph??ng ban bao g???m: id v?? name
//...........................................................................................
//		Department[] departments = { department1, department2, department3 };
//		int i = 0;
//		for (Department department : departments) {
//			System.out.println("Th??ng tin department th??? " + (i+1) + " l??:");
//			System.out.println("Id: " + department.departmentId);
//			System.out.println("Name: " + department.departmentName);
//			System.out.println("\n");
//			i++;
//		}

//		Question 10:
//			In ra th??ng tin c??c account bao g???m: Email, FullName v?? t??n ph??ng ban c???a
//			h??? theo ?????nh d???ng nh?? sau:
//			Th??ng tin account th??? 1 l??:
//			Email: NguyenVanA@gmail.com
//			Full name: Nguy???n V??n A
//			Ph??ng ban: Sale
//			Th??ng tin account th??? 2 l??:
//			Email: NguyenVanB@gmail.com
//			Full name: Nguy???n V??n B
//			Ph??ng ban: Marketting

// ....................................................................................		
//		Account[] accounts = { account1, account2 };
//		for (int i = 0; i < accounts.length; i++) {
//			System.out.println("Th??ng tin account th??? " + (i + 1) + " l??:");
//			System.out.println("Email: " + accounts[i].email);
//			System.out.println("Full Name: " + accounts[i].fullName);
//			System.out.println("Ph??ng ban: " + accounts[i].department.departmentName);
//			System.out.println("\n");
//		}

		// Question 11
//		In ra th??ng tin c??c ph??ng ban bao g???m: id v?? name theo ?????nh d???ng sau:
//			Th??ng tin department th??? 1 l??:
//			Id: 1
//			Name: Sale
//			Th??ng tin department th??? 2 l??:
//			Id: 2
//			Name: Marketing
//........................................................................................
//		Department[] departments = { department1, department2};
//		for (int i = 0; i < departments.length; i++) {
//			System.out.println("Th??ng tin department th??? " + (i + 1) + " l??:");
//			System.out.println("Id: " + departments[i].departmentId);
//			System.out.println("Name: " + departments[i].departmentName);
//			System.out.println("\n");
//		}

//Question 12: 	Ch??? in ra th??ng tin 2 department ?????u ti??n theo ?????nh d???ng nh?? Question 10
//.......................................................................................

//	 Department[] departments = {department1, department2, department3 };
//	 for ( int i=0 ; i< 2 ; i++) {
//			System.out.println("Th??ng tin department th??? " + (i + 1) + " l??:");
//			System.out.println("Id: " + departments[i].departmentId);
//			System.out.println("Name: " + departments[i].departmentName);
//			System.out.println("\n");	 
//	 }

//		Question 13:
//			In ra th??ng tin t???t c??? c??c account ngo???i tr??? account th??? 2
//......................................................................................

//		Account[]  accounts = { account1, account2, account3};
//		for ( int i =0; i < accounts.length; i++) {
//			if (i != 1) {
//				System.out.println("Th??ng tin account th??? " + (i + 1) + " l??:");
//				System.out.println("Email: " + accounts[i].email);
//				System.out.println("Full Name: " + accounts[i].fullName);
//				System.out.println("Ph??ng ban: " + accounts[i].department.departmentName);
//				System.out.println("\n");
//			}
//		}

//		Question 14: In ra th??ng tin t???t c??? c??c account c?? id < 4
//......................................................................................

//		Account[]  accounts = { account1, account2, account3};
//		for ( int i =0; i < accounts.length; i++) {
//			if (accounts[i].accountId < 4) {
//				System.out.println("Th??ng tin account th??? " + (i + 1) + " l??:");
//				System.out.println("Email: " + accounts[i].email);
//				System.out.println("Full Name: " + accounts[i].fullName);
//				System.out.println("Ph??ng ban: " + accounts[i].department.departmentName);
//				System.out.println("\n");
//			}
//		}

//		Question 15:
//			In ra c??c s??? ch???n nh??? h??n ho???c b???ng 20

//		for ( int i = 0 ; i <= 20 ; i++) {
//			if(i%2 == 0){
//				System.out.println("Cac so chan la : " + i + "  ");
//				
//			}
//		}

		// WHILE

//		Question 16-10:
//			L??m l???i c??c Question ??? ph???n FOR b???ng c??ch s??? d???ng WHILE k???t h???p v???i
//			l???nh break, continue
//....................................................................................
//		Account[] accounts = { account1, account2, account3 };
//		int i = 0;
//		while (i < accounts.length) {
//			System.out.println("Th??ng tin account th??? " + (i + 1) + " l??:");
//			System.out.println("Email: " + accounts[i].email);
//			System.out.println("Full Name: " + accounts[i].fullName);
//			System.out.println("Ph??ng ban: " + accounts[i].department.departmentName);
//			System.out.println("\n");
//			i++;
//		}
//  Question 16- 15: In ra c??c s??? ch???n nh??? h??n ho???c b???ng 20
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
//		L??m l???i c??c Question ??? ph???n FOR b???ng c??ch s??? d???ng DO-WHILE k???t h???p v???i
//		l???nh break, continue
		
//		Question 17-10: In ra th??ng tin c??c account bao g???m: Email, 
//		FullName v?? t??n ph??ng ban c???a h??? theo ?????nh d???ng
		
//...........................................................................................
		
//		Account[] accounts = {account1, account2, account3};
//		int i = 0;
//		do { 
//			System.out.println("Th??ng tin account th??? " + (i + 1) + " l??:");
//			System.out.println("Email: " + accounts[i].email);
//			System.out.println("Full Name: " + accounts[i].fullName);
//			System.out.println("Ph??ng ban: " + accounts[i].department.departmentName);
//			System.out.println("\n");	
//			i++;
//		}
//		while (i < accounts.length ) ;
		
		
// Question 17- 15: In ra c??c s??? ch???n nh??? h??n ho???c b???ng 20
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
