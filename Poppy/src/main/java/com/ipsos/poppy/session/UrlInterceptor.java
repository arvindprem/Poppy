//package com.ipsos.poppy.session;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//public class UrlInterceptor extends HandlerInterceptorAdapter {
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
//		  System.out.println("\n-------- LogInterception.preHandle --- ");
//		return true;
//
//	}
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) {
//		  System.out.println("\n-------- LogInterception.postHandle --- ");
//
//	}
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
//			Exception ex) {
//		  System.out.println("\n-------- LogInterception.aftercomplete --- ");
//
//	}
//
//}
