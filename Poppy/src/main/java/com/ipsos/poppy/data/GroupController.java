package com.ipsos.poppy.data;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.PoppyGroup;


@RestController
public class GroupController {
	
	@Autowired
	public GroupService groupService;
	
	@GetMapping("/Group")
	public ModelAndView groupView() {
		return new ModelAndView("/Group");
	}
	@GetMapping("/AddGroupInfo")
	public ModelAndView addGroupForm() {
		return new ModelAndView("AddGroupForm");
	}
	@PostMapping(value = "/GetGroups", produces = "application/json")
	public String getAllGroups() {
		return groupService.getAllgroups();
	}

	@PostMapping(value = "/AddNewGroup", produces = "application/json")
	public boolean addNewGroups(@ModelAttribute PoppyGroup groupInfo) {
		System.out.println(groupInfo);
		return groupService.addNewGroup(groupInfo);
	}

	@PostMapping("/EditGroupInfo")
	public boolean editUserInfo(@ModelAttribute PoppyGroup editInfo) {
		System.out.println(editInfo);
		return groupService.editgroupInfo(editInfo);
	}

	@PostMapping(value = "/FilterGroup", produces = "application/json")
	public String filterSearch(HttpServletRequest request) {
		PoppyGroup filter = new PoppyGroup();
		filter.setLabel(request.getParameter("label") == null ? "" : request.getParameter("label"));
		//filter.setCountry(request.getParameter("country") == null ? "" : request.getParameter("country"));
		filter.setNblicence(request.getParameter("nbLicence") == null ? "" : request.getParameter("nbLicence"));
		System.out.println(filter);
		return groupService.getFilterResult(filter);
	}

	@PostMapping("/DeleteGroupInfo")
	public boolean deletegroupInfo(HttpServletRequest request) {
		if (request.getParameter("GroupId") == null) {
			return false;
		} else {
			return groupService.deletegroupInfo(request.getParameter("GroupId"));
		}
	}

	
}
