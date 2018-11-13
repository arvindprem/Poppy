package com.ipsos.poppy.poppyversion;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.PoppyVersion;
@RestController
public class PoppyVersionController {
	
@Autowired
private PoppyVersionService poppyversionservice;

	@GetMapping("/Poppy")
	public ModelAndView poppyversionView() {
		return new ModelAndView("/Poppy");
	}
	@GetMapping("/AddPoppyVersionInfo")
	public ModelAndView addPoppyVersionForm() {
		return new ModelAndView("AddPoppyVersionForm");
	}
	
	@PostMapping(value = "/GetAllPoppyVersions", produces = "application/json")
	public String getAllPoppyVersions() {
		return poppyversionservice. getAllPoppyVersions();
	}

	@PostMapping(value = "/AddNewPoppyVersion", produces = "application/json")
	public boolean addNewPoppyVersion(@ModelAttribute PoppyVersion poppyversion) {
		System.out.println(poppyversion);
		return poppyversionservice.addNewPoppyVersion( poppyversion);
	}
	
	@PostMapping("/UpdatePoppyVersionInfo")
	public boolean editPoppyVersionInfo(@ModelAttribute PoppyVersion poppyversionInfo) {
		System.out.println(poppyversionInfo);
		return poppyversionservice.editPoppyVersionInfo(poppyversionInfo);
	}

	@PostMapping("/DeletePoppyVersionInfo")
	public boolean deletePoppyVersionInfo(HttpServletRequest request) {
		if (request.getParameter("UserId") == null) {
			return false;
		} else {
			return poppyversionservice.deletePoppyVersionInfo(request.getParameter("UserId"));
		}
	}

}
