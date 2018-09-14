package com.ipsos.poppy.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LoginController {

	@GetMapping("/PoppyLogin")
	public ModelAndView loginPage() {
		System.out.println("Controller");
		return new ModelAndView("Login");
	}

	@GetMapping("/ReportLogin")
	public ModelAndView login1Page() {
		System.out.println("Controller");
		return new ModelAndView("Login1");
	}

	@PostMapping("/VaildateUser")
	public String validateUser(@ModelAttribute LoginValidate login, HttpServletRequest request) {
		System.out.println(login);
		HttpSession session = request.getSession();
		if(login.getUserName().equalsIgnoreCase("Arvind"))
		{
			session.setAttribute("ResourceUserName", login.getUserName());
			session.setAttribute("", login.getWatchWord());
				
		}else if(login.getUserName().equalsIgnoreCase("Mahe"))
		{
			session.setAttribute("ResourceUserName", login.getUserName());
			session.setAttribute("password", login.getWatchWord());
		}
		
		
		session.setMaxInactiveInterval(2 * 60);
		session.setAttribute("ResourceUserName", login.getUserName());
		return "Success";
	}

	@GetMapping("/Home")
	public ModelAndView homePage() {
		ModelAndView model = new ModelAndView("/Home");
		model.addObject("userName", "Arvind");
		return model;
	}

	@GetMapping("/Logout")
	public void logout(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}
