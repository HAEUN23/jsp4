package com.test.jsp.servlet;//WebContent(=/)의 login.jsp(java내용 지운거)랑 세트임

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet{
	/*예를들어, 돈 걷을 때 or 로그인할 때 비동기로 입력 들어가지만
	 *static(변하지않는) 변수 시리얼 번호가 필요. 공통적으로=변하지않고 바라보는 주소값 (ex.돈낼때돈박스)
	*/
	private static final long serialVersionUID = 1L;
	//.jsp파일에서 method="get"으로 해야 함.
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws
	IOException, ServletException{
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		System.out.println("로그인 서블릿 호출!");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter pw=res.getWriter();
		pw.print("입력하신 id="+id); 
		pw.print("입력하신 pwd="+pwd);
	}
	//.jsp파일에서 method="post"로 해야 함.
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws
	IOException, ServletException{
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter pw=res.getWriter();
		//pw.print("포스트로 날 호출 했군요."); 
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String testId="test";
		String testPwd="1234";
		
		String msg="";
		if(testId.equals(id)) 
		{
			if(testPwd.equals(pwd)) 
			{
				pw.print(id+"님 로그인에 성공하셨습니다.");
			}
			else 
			{
				//pw.print(id+"님 비밀번호를 확인해주세요.");
				msg=id+"님 비밀번호를 확인해주세요.";
			}
		}
		else 
		{
			//pw.print(id+"란 아이디가 없습니다.");
			msg=id+"란 아이디가 없습니다.";
		}
		if(!msg.equals(""))
		{	pw.println("<script>");
			pw.println("alert('"+msg+"')");
			pw.println("location.href='/20171128.jsp'");
			pw.println("</script>");
		}
	}
}



