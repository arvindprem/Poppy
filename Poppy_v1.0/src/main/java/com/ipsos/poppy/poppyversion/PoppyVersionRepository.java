package com.ipsos.poppy.poppyversion;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.PoppyVersion;
@Repository
public class PoppyVersionRepository {

	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllPoppyVersions() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<PoppyVersion> jsonList = session.createQuery("From PoppyVersion").list();
			userJson = new ObjectMapper().writeValueAsString(jsonList);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;

	}
	public boolean addNewPoppyVersion(PoppyVersion poppyversion) {
		boolean isAdded = false;
		Transaction trans = null;
		poppyversion.setCreationDateTime(new Date());
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();

			session.save(poppyversion);
		

			trans.commit();
			isAdded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}
	
	public boolean editPoppyVersionInfo(PoppyVersion poppyversionInfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			
			
			  //societyQuery.setParameter("SOCIETY", societyInfo.getLabel()); Society
			PoppyVersion existingpoppyversionInfo = session.get(PoppyVersion.class, poppyversionInfo.getVersionId());
			existingpoppyversionInfo .setVersion(poppyversionInfo.getVersion());
			
			 
			 session.update(existingpoppyversionInfo ); trans.commit();
			 
			isUpdated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	public boolean deletePoppyversionInfo (String userID) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable versionId = Long.valueOf(userID);
			Object persistentInstance = session.load(PoppyVersion.class, versionId);
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
