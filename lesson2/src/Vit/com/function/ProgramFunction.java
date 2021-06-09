package Vit.com.function;

import java.util.Scanner;

import com.sun.source.tree.WhileLoopTree;

public class ProgramFunction {

	public static void main(String[] args) {
		int nhap;
		System.out.println("Chao mung ban den voi ngan hang VTI");
		do {
			
		Scanner scanner = new Scanner(System.in);				
		System.out.println("Moi ban chon chuc nang: ");
		System.out.println("1. Rut tien");
		System.out.println("2. Chuyen tien");
		System.out.println("3. Truy van giao dich");
		System.out.println("4. Thanh toan hoa don");
		System.out.println("5. thoat");
	    nhap = scanner.nextInt();
		ATM(nhap );
		} while (nhap != 5);

		}

//		int tongHaiSo = tongCuaHaiso(2, 6);
//		int tongHaiSoKhac = tongCuaHaiso(3, 7);
//		System.out.println(tongHaiSo);
//		System.out.println(tongHaiSoKhac);
////		hienThiTen();
//		
//
//	}
//	public static int tongCuaHaiso(int a, int b ) {
//		int tong = a+b;
//		return tong;	
//	}
//	//...............................................
////	public static void hienThiTen() {
////		System.out.println("Toi la ai, day la dau???");
//.......................................................
	// Viet 1 ham nhap vao ten va sau do in ten cuar nguoi do
//	public static String nhapTen() {
//		Scanner scanner = new Scanner(System.in);
//		System.out.print("Nhap ten: ");
//		String hoTen = scanner.nextLine();
//		return hoTen;
//	}
	//.......................................................
	
public static void ATM (int nhap) {
	switch (nhap) {
	case 1: System.out.println("1. Rut tien");
		break;
	case 2:System.out.println("2. Chuyen tien");
		break;
	case 3:System.out.println("3. Truy van giao dich");
		break;
	case 4:System.out.println("4. Thanh toan hoa don");
		break;
	default:
		System.out.println("cam on va tran trong.");
		break;
	}
			
	}
}
