package com.ipsos.poppy.society;

import javax.servlet.http.HttpServletRequest;

//import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.Society;

@RestController
public class SocietyManagementController {
	@Autowired
	private SocietyManagementService societyManagementService;

	@GetMapping("/Society")
	public ModelAndView userManagementView() {
		return new ModelAndView("Society");
	}

	@GetMapping("/AddSocietyInfo")
	public ModelAndView addSocietyForm() {
		return new ModelAndView("AddSocietyForm");
	}

	@PostMapping(value = "/GetAllSociety", produces = "application/json")
	public String getAllUsers() {
		return societyManagementService.getAllSociety();
	}

	@PostMapping(value = "/AddNewSociety", produces = "application/json")
	public boolean addNewUsers(@ModelAttribute Society society) {
		System.out.println(society);
		return societyManagementService.addNewSociety(society);
	}

	@PostMapping("/UpdateSocietyInfo")
	public boolean editUserInfo(@ModelAttribute Society societyInfo) {
		System.out.println(societyInfo);
		return societyManagementService.editSocietyInfo(societyInfo);
	}
//
//	/*
//	 * @PostMapping(value = "/FilterSearch", produces = "application/json") public
//	 * String filterSearch(HttpServletRequest request) { Login filter = new Login();
//	 * filter.setUserName(request.getParameter("userName") == null ? "" :
//	 * request.getParameter("userName"));
//	 * filter.setCountry(request.getParameter("country") == null ? "" :
//	 * request.getParameter("country"));
//	 * filter.setLevel(request.getParameter("level") == null ? "" :
//	 * request.getParameter("level")); System.out.println(filter); return
//	 * groupManagementService.getFilterResult(filter); }
//	 */
//
	@PostMapping("/DeleteSocietyInfo")
	public boolean deleteUserInfo(HttpServletRequest request) {
		if (request.getParameter("UserId") == null) {
			return false;
		} else {
			return societyManagementService.deleteSocietyInfo(request.getParameter("UserId"));
		}
	}

}
