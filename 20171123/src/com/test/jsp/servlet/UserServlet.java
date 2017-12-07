package com.test.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		req.setCharacterEncoding("utf-8"); //한글한문한자던 주는거 (?) 되게 하는 부분
		res.setCharacterEncoding("utf-8"); //한글한문한자던 받는거 (?) 되게 하는 부분
		res.setContentType("text/html;charset=utf-8"); //설정
		PrintWriter out=res.getWriter();
		String cmd=req.getParameter("cmd");
		
		if(cmd==null) 
		{
			res.sendRedirect("/error.jsp"); 
		}
		else if(cmd.equals("list"))
		{
			String html="";
			ArrayList<HashMap<String, String>> userlist = us.getUserList();
			for(HashMap<String,String> hm:userlist)
			{
				html +="<tr>";
				Iterator<String> it=hm.keySet().iterator();
				while(it.hasNext())
				{
					String key=it.next();
					out.println("<td>"+hm.get(key)+"</td>");
				}
				html +="</tr>";
			}
			out.println(html);
		}else {
			res.sendRedirect("error.jsp");
		}
		/*out.println("url:"+req.getRequestURL());
		out.println("보내신 CMD :"+req.getParameter("cmd"));*/
	}
}
