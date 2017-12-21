package com.test.jsp.dao;//DAO는 CRUD만 있으면된다.

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.test.jsp.dto.DepartInfo;

public interface DepartDAO {
	public ArrayList<DepartInfo> selectDepartList() throws SQLException;
	public DepartInfo selectDepart();
	public void updateDepart();
	public void insertDepart();	


}
