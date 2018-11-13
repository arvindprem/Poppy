package com.ipsos.poppy.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.Login;

@RestController
public class UserManagementController {
	@Autowired
	private UserManagementService userManagementService;

	@GetMapping("/UserManagement")
	public ModelAndView userManagementView() {
		return new ModelAndView("UserManagement");
	}

	@GetMapping("/AddUserInfo")
	public ModelAndView addUserForm() {
		return new ModelAndView("AddUserForm");
	}

	@PostMapping(value = "/GetUsers", produces = "application/json")
	public String getAllUsers() {
		return userManagementService.getAllusers();
	}

	@PostMapping(value = "/AddNewUser", produces = "application/json")
	public boolean addNewUsers(@ModelAttribute Login userInfo) {
		System.out.println(userInfo);
		return userManagementService.addNewUser(userInfo);
	}

	@PostMapping("/EditUserInfo")
	public boolean editUserInfo(@ModelAttribute Login editInfo) {
		System.out.println(editInfo);
		return userManagementService.edituserInfo(editInfo);
	}

	@PostMapping(value = "/FilterSearch", produces = "application/json")
	public String filterSearch(HttpServletRequest request) {
		Login filter = new Login();
		filter.setUserName(request.getParameter("userName") == null ? "" : request.getParameter("userName"));
		filter.setCountry(request.getParameter("country") == null ? "" : request.getParameter("country"));
		filter.setLevel(request.getParameter("level") == null ? "" : request.getParameter("level"));
		System.out.println(filter);
		return userManagementService.getFilterResult(filter);
	}

	@PostMapping("/DeleteUserInfo")
	public boolean deleteUserInfo(HttpServletRequest request) {
		if (request.getParameter("UserId") == null) {
			return false;
		} else {
			return userManagementService.deleteUserInfo(request.getParameter("UserId"));
		}
	}

}
