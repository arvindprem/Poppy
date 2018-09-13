package com.ipsos.poppy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginFilter Initialized");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		res.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
		res.setHeader("Pragma", "no-cache");
		res.setDateHeader("Expires", 0);

		if (String.valueOf(session.getAttribute("ResourceUserName")).equalsIgnoreCase("Arvind")) {
			res.sendRedirect("Home");
		} else if (String.valueOf(session.getAttribute("ResourceUserName")).equalsIgnoreCase("Mahe")) {
			res.sendRedirect("UserManagement"); }
		else{
			chain.doFilter(request, response);
		}
	}

	

	@Override
	public void destroy() {
		System.out.println("LoginFilter Destroyed");
	}
	
}
