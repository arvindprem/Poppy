package com.ipsos.poppy.group;

//import java.io.IOException;
//import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

//import com.fasterxml.jackson.core.JsonParseException;
//import com.fasterxml.jackson.core.type.TypeReference;
//import com.fasterxml.jackson.databind.JsonMappingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.ipsos.poppy.entity.Country;
import com.ipsos.poppy.entity.PoppyGroup;

@RestController
public class GroupManagementController {
	@Autowired
	private GroupManagementService groupManagementService;

	@GetMapping("/GroupManagement")
	public ModelAndView userManagementView() {
		return new ModelAndView("Group");
	}

	@GetMapping("/AddGroupInfo")
	public ModelAndView addUserForm() {
		return new ModelAndView("AddGroupForm");
	}

	@PostMapping(value = "/GetAllGroups", produces = "application/json")
	public String getAllUsers() {
		return groupManagementService.getAllgroups();
	}

	@PostMapping(value = "/AddNewGroup", produces = "application/json")
	public boolean addNewUsers(@ModelAttribute PoppyGroup poppyGroup) {
		System.out.println(poppyGroup);
		return groupManagementService.addNewGroup(poppyGroup);
	}

	@PostMapping("/UpdateGroupInfo")
	public boolean editUserInfo(@ModelAttribute PoppyGroup groupInfo) {
		System.out.println(groupInfo);
		return groupManagementService.editGroupInfo(groupInfo);
	}

//	@PostMapping("/uploadContinent")
//	public boolean uploadContinent(HttpServletRequest request)
//			throws JsonParseException, JsonMappingException, IOException {
//
//		List<Country> editInfo = new ObjectMapper().readValue(request.getParameter("country"),
//				new TypeReference<List<Country>>() {
//				});
//		System.out.println(editInfo);
//		return groupManagementService.uploadContinent(editInfo);
//	}

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

	@PostMapping("/DeleteGroupInfo")
	public boolean deleteUserInfo(HttpServletRequest request) {
		if (request.getParameter("UserId") == null) {
			return false;
		} else {
			return groupManagementService.deleteGroupInfo(request.getParameter("UserId"));
		}
	}

}
