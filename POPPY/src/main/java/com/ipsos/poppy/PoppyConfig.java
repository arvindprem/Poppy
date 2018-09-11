package com.ipsos.poppy;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.ipsos.poppy.filter.LoginFilter;
import com.ipsos.poppy.filter.RequestHandlingInterceptor;
import com.ipsos.poppy.filter.SessionFilter;
import com.ipsos.poppy.session.UrlInterceptor;

@Configuration
public class PoppyConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		System.out.println("Interceptor Object");
		registry.addInterceptor(new UrlInterceptor()).addPathPatterns("/Home", "/Folders");
	}

	@Bean
	public RequestHandlingInterceptor interCeptor() {
		System.out.println("Interceptor Object initialized");
		return new RequestHandlingInterceptor();
	}

	@Bean
	public FilterRegistrationBean loginFilter() {
		final FilterRegistrationBean loginFilter = new FilterRegistrationBean();
		loginFilter.setFilter(new LoginFilter());
		loginFilter.addUrlPatterns("/EmployeeLogin", "/VaildateUser");
		return loginFilter;

	}

	@Bean
	public FilterRegistrationBean sessionFilter() {
		final FilterRegistrationBean sessionFilter = new FilterRegistrationBean();
		sessionFilter.setFilter(new SessionFilter());
		sessionFilter.addUrlPatterns("/HomePage", "/Logout");
		return sessionFilter;
	}
}
