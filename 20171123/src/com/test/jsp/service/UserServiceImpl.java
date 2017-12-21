package com.test.jsp.service; //mariadb의 데이터 불러오는 곳

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.jsp.common.DBCon;
import com.test.jsp.dto.UserInfo;

public class UserServiceImpl implements UserService{ //자바-인터페이스 부분 다시 공부해야 함.
	public UserInfo getUser(String id, String pwd) throws ClassNotFoundException, SQLException{
	//public HashMap<String,String> getUser(String id, String pwd) throws ClassNotFoundException, SQLException{//20171211
		//HashMap<String,String> hm=new HashMap<String,String>();
		DBCon dbCon=new DBCon();
		Connection con=dbCon.getConnection();
		String sql="select * from user_info ui,"+" depart_info di"+" where ui.dino=di.dino";
		sql+=" and ui.userid=? and ui.userpwd=?";//바인딩함수로 해줘야 내용 보호 가능 //and앞에 띄어쓰기 꼭해야함
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);//위의 sql에서 ?이거 첫번째꺼에 id로 넣어주겠다=바꾸겠다 는 의미
		ps.setString(2, pwd);//바인딩함수
		ResultSet rs=ps.executeQuery();
		UserInfo ui=null;
		while(rs.next()) {
			ui=new UserInfo();
			/*hm.put("userno", rs.getString("userno"));
			hm.put("username", rs.getString("username"));
			hm.put("userid", rs.getString("userid"));
			hm.put("userpwd", rs.getString("userpwd"));
			hm.put("userage", rs.getString("userage"));
			hm.put("dino", rs.getString("dino"));
			hm.put("useraddress", rs.getString("useraddress"));
			hm.put("diname", rs.getString("diname"));
			hm.put("dietc", rs.getString("dietc"));*/
			ui.setUserNo(rs.getInt("userno"));
			ui.setUserName(rs.getString("username"));
			ui.setUserId(rs.getString("userid"));
			ui.setUserPwd(rs.getString("userpwd"));
			ui.setUserAge(rs.getInt("userage"));
			ui.setUserAddress(rs.getString("useraddress"));
			ui.setDiNo(rs.getString("dino"));
		}
		//return hm;
		return ui;
	}
	//public ArrayList<HashMap<String,String>> getUserList(){
	public ArrayList<UserInfo> getUserList(){
		ArrayList<UserInfo> al =new ArrayList<UserInfo>();
		DBCon dbCon=new DBCon();
		try {												
		Connection con=dbCon.getConnection();
		String sql="select * from user_info ui,"+" depart_info di"+" where ui.dino=di.dino";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		HashMap<String,String> hm;
		while(rs.next()) {
			hm=new HashMap<String,String>();
			UserInfo ui=new UserInfo();
			ui.setUserNo(rs.getInt("userno"));
			ui.setUserName(rs.getString("username"));
			ui.setUserId(rs.getString("userid"));
			ui.setUserPwd(rs.getString("userpwd"));
			ui.setUserAddress(rs.getString("useraddress"));
			ui.setUserAge(rs.getInt("userage"));
		
			al.add(ui);	
		}
		}
		catch(Exception e) {System.out.println(e);}
		finally {
			try {dbCon.closeCon();} 
			catch (SQLException e) {e.printStackTrace();}
		}
			return al;
		}
	public int insertUser(HashMap hm) {
		int result=0;
		DBCon dbCon=new DBCon();
		try {												
		Connection con=dbCon.getConnection();
		//try안에 있는 소스는 mariadb에 추가하는 작업
		String sql="insert into user_info(username,userid,";//+" userpwd,userage,useraddress)"+" values(?,?,?,?,?)";
		sql+=" userpwd,userage,useraddress,dino)";
		sql+=" values(?,?,?,?,?,1)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,(String)hm.get("name"));
		ps.setString(2,(String)hm.get("id"));
		ps.setString(3,(String)hm.get("pwd"));
		ps.setString(4,(String)hm.get("age"));
		ps.setString(5,(String)hm.get("address"));
		result=ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println();
		}finally {
			try {dbCon.closeCon();} 
			catch (SQLException e) {e.printStackTrace();}
		}
		return result;
	}	
	public int updateUser(UserInfo ui) {
		int result=0;
		DBCon dbCon=new DBCon();
		try {
			Connection con=dbCon.getConnection();
			String sql="update user_info\r\n"+
			" set username=?,\r\n"+
			" userpwd=?,\r\n"+
			" userage=?,\r\n"+
			" useraddress=?,\r\n"+
			" dino=?,\r\n"+
			" where userno=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,ui.getUserName());
			ps.setString(2,ui.getUserPwd());
			ps.setInt(3,ui.getUserAge());
			ps.setString(4,ui.getUserAddress());
			ps.setInt(5,1);
			ps.setInt(6,ui.getUserNo());
			result=ps.executeUpdate();
			}
			catch(Exception e) {
				System.out.println();
			}finally {
				try {dbCon.closeCon();} 
				catch (SQLException e) {e.printStackTrace();}
			}
		return result;
	}
	public int insertUser(UserInfo ui) {
		int result=0;
		DBCon dbCon=new DBCon();
		try {												
		Connection con=dbCon.getConnection();
		//try안에 있는 소스는 mariadb에 추가하는 작업
		String sql="insert into user_info(username,userid,";//+" userpwd,userage,useraddress)"+" values(?,?,?,?,?)";
		sql+=" userpwd,userage,useraddress,dino)";
		sql+=" values(?,?,?,?,?,1)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,ui.getUserName());
		ps.setString(2,ui.getUserId());
		ps.setString(3,ui.getUserPwd());
		ps.setInt(4,ui.getUserAge());
		ps.setString(5,ui.getUserAddress());
		result=ps.executeUpdate();
		}
		catch(Exception e) {
			System.out.println();
		}finally {
			try {dbCon.closeCon();} 
			catch (SQLException e) {e.printStackTrace();}
		}
		return result;
	}
	@Override
	public UserInfo getUser(int userNo) {
	DBCon dbCon=new DBCon();
	Connection con=null;
	UserInfo ui=null;
	try {
	con=dbCon.getConnection();
	String sql="select * from user_info ui,"+" depart_info di"+" where ui.dino=di.dino";
	sql+=" and ui.userNo=? ";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setInt(1, userNo);
	ResultSet rs=ps.executeQuery();
	while(rs.next()) {
		ui=new UserInfo();
		ui.setUserNo(rs.getInt("userno"));
		ui.setUserName(rs.getString("username"));
		ui.setUserId(rs.getString("userid"));
		ui.setUserPwd(rs.getString("userpwd"));
		ui.setUserAge(rs.getInt("userage"));
		ui.setUserAddress(rs.getString("useraddress"));//view.jsp에 id=키값이랑 같아야 함
		ui.setDiNo(rs.getString("dino"));
	}
	}catch(Exception e) {e.printStackTrace();}
	finally {
		try {dbCon.closeCon();} 
		catch (SQLException e) {e.printStackTrace();}
		con=null;
	}
	return ui;
	}
	@Override
	public int deleteUser(UserInfo ui) {
		int result=0;
		DBCon dbCon=new DBCon();
		try {												
		Connection con=dbCon.getConnection();
		String sql="select count(1) from user_info" +" where userno=? and userpwd=?"; //count(1)이거 해줬으니까 아래 while문에서 적어도 한번은 돈다
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1,ui.getUserNo());
		ps.setString(2,ui.getUserPwd());
		ResultSet rs=ps.executeQuery();
		while(rs.next()) { 
			int cnt=rs.getInt(1); 
			if(cnt==1) {sql="delete from user_info" +" where userno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, ui.getUserNo());
			result=ps.executeUpdate();
			}
		}
		}catch(Exception e) {
			System.out.println();
		}finally {
			try {dbCon.closeCon();} 
			catch (SQLException e) {e.printStackTrace();}
		}
		return result;
	}
}
