package com.test.jsp.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.jsp.dto.UserInfo;



public interface UserService {//UserService는 인터페이스로 만들고 , UserServiceinput은 설계서 보고 자바파일로 만듬
	//public ArrayList<HashMap<String,String>> getUserList();
	public ArrayList<UserInfo> getUserList();
	//public HashMap<String,String> getUser(String id, String pwd)throws ClassNotFoundException, SQLException; //20171211
	public UserInfo getUser(String id, String pwd)throws ClassNotFoundException, SQLException;
	public UserInfo getUser(int userNo);
	public int insertUser(HashMap hm);
	public int insertUser(UserInfo ui);//원래는 HashMap으로 보냈었음
	public int deleteUser(UserInfo ui);
	int updateUser(UserInfo ui);
}
