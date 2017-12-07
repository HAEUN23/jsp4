package com.test.jsp.service;

import java.util.ArrayList;
import java.util.HashMap;



public interface UserService {//UserService는 인터페이스로 만들고 , UserServiceinput은 설계서 보고 자바파일로 만듬
	public ArrayList<HashMap<String,String>> getUserList();

	public static void main(String[] args) {
	}

}
