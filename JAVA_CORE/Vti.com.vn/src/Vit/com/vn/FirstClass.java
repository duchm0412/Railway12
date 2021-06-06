package Vit.com.vn;

import java.util.Date;

public class FirstClass {

	public static void main(String[] args) {
		Department dep = new Department();
		dep.id =1;
		dep.departmentName = "Phong Sale";
		System.out.println("id: " + dep.id);
		System.out.println
		("departmentName: " + dep.departmentName );
		Position pos = new Position();
		pos.id =2;
		pos.positionName = PositionName.DEV;
		System.out.println("id: " + pos.id);
		System.out.println
		("positionName: " + pos.positionName );
		
		Group gro1 = new Group();
		gro1.id = 1;
		gro1.groupName = "Group 1";
		
		Group gro2 = new Group();
		gro2.id = 1;
		gro2.groupName = "Group 2";
		
		Group gro3 = new Group();
		gro3.id = 1;
		gro3.groupName = "Group 3";
	
		Account acc = new Account();
		acc.id = 5;
		acc.email = "minhducjojo1999@gmail.com";
		acc.fullName = "Hoang Minh Duc" ;
		acc.userName = "hoangminhduc";
		acc.department = dep;
		acc.position = pos;
		Date date = new Date();
		acc.createDate = date;
		Group[] dsNhom = {gro1, gro2, gro3};
		acc.dsNhom = dsNhom;
		
		System.out.println("ID nhan vien: " + acc.id);
		System.out.println("Ten nhan vien: " + acc.fullName );
		System.out.println("Email nhan vien: " + acc.email );
		System.out.println("Phong ban nhaan vien: " + acc.department.departmentName);
		System.out.println("Vi tri nhan vien: " + acc.position.positionName);
		System.out.println("Ngay vao cong ty: " + acc.createDate.toString()); // cho ngay thanh kieu chuoi
		System.out.println(" Nhan vien o trong nhom: ");
		for (int i = 0; i < acc.dsNhom.length; i++) {
			System.out.println(acc.dsNhom[i].groupName);
		}			
	}}
		// TODO Auto-generated method stub
//		int a = 1;
//		int b = 5;
//		char c;
//		int[] mangSo = { 1, 2, 3, 5 ,7, 100, 88 };
////		System.out.println("Do dai cua mang" + mangSo.length);
//		
//		// String hoTen ="Hoang Minh Duc";
//		// System.out.println("Hello world");
//		// System.out.println("Ten toi la: " + hoTen);
//		// System.out.println("Tong cua " + a + " va " + b + " la: " + (a + b));
////		for (int i = 0; i < mangSo.length; i++)
////			System.out.println("So thu " + i );
//		for (int i = 0; i < mangSo.length; i++)
//			System.out.println("So thu " + i + " la: " + mangSo[i]);
//	}
//
//}
