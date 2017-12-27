package com.test.jsp.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{//매번 파일마다 "utf-8"이거 관련 계속 입력하기 뭐하니까.
	@Override
	public void destroy() {	//이 메모리가 종료될 때 쓰는 함수
		System.out.println("필터클래스 종료!");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8"); //얘를 다시 fc이용해서 내보내줘야함 
		fc.doFilter(req, res);//이거 
	}

	@Override
	public void init(FilterConfig fc) throws ServletException { //최초로 시작될 때, 생성자
		System.out.println("필터클래스 최초 생성!");
	}
}
