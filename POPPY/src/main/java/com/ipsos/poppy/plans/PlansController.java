package com.ipsos.poppy.plans;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class PlansController {

	@GetMapping("/TestCases")
	public ModelAndView testCases() {
		System.out.println("TestCases Controller");
		return new ModelAndView("TestCases");
	}
	
	@GetMapping("/TestPlans")
	public ModelAndView testPlans() {
		System.out.println("TestPlans Controller");
		return new ModelAndView("TestPlans");
	}
	
	
	@PostMapping("/ImageUpload")
	public void imageUpload() {
		System.out.println("TestPlans Controller");
	}

}

