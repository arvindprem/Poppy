package com.ipsos.poppy.allowsurvey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.AllowSurveys;
@Service
public class AllowSurveyService {
	
	

		@Autowired
		private AllowSurveyRepository allowsurveyDao;


		public String getAllAllowSurveys() {
			
			return allowsurveyDao.getAllAllowSurveys();

		}
		
		public boolean addNewAllowSurvey(AllowSurveys allowsurvey) {
			return allowsurveyDao.addNewAllowSurvey(allowsurvey);

		}
		
		public boolean editAllowSurveyInfo(AllowSurveys allowsurvey) {
			return allowsurveyDao.editAllowSurveyInfo(allowsurvey);
		}
		public boolean deleteAllowSurveyInfo(String allowSurveysId) {
			return allowsurveyDao.deleteAllowSurveyInfo(allowSurveysId);
		}


}
