package assignment2_java;

import java.time.LocalDate;

public class Exam {
	int examId;
	String code;
	String title;
	CategoryQuestion category;
	int duration;
	Account creator;
	LocalDate createDate;
	Question[] questions;
}
