package BaiTapLamThem;

import java.util.Scanner;

public class TinhToanHoc {

	public static void main(String[] args) {
		soChiaHetCho7 ();
	}
	
// 1. tinh chu vi hinh chu nhat
//		Scanner scanner = new Scanner(System.in);
//		System.out.println("moi ban nhap vao chieu rong :");
//		int chieuRong = scanner.nextInt();
//		System.out.println("moi ban nhap vao chieu dai :");
//		int chieuDai = scanner.nextInt();
//		
//		int chuVi = chuViHinhChuNhat (chieuRong, chieuDai);
//		System.out.println("Chu vi hinh chu nhat la: " + chuVi);
//	}
//	
//			
//	public static int chuViHinhChuNhat(int chieuRong, int chieuDai) {
//	int chuVi = (chieuRong + chieuDai)*2;
//	return chuVi;
//	}

// 2 - viết hàm tính diện tích hình vuông.	

//		Scanner scanner = new Scanner(System.in);
//		System.out.println("moi ban nhap vao canh hinh vuong :");
//		int canh = scanner.nextInt();
//		int dienTich = dienTichHinhVuong(canh);
//		System.out.println("Dien tich hinh vuong la: " + dienTich);
//	}
//
//	public static int dienTichHinhVuong(int canh) {
//		int chuVi = canh * 2;
//		return chuVi;
//	}

		
// 3 - Viết chương trình tìm tất cả các số chia hết cho 7 nhưng không phải bội số của 5, nằm trong đoạn 10 và 200
		
	

	public static void soChiaHetCho7 () {
		for (int i = 10 ; i < 200 ; i++ ) {
			if ( i % 7 == 0 &&  i % 5 != 0 ) {
				System.out.println(i + "  ");
			}
			
		}
	
	}	

}

