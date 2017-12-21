package com.test.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.test.jsp.dto.UserInfo;
import com.test.jsp.service.UserService;
import com.test.jsp.service.UserServiceImpl;

public class UserServlet extends HttpServlet{
	UserService us=new UserServiceImpl();
	
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws 
	IOException, ServletException{
		doProcess(req,res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws
	IOException, ServletException{
		doProcess(req,res);
	}
	public void doProcess(HttpServletRequest req,HttpServletResponse res)throws
	IOException, ServletException{
		req.setCharacterEncoding("utf-8"); //한글한문한자던 받아올때 (?) 되게 하는 부분
		res.setCharacterEncoding("utf-8"); //한글한문한자던 내가 찍는거 (?) 되게 하는 부분
		res.setContentType("text/html;charset=utf-8"); //설정 매타tml설정해준거임
		PrintWriter out=res.getWriter();//여기의 out은 out.println 이거랑 같은 의미
		String cmd=req.getParameter("cmd");
		
		if(cmd==null) 
		{
			res.sendRedirect("/error.jsp"); 
		}else if(cmd.equals("list")){
			ArrayList<UserInfo> userlist = us.getUserList();
			Gson gs = new Gson();
			out.print(gs.toJson(userlist));//
		}
		else if(cmd.equals("login")) {
			String id=req.getParameter("id");
			String pwd=req.getParameter("pwd");
			HashMap<String, String> hm = new HashMap<String,String>();
			try {
				//hm = us.getUser(id, pwd);
				UserInfo ui = us.getUser(id, pwd);
				//if(hm.size()==0) {
				if(ui==null) {
					hm.put("result","no");
					hm.put("msg","아이디와 비번밀번호를 확인해주세요"); 
				}else {
					HttpSession hs = req.getSession();
					hs.setAttribute("user",ui);
					hm.put("result","ok");
					//hm.put("msg",hm.get("username")+"님 환영합니다");
					hm.put("msg",ui.getUserName()+"님 환영합니다");
				}
				Gson gs = new Gson();
				out.print(gs.toJson(hm));
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("logout")){//웹에서 로그아웃 분류 누르면 (header.jsp에서 cmd=logout해줬음)
			HttpSession hs=req.getSession();//세션이 있어야 로그아웃됨.
			hs.invalidate();
			res.sendRedirect("/user/login.jsp");//로그인 웹으로 넘어감
		}else if(cmd.equals("join")) {
			String params=req.getParameter("params");
			Gson gs = new Gson();
			//HashMap hm=gs.fromJson(params, HashMap.class);//여기의gs가 하는일은: userinfo.java에 있는 키값(userid...)이랑 join.jsp의 param키값비교
			UserInfo ui=gs.fromJson(params, UserInfo.class);
			int result=us.insertUser(ui);
			HashMap<String,String> hm=new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "회원가입에 실패하셨습니다.");
			if(result!=0) {
				hm.put("result", "ok");
				hm.put("msg", "화원가입에 오지셨씁니다.");
				hm.put("url","/user/login.jsp");
			}
			out.print(gs.toJson(hm));	
		}else if(cmd.equals("view")) {
			int userNo=Integer.parseInt(req.getParameter("userno"));
			UserInfo ui=us.getUser(userNo);
			Gson gs = new Gson();
			out.println(gs.toJson(ui));
			
		}else if(cmd.equals("delete")) {
			String checkPwd =req.getParameter("checkPwd");
			UserInfo ui=(UserInfo)req.getSession().getAttribute("user");
			ui.setUserPwd(checkPwd);
			int result=us.deleteUser(ui);
			HashMap<String,String> hm=new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "회원탈퇴에 실패하셨습니다.");
			if(result!=0) {
				hm.put("result", "ok");
				hm.put("msg", "회원탈퇴 되셨습니다.");
				hm.put("url","/user/logout.user?cmd=logout");
			}
			Gson gs = new Gson();
			out.print(gs.toJson(hm));
		}else if(cmd.equals("update")) {
			int result=us.updateUser(null);
			HashMap<String,String> hm=new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "회원수정에 실패하셨습니다.");
			if(result!=0) {
				hm.put("result", "ok");
				hm.put("msg", "회원수정 되셨습니다.");
				hm.put("url","/user/veiw.jsp?userno=");
			}
			Gson gs = new Gson();
			out.print(gs.toJson(hm));
		}else if(cmd.equals("checkPwd")) {
			String checkPwd=req.getParameter("checkPwd");
			String userPwd=((UserInfo)req.getSession().getAttribute("user")).getUserPwd();//세션에 있는 비밀번호를 가지고 와서
			HashMap<String,String> hm=new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "비밀번호가 틀렸습니다.");
			if(checkPwd.equals(userPwd)) {//확인하는 과정
				hm.put("result","ok");
				hm.put("msg","ok");
			}
			Gson gs = new Gson();
			out.print(gs.toJson(hm));
		}
		else {
			res.sendRedirect("/error.jsp");//res.sendRedirect("error.jsp");
		}
		/*out.println("url:"+req.getRequestURL());
		out.println("보내신 CMD :"+req.getParameter("cmd"));*/
	}
}
