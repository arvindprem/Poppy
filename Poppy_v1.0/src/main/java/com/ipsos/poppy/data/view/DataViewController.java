package com.ipsos.poppy.data.view;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class DataViewController {
	@GetMapping("/Group")
	public ModelAndView groupView() {
		return new ModelAndView("/Group");
	}



	


	


	


}
