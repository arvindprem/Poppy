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
	private static final String POPPYROLE = "PoppyUserRole";
	private static final String POPPYUSERID = "PoppyUserID";

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
		
		System.out.println("Entered into Login Filter ");
		res.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
		res.setHeader("Pragma", "no-cache");
		res.setDateHeader("Expires", 0);
	
		if (session == null) {
			res.sendRedirect("PoppyLogin");
		} else {
			if (String.valueOf(session.getAttribute(POPPYUSERID)) != null
					&& String.valueOf(session.getAttribute(POPPYROLE)).equalsIgnoreCase("SuperUser")) {
				res.sendRedirect("UserManagement");
			} else if ((String.valueOf(session.getAttribute(POPPYUSERID)) != null
					&& String.valueOf(session.getAttribute(POPPYROLE)).equalsIgnoreCase("NORMALUSER"))) {
				res.sendRedirect("Home");
			} else if (String.valueOf(session.getAttribute(POPPYUSERID)) != null
					&& String.valueOf(session.getAttribute(POPPYROLE)).equalsIgnoreCase("READER")) {
				res.sendRedirect("Folder");
			} else {
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void destroy() {
		System.out.println("LoginFilter Destroyed");
	}

}
