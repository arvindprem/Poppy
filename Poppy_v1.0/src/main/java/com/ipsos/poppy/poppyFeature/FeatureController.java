package com.ipsos.poppy.poppyFeature;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.PoppyFeatures;

@RestController
public class FeatureController {
	@Autowired
	private FeatureService featureService;
	
	@GetMapping("/PoppyFeature")
	public ModelAndView poppyFeatureView() {
		return new ModelAndView("/PoppyFeature");
	}

	@GetMapping("/AddFeatureInfo")
	public ModelAndView addPoppyFeatureForm() {
		return new ModelAndView("AddPoppyFeatureForm");
	}
	
	@PostMapping(value = "/GetAllFeatures", produces = "application/json")
	public String getAllFeatures() {
		return featureService.getAllFeatures();
	}

	@PostMapping(value = "/AddNewFeature", produces = "application/json")
	public boolean addNewUsers(@ModelAttribute PoppyFeatures feature) {
		System.out.println(feature);
		return featureService.addNewFeature(feature);
	}
	@PostMapping("/UpdateFeatureInfo")
	public boolean editFeatureInfo(@ModelAttribute PoppyFeatures featureInfo) {
		System.out.println(featureInfo);
		return featureService.editFeatureInfo(featureInfo);
	}
	@PostMapping("/DeleteFeatureInfo")
	public boolean deleteFeatureInfo(HttpServletRequest request) {
		if (request.getParameter("FeatureId") == null) {
			return false;
		} else {
			return featureService.deleteFeatureInfo(request.getParameter("FeatureId"));
		}
	}



}
