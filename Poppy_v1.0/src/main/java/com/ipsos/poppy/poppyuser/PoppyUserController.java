package com.ipsos.poppy.poppyuser;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.PoppyUser;

@RestController
public class PoppyUserController {
	@Autowired
	private PoppyUserService poppyuserService;
	
	@GetMapping("/PoppyUser")
	public ModelAndView poppyUserView() {
		return new ModelAndView("/PoppyUser");
	}
	@GetMapping("/AddPoppyUserInfo")
	public ModelAndView addPoppyUserForm() {
		return new ModelAndView("AddPoppyUserForm");
	}
	
	@PostMapping(value = "/GetAllPoppyUsers", produces = "application/json")
	public String getAllPoppyUsers() {
		return poppyuserService.getAllPoppyUsers();
	}

	@PostMapping(value = "/AddNewPoppyUser", produces = "application/json")
	public boolean addNewPoppyUser(@ModelAttribute PoppyUser poppyuser) {
		System.out.println(poppyuser);
		return poppyuserService.addNewPoppyUser(poppyuser);
	}
	@PostMapping("/UpdatePoppyUserInfo")
	public boolean editPoppyUserInfo(@ModelAttribute PoppyUser poppyuser) {
		System.out.println(poppyuser);
		return poppyuserService.editPoppyUserInfo(poppyuser);
	}
	@PostMapping("/DeletePoppyUserInfo")
	public boolean deletePoppyUserInfo(HttpServletRequest request) {
		if (request.getParameter("UserId") == null) {
			return false;
		} else {
			return poppyuserService.deletePoppyUserInfo(request.getParameter("UserId"));
		}
	}


}
