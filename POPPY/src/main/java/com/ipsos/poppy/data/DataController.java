package com.ipsos.poppy.data;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class DataController {
	@GetMapping("/Folder")
	public ModelAndView folder() {
		return new ModelAndView("Folder");
	}

	@GetMapping("/CallerNos")
	public ModelAndView callerNos() {
		return new ModelAndView("CallerNos");
	}

	@GetMapping("/TelNos")
	public ModelAndView telNos() {
		return new ModelAndView("TelNos");
	}

	
	
	
	@GetMapping("/CallerNo")
	public ModelAndView callerNo() {
		return new ModelAndView("CallerNo");
	}

	
	@GetMapping("/WebSvcForm")
	public ModelAndView webSvcForm() {
		return new ModelAndView("WebSvcForm");
	}
	
	
	@GetMapping("/DataSet")
	public ModelAndView dataSet() {
		return new ModelAndView("DataSet");
	}

	@GetMapping("/DataItem")
	public ModelAndView dataItem() {
		return new ModelAndView("DataItem");
	}

	@GetMapping("/WebSvcImport")
	public ModelAndView webSvcImport() {
		return new ModelAndView("WebSvcImport");
	}

	@GetMapping("/DatabaseImport")
	public ModelAndView databaseImport() {
		return new ModelAndView("DatabaseImport");
	}
}
