package com.ipsos.poppy.entity.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
@RestController
public class EntityController {

	@GetMapping("/Group")
	public ModelAndView groupView() {
		return new ModelAndView("/Group");
	}
	@GetMapping("/AddGroupInfo")
	public ModelAndView addGroupForm() {
		return new ModelAndView("AddGroupForm");
	}
	
	@GetMapping("/Society")
	public ModelAndView societyView() {
		return new ModelAndView("/Society");
		
	}
	@GetMapping("/AddSocietyInfo")
	public ModelAndView addSocietyForm() {
		return new ModelAndView("AddSocietyForm");
	}
	@GetMapping("/ActivityPole")
	public ModelAndView activitypoleView() {
		return new ModelAndView("/ActivityPole");
	}
	@GetMapping("/PoppyFeature")
	public ModelAndView poppyFeatureView() {
		return new ModelAndView("/PoppyFeature");
	}
	@GetMapping("/addFeatureInfo")
	public ModelAndView addPoppyFeatureForm() {
		return new ModelAndView("AddPoppyFeatureForm");
	}
	@GetMapping("/Surveys")
	public ModelAndView surveyView() {
		return new ModelAndView("/Surveys");
	}
	@GetMapping("/AllowSurvey")
	public ModelAndView allowsurveyView() {
		return new ModelAndView("/AllowSurvey");
	}
	@GetMapping("/Poppy")
	public ModelAndView poppyversionView() {
		return new ModelAndView("/Poppy");
	}
	@GetMapping("/PoppyUser")
	public ModelAndView poppyUserView() {
		return new ModelAndView("/PoppyUser");
	}
}
