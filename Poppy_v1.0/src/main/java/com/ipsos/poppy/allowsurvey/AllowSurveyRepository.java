package com.ipsos.poppy.allowsurvey;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.AllowSurveys;
import com.ipsos.poppy.entity.Surveys;
@Repository
public class AllowSurveyRepository {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllAllowSurveys() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<AllowSurveys> jsonList = session.createQuery("From AllowSurveys").list();
			Query<Surveys> surveyQuery = session.createQuery("From Surveys Where SurveysId = :SURVEYSID");
			for (AllowSurveys allowsurveys : jsonList) {
			surveyQuery.setParameter("SURVEYSID", allowsurveys.getSurveys().getId());
			allowsurveys.setVersion(surveyQuery.list().get(0).getVersion());
			
			}
			userJson = new ObjectMapper().writeValueAsString(jsonList);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;

	}
	
		
		@SuppressWarnings("unchecked")
	public boolean addNewAllowSurvey(AllowSurveys allowsurvey) {
		boolean isAdded = false;
		Transaction trans = null;
		

		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			String hql = "From Surveys Where Version = :VERSION";
			Query<Surveys> query = session.createQuery(hql);
			query.setParameter("VERSION", allowsurvey.getVersion());
			allowsurvey.setSurveys(query.list().get(0));

			session.save(allowsurvey);
		

			trans.commit();
			isAdded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}
		@SuppressWarnings("unchecked")

	public boolean editAllowSurveyInfo(AllowSurveys allowsurveyinfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			Query<Surveys> surveyQuery = session.createQuery("From Surveys Where version = :VERSION");
			surveyQuery.setParameter("VERSION", allowsurveyinfo.getVersion());
			
			  
			AllowSurveys existingAllowSurveyInfo = session.get(AllowSurveys.class,  allowsurveyinfo.getId());
			existingAllowSurveyInfo.setFilter(allowsurveyinfo.getFilter());
			existingAllowSurveyInfo.setSample(allowsurveyinfo.getSample());
			existingAllowSurveyInfo.setSurveys(surveyQuery.list().get(0));
			 
			 session.update(existingAllowSurveyInfo); trans.commit();
			 
			isUpdated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	public boolean deleteAllowSurveyInfo(String allowSurveysId) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(allowSurveysId);
			Object persistentInstance = session.load(AllowSurveys.class, id);
			if (persistentInstance != null) {
				session.delete(persistentInstance);
			}
			trans.commit();
			isDeleted = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDeleted;
	}

	
	


}
