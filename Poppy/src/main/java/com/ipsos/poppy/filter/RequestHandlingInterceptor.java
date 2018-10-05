//package com.ipsos.poppy.filter;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//public class RequestHandlingInterceptor implements HandlerInterceptor {
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object,
//			Exception arg3) {
//		System.out.println("after completion");
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object,
//			ModelAndView model) {
//		System.out.println("post");
//	}
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) {
//		System.out.println("pre");
//		return true;
//	}
//
//}
