package com.ipsos.poppy.poppyFeature;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.PoppyFeatures;
@Repository
public class FeatureRepository {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllFeatures() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<PoppyFeatures> jsonList = session.createQuery("From PoppyFeatures").list();
			userJson = new ObjectMapper().writeValueAsString(jsonList);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;

	}
	
	
	public boolean addNewFeature(PoppyFeatures feature) {
		boolean isAdded = false;
		Transaction trans = null;
		

		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();

			session.save(feature);
		

			trans.commit();
			isAdded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}
	public boolean editFeatureInfo(PoppyFeatures featureInfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			
			
			  //societyQuery.setParameter("SOCIETY", societyInfo.getLabel()); Society
			PoppyFeatures existingFeatureInfo = session.get(PoppyFeatures.class,  featureInfo.getId());
			 existingFeatureInfo.setLabel(featureInfo.getLabel());
			
			 
			 session.update( existingFeatureInfo); trans.commit();
			 
			isUpdated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	public boolean deleteFeatureInfo(String featureId) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(featureId);
			Object persistentInstance = session.load(PoppyFeatures.class, id);
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
