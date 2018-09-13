package com.ipsos.poppy.admin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class UserManagementController {

@GetMapping("/UserManagement")
	public ModelAndView fullCallender() {
		System.out.println("UserManagement.jsp");
	return new ModelAndView("UserManagement");
	}
	
}
