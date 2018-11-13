package com.ipsos.poppy.activitypole;

import javax.servlet.http.HttpServletRequest;

//import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.ActivityPole;
@RestController

public class ActivityPoleController {
	@Autowired
	private ActivityPoleService activityPoleService;

	@GetMapping("/ActivityPole")
	public ModelAndView activityPoleView() {
		return new ModelAndView("ActivityPole");
	}

	@GetMapping("/AddActivityPoleInfo")
	public ModelAndView addActivityPoleForm() {
		return new ModelAndView("AddActivityPoleForm");
	}

	@PostMapping(value = "/GetAllActivityPole", produces = "application/json")
	public String getAllActivityPole() {
		return activityPoleService.getAllActivityPole();
	}

	@PostMapping(value = "/AddNewActivityPole", produces = "application/json")
	public boolean addNewActivityPole(@ModelAttribute ActivityPole activityPole) {
		System.out.println(activityPole);
		return activityPoleService.addNewActivityPole(activityPole);
	}

	@PostMapping("/UpdateActivityPoleInfo")
	public boolean editActivityPoleInfo(@ModelAttribute  ActivityPole  activityPoleInfo) {
		System.out.println( activityPoleInfo);
		return activityPoleService.editActivityPoleInfo( activityPoleInfo);
	}

	/*
	 * @PostMapping(value = "/FilterSearch", produces = "application/json") public
	 * String filterSearch(HttpServletRequest request) { Login filter = new Login();
	 * filter.setUserName(request.getParameter("userName") == null ? "" :
	 * request.getParameter("userName"));
	 * filter.setCountry(request.getParameter("country") == null ? "" :
	 * request.getParameter("country"));
	 * filter.setLevel(request.getParameter("level") == null ? "" :
	 * request.getParameter("level")); System.out.println(filter); return
	 * groupManagementService.getFilterResult(filter); }
	 */

	@PostMapping("/DeleteActivityPoleInfo")
	public boolean deleteUserInfo(HttpServletRequest request) {
		if (request.getParameter("UserId") == null) {
			return false;
		} else {
			return  activityPoleService.deleteActivityPoleInfo(request.getParameter("UserId"));
		}
	}

	
}

