package assignment2_java;

import java.time.LocalDate;

public class Question {
	int questionId;
	String content;
	CategoryQuestion category;
	TypeQuestion type;
	Account creator;
	LocalDate createDate;
	Exam[] exams;
}
