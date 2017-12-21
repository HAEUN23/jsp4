package com.test.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.service.DepartService;
import com.test.jsp.service.DepartServiceImpl;
import com.test.jsp.service.UserService;
import com.test.jsp.service.UserServiceImpl;

public class DepartServlet extends HttpServlet{
	DepartService ds=new DepartServiceImpl();
	
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws 
	IOException, ServletException{doProcess(req,res);}//doGet을 불르면, web.xml에서 /*부르면 무엇이던 필터로 돌아가게하고 req,res를
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws
	IOException, ServletException{doProcess(req,res);}
	
	private String getCommandFormUri(String uri) {
		int idx=uri.lastIndexOf("/");
		if(idx!=-1) { return uri.substring(idx+1);}
		return uri;
	}
	public void doProcess(HttpServletRequest req,HttpServletResponse res)throws
	IOException, ServletException{
		req.setCharacterEncoding("utf-8"); //한글한문한자던 받아올때 (?) 되게 하는 부분
		//res.setCharacterEncoding("utf-8"); //한글한문한자던 내가 찍는거 (?) 되게 하는 부분
		//res.setContentType("text/html;charset=utf-8"); //설정 매타tml설정해준거임
		//PrintWriter out=res.getWriter();//여기의 out은 out.println 이거랑 같은 의미
		String uri=req.getRequestURI();//여기의 req는 EncodingFilter.java의 필터의 req랑 같음. 그래서 utf-8이거관련소스추가할필요없음
		String cmd=getCommandFormUri(uri);
		//System.out.println(uri);
		System.out.println(cmd);
		
		//RequestDispatcher rd=req.getRequestDispatcher("/depart/list.jsp");//이거덕분에 내가원하는페이지로이동가능
		RequestDispatcher rd=null;
		//web.xml의 <url-pattern>/sdepart/*</url-pattern> 이거 하려고
		//uri=uri.replace("/s","/"); // web.xml의 /sdepart/*의 "/s"를 -> "/"로 변경해줌.
		
		//if(uri.indexOf("insert")!=-1) {}
		if(cmd.equals("list")) { //UserServlet처럼 다오+서버 같이하면 복잡하니까
			req.setAttribute("departList", ds.selectDepartList());
		}else if(cmd.equals("view")) {//여기(DepartServlet)서는 분기만하고, 서비스뷰어는 다른 곳에 함 
			String diNo=req.getParameter("diNo");
			System.out.println(diNo);
			req.setAttribute("depart", ds.selectDepart());
		}else if(cmd.equals("update")) {
			req.setAttribute("depart", ds.selectDepart());
		}else if(cmd.equals("insert")) {
			
		}else {uri="/error";}
		//rd=req.getRequestDispatcher(uri+".jsp"); // 그래서 /depart + .jsp로 바뀜
		rd=req.getRequestDispatcher("/WEB-INF/view/"+uri+".jsp");
		rd.forward(req, res);//내가 받은 req, res를 error.jsp에 넘김
	}
}
