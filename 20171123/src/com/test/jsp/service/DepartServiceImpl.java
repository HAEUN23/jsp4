package com.test.jsp.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.test.jsp.common.DBCon;
import com.test.jsp.dao.DepartDAO;
import com.test.jsp.dao.DepartDAOImpl;
import com.test.jsp.dto.DepartInfo;

public class DepartServiceImpl implements DepartService{

	@Override
	public ArrayList<DepartInfo> selectDepartList() {
		ArrayList<DepartInfo> departList=new ArrayList<DepartInfo>();
		DBCon dbCon =new DBCon();
		try {
			DepartDAO ddao=new DepartDAOImpl(dbCon.getConnection());
			departList=ddao.selectDepartList();
		} 
		catch (ClassNotFoundException e) {e.printStackTrace();} 
		catch (SQLException e) {e.printStackTrace();}
		finally {
			try {dbCon.closeCon();}
			catch(SQLException e) {e.printStackTrace();}
		}
		return departList;
	}
	
	@Override
	public DepartInfo selectDepart() {
		
	}
	
	@Override
	public DepartInfo selectDepart(int diNo) {
		
	}

	@Override
	public void updateDepart(HttpServletRequest req) {
		
	}

	@Override
	public void insertDepart(HttpServletRequest req) {
		
	}
	

}
