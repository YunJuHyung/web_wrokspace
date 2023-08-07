package sample.main;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import sample.dao.JBuyDao;
import sample.dao.JCustomerDao;
import sample.dao.JProductDao;
import sample.dto.JBuyDto;
import sample.dto.JProductDto;

public class MyMallMain {

	public static void main(String[] args) {
		// Dao 클래스 객체 생성
		JCustomerDao customDao = new JCustomerDao();
		JProductDao productDao = new JProductDao();
		JBuyDao buyDao = new JBuyDao();

		System.out.println(":::::::::::::차일도 쇼핑몰에 오신걸 환영합니다.:::::::::::::");
		System.out.println(">>>>상품 목록<<<<");
		List<JProductDto> allPrdList = null;
		try {
			allPrdList = productDao.selectAll();
		} catch (SQLException e) {
			System.out.println("오류 발생 : " + e.getMessage());
		} // try~catch 상품 목록 로딩
		for (JProductDto jp : allPrdList) {
			System.out.println(jp);
		} // foreach 출력문

		System.out.println("\n>>>> 상품명으로 검색하기 <<<<");
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 상품명 입력 : ");
		String pname = sc.nextLine();

		List<JProductDto> findPrdList = null;
		try {
			findPrdList = productDao.selectByPname(pname);
		} catch (SQLException e) {
			System.out.println("오류 발생 : " + e.getMessage());
		}// try~catch 상품 목록 로딩
		for (JProductDto jp : findPrdList) {
			System.out.println(jp);
		} // foreach 출력문

		System.out.println("\n상품 장바구니 담기");
		List<JBuyDto> carts = new ArrayList<>();
		System.out.print("검색할 상품명 입력 : ");
		String pname_buy = sc.nextLine();

		try {
			findPrdList = productDao.selectByPname(pname_buy);
		} catch (SQLException e) {
			System.out.println("오류 발생 : " + e.getMessage());
		}// try~catch 상품 목록 로딩
		
	}// main

}// MyMallMain
