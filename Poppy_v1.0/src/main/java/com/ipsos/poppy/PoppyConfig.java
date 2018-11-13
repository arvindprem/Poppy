package com.ipsos.poppy;

import java.util.Properties;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ipsos.poppy.session.LoginFilter;
import com.ipsos.poppy.session.SessionFilter;

@Configuration
public class PoppyConfig implements WebMvcConfigurer {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

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
		sessionFilter.addUrlPatterns("/Logout", "/UserManagement", "/AddUserInfo", "/EditUserInfo", "/GetUsers",
				"/DeleteUserInfo");
		return sessionFilter;
	}

	@Bean
	public SessionFactory getSessionFactory() {
		SessionFactory sessionFactory = null;
		try {
			logger.info("........................hibernate config Start ....................");
			LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
			sessionFactoryBean.setPackagesToScan("com.ipsos.poppy");
			sessionFactoryBean.setHibernateProperties(properties());
			sessionFactoryBean.setDataSource(poppyDatasource());
			sessionFactoryBean.afterPropertiesSet();
			sessionFactory = sessionFactoryBean.getObject();
			logger.info("........................hibernate config Sucess ....................");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sessionFactory;
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
