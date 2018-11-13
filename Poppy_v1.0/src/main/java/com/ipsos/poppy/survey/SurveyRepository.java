package com.ipsos.poppy.survey;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.Surveys;
@Repository
public class SurveyRepository {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllSurveys() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<Surveys> jsonList = session.createQuery("From Surveys").list();
			
			for (Surveys surveys : jsonList) {
			
			
			surveys.setContent(new byte[0]);
			}
			userJson = new ObjectMapper().writeValueAsString(jsonList);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;

	}
	
	public boolean addNewSurvey(Surveys surveyInfo) {
		boolean isAdded = false;
		Transaction trans = null;
		surveyInfo.setCreationDateTime(new Date());
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			

			session.save(surveyInfo);
		

			trans.commit();
			isAdded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}
	public boolean editSurveyInfo(Surveys surveyInfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			
			
			
			 
			  Surveys existingSurveyInfo = session.get(Surveys.class, surveyInfo.getId());
			 existingSurveyInfo.setVersion(surveyInfo.getVersion());
			 existingSurveyInfo.setName(surveyInfo.getName());
			 existingSurveyInfo.setDescription(surveyInfo.getDescription());
			
			
			 
			 session.update(existingSurveyInfo); trans.commit();
			 
			isUpdated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	public boolean deleteSurveyInfo(String surveyId) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(surveyId);
			Object persistentInstance = session.load(Surveys.class, id);
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
	public Surveys downloadFile(String surveyId) {
		Surveys surveys = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			surveys = session.get(Surveys.class, Integer.parseInt(surveyId));
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return surveys;
	}
	


}
