package com.ipsos.poppy.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.Surveys;
@Service
public class SurveyService {
	
		@Autowired
		private SurveyRepository surveyDao;


		public String getAllSurveys() {
			return surveyDao.getAllSurveys();

		}

		public boolean addNewSurvey(Surveys survey) {
			return surveyDao.addNewSurvey(survey);

		}
		
		public boolean editSurveyInfo(Surveys surveyInfo) {
			return surveyDao.editSurveyInfo(surveyInfo);
		}
		
		public boolean deleteSurveyInfo(String surveyId) {
			return surveyDao.deleteSurveyInfo(surveyId);
		}
		public Surveys downloadFile(String surveyId) {
			return  surveyDao.downloadFile(surveyId);
			
		}
	}

