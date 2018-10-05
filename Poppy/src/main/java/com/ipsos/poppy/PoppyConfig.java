package com.ipsos.poppy;

import java.io.IOException;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ipsos.poppy.filter.LoginFilter;
//import com.ipsos.poppy.filter.RequestHandlingInterceptor;
import com.ipsos.poppy.filter.SessionFilter;
//import com.ipsos.poppy.session.UrlInterceptor;

@Configuration
public class PoppyConfig implements WebMvcConfigurer {

	//@Override
	//public void addInterceptors(InterceptorRegistry registry) {
		//System.out.println("Interceptor Object");
		//registry.addInterceptor(new UrlInterceptor()).addPathPatterns("/Home", "/Folders");
	//}

	//@Bean
	//public RequestHandlingInterceptor interCeptor() {
		//System.out.println("Interceptor Object initialized");
		//return new RequestHandlingInterceptor();
	//}
	 @Bean(name="multipartResolver")
	    public StandardServletMultipartResolver resolver(){
	        return new StandardServletMultipartResolver();
	    }

	
	

	@Bean
	public FilterRegistrationBean<LoginFilter> loginFilter() {
		final FilterRegistrationBean<LoginFilter> loginFilter = new FilterRegistrationBean<>();
		loginFilter.setFilter(new LoginFilter());
		loginFilter.addUrlPatterns("/PoppyLogin", "/VaildateUser", "/");
		return loginFilter;

	}

	@Bean
	public FilterRegistrationBean<SessionFilter> sessionFilter() {
		final FilterRegistrationBean<SessionFilter> sessionFilter = new FilterRegistrationBean<>();
		sessionFilter.setFilter(new SessionFilter());
		sessionFilter.addUrlPatterns("/Logout", "/UserManagement", "/AddUserInfo", "/EditUserInfo",
				"/GetUsers","/DeleteUserInfo");
		return sessionFilter;
	}
	
	@Bean
	public SessionFactory getSessionFactory() throws  IOException {
		System.out.println("........................hibernate config Start ....................");
		LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
		sessionFactoryBean.setPackagesToScan("com.ipsos.poppy");
		sessionFactoryBean.setHibernateProperties(properties());
		sessionFactoryBean.setDataSource(poppyDatasource());
		sessionFactoryBean.afterPropertiesSet();
		System.out.println("........................hibernate config Sucess ....................");
		return sessionFactoryBean.getObject();
	}

	Properties properties() {
		Properties properties = new Properties();
		properties.setProperty("hibernate.hbm2ddl.auto", "update");
		properties.setProperty("hibernate.show_sql", "true");
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
		return properties;
	}

	@Bean
	public DataSource poppyDatasource() {
		DriverManagerDataSource dataSourceBuilder = new DriverManagerDataSource();
		ResourceBundle bundle = ResourceBundle.getBundle("DB");
		dataSourceBuilder.setUsername(bundle.getString("UserName"));
		dataSourceBuilder.setPassword(bundle.getString("Password"));
		dataSourceBuilder.setUrl(bundle.getString("DatabaseUrl"));
		dataSourceBuilder.setDriverClassName(bundle.getString("DriverClassName"));
		return dataSourceBuilder;

	}

}
