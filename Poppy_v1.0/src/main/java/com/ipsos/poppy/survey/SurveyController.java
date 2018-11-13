package com.ipsos.poppy.survey;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ipsos.poppy.entity.Surveys;
@RestController
public class SurveyController {
	@Autowired
    private SurveyService surveyservice;
	
	
	@GetMapping("/Surveys")
	public ModelAndView surveyView() {
		return new ModelAndView("/Surveys");
	}
	@GetMapping("/AddSurveyInfo")
	public ModelAndView addSurveyForm() {
		return new ModelAndView("AddSurveyForm");
	}
	@PostMapping(value = "/GetAllSurveys", produces = "application/json")
	public String getAllSurveys() {
		return surveyservice. getAllSurveys();
	}

	@PostMapping(value = "/AddNewSurvey", produces = "application/json")
	public boolean addNewSurveys(@RequestParam("survey") MultipartFile multiPartFile,@ModelAttribute Surveys survey) {
		
try {
			System.out.println(survey);
			System.out.println(multiPartFile.getBytes().length);
			survey.setContent(multiPartFile.getBytes());
			survey.setType(multiPartFile.getContentType());
			survey.setExtension(multiPartFile.getOriginalFilename()
					.substring(multiPartFile.getOriginalFilename().lastIndexOf('.')));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return surveyservice.addNewSurvey(survey);
	}

	@PostMapping("/UpdateSurveyInfo")
	public boolean editSurveyInfo(@ModelAttribute Surveys surveyInfo) {
		System.out.println(surveyInfo);
		return surveyservice.editSurveyInfo(surveyInfo);
	}

	@PostMapping("/DeleteSurveyInfo")
	public boolean deleteSurveyInfo(HttpServletRequest request) {
		if (request.getParameter("SurveysId") == null) {
			return false;
		} else {
			return surveyservice.deleteSurveyInfo(request.getParameter("SurveysId"));
		}
	}
	

	@GetMapping(value = "/DownloadFile")
	public void downloadFile(@RequestParam("SurveysId") String surveyId, HttpServletResponse response) {
		try {
			Surveys survey = surveyservice.downloadFile(surveyId);
			response.setContentType(survey.getType());
			response.setHeader(HttpHeaders.CONTENT_DISPOSITION,
					"attachment;filename=" + survey.getName() + survey.getExtension());
			ServletOutputStream outStream = response.getOutputStream();
			System.out.println(survey.getContent().length);
			outStream.write(survey.getContent());
			outStream.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	
}
