package com.ipsos.poppy.allowsurvey;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.AllowSurveys;
@RestController
public class AllowSurveyController {
	
	
@Autowired	
private AllowSurveyService allowsurveyservice;
	@GetMapping("/AllowSurvey")
	public ModelAndView allowsurveyView() {
		return new ModelAndView("/AllowSurvey");
	}
	
	@GetMapping("/AddAllowSurveyInfo")
	public ModelAndView addAllowSurveyForm() {
		return new ModelAndView("AddAllowSurveyForm");
	}
	
	@PostMapping(value = "/GetAllAllowSurveys", produces = "application/json")
	public String getAllAllowSurveys() {
		return allowsurveyservice. getAllAllowSurveys();
	}

	@PostMapping(value = "/AddNewAllowSurvey", produces = "application/json")
	public boolean addNewAllowSurvey(@ModelAttribute AllowSurveys allowsurvey) {
		System.out.println(allowsurvey);
		return allowsurveyservice.addNewAllowSurvey(allowsurvey);
	}
	@PostMapping("/UpdateAllowSurveyInfo")
	public boolean editAllowSurveyInfo(@ModelAttribute AllowSurveys allowsurveyInfo) {
		System.out.println(allowsurveyInfo);
		return allowsurveyservice.editAllowSurveyInfo(allowsurveyInfo);
	}
	@PostMapping("/DeleteAllowSurveyInfo")
	public boolean deleteAllowSurveyInfo(HttpServletRequest request) {
		if (request.getParameter("AllowSurveysId") == null) {
			return false;
		} else {
			return allowsurveyservice.deleteAllowSurveyInfo(request.getParameter("AllowSurveysId"));
		}
	}

	

}
