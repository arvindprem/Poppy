package com.ipsos.poppy.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.admin.ChangePassword;
import com.ipsos.poppy.entity.Login;

@RestController
public class LoginController {

	@Autowired
	private LoginService loginService;

	@GetMapping(value = { "/PoppyLogin", "/" })
	public ModelAndView loginPage() {
		return new ModelAndView("Login");
	}

	@GetMapping("/Home")
	public ModelAndView homePage() {
		return new ModelAndView("/Home");
	}
	@GetMapping("/PoppyReport")
	public ModelAndView poppyReportpage() {
		return new ModelAndView("/PoppyReport");
	}


	

	@GetMapping("/Logout")
	public void logout(HttpServletResponse response, HttpSession session) {
		try {
			if (session != null) {
				session.invalidate();
			}
			response.sendRedirect("PoppyLogin");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@PostMapping("/VaildateUser")
	public boolean validateUser(@ModelAttribute LoginInfo login, HttpSession session) {
		Login isValidUser = loginService.validateUser(login);
		boolean checkCredentials = false;
		if (!isValidUser.getUserName().equals("")) {
			session.setAttribute("PoppyUserID", isValidUser.getUserName());
			session.setAttribute("PoppyUserRole", isValidUser.getLevel());
			checkCredentials = true;
		}
		return checkCredentials;
	}

	@PostMapping(value = "/ChangePassword", produces = "application/json")
	public boolean changePassword(HttpServletRequest request, HttpSession session) {
		ChangePassword changePassword = new ChangePassword();
		changePassword.setCurrentWatchWord(
				request.getParameter("currentWatchWord") == null ? "" : request.getParameter("currentWatchWord"));
		changePassword.setNewWatchWord(
				request.getParameter("confirmWatchWord") == null ? "" : request.getParameter("confirmWatchWord"));
		changePassword.setUserName(session.getAttribute("PoppyUserID") + "");
		System.out.println(changePassword);
		return loginService.changePassword(changePassword);
	}

}
