package com.ipsos.poppy.poppyuser;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.ActivityPole;
import com.ipsos.poppy.entity.PoppyUser;
import com.ipsos.poppy.entity.PoppyVersion;
import com.ipsos.poppy.entity.Surveys;

@Repository
public class PoppyUserRepository {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllPoppyUsers() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<PoppyUser> jsonList = session.createQuery("From PoppyUser").list();
			Query<ActivityPole> activityPoleQuery = session.createQuery("From ActivityPole Where ActivityPoleId = :ACTIVITYPOLEID");
			Query<Surveys> surveysQuery = session.createQuery("From Surveys Where SurveysId = :SURVEYSID");
			Query<PoppyVersion> poppyversionQuery = session.createQuery("From PoppyVersion Where VersionId = :VERSIONID");
			for(PoppyUser poppyuser : jsonList) {
				 activityPoleQuery.setParameter("ACTIVITYPOLEID", poppyuser.getActivityPole().getId());
				 surveysQuery.setParameter("SURVEYSID", poppyuser.getSurveys().getId());
				poppyversionQuery.setParameter("VERSIONID", poppyuser.getPoppyVersion().getVersionId());
				poppyuser.setActivityPoleLabel(activityPoleQuery.list().get(0).getLabel());
				poppyuser.setVersion(surveysQuery.list().get(0).getVersion());
				poppyuser.setVersion1(poppyversionQuery.list().get(0).getVersion());
				
			}
			userJson = new ObjectMapper().writeValueAsString(jsonList);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;

	}
	
	@SuppressWarnings("unchecked")
	public boolean addNewPoppyUser(PoppyUser poppyuser) {
		boolean isAdded = false;
		Transaction trans = null;
	
		
			String hql = "From ActivityPOle Where ActivityPoleLabel = :ACTIVITYPOLE";
			String hql1 = "From Surveys Where Version = :VERSION";
			String hql11 = "From PoppyVersion Where version = :VERSION";
			
			try (Session session = sessionFactory.openSession()) {
				trans = session.beginTransaction();
				Query<ActivityPole> query = session.createQuery(hql);
				query.setParameter("ACTIVITYPOLE", poppyuser.getActivityPoleLabel());
				poppyuser.setActivityPole(query.list().get(0));
				Query<Surveys> query1 = session.createQuery(hql1);
				query1.setParameter("VERSION", poppyuser.getVersion());
				poppyuser.setSurveys(query1.list().get(0));
				Query<PoppyVersion> query11 = session.createQuery(hql11);
				query11.setParameter("VERSION", poppyuser.getVersion1());
				poppyuser.setPoppyVersion(query11.list().get(0));
				session.save(poppyuser);
			trans.commit();
			isAdded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}
	@SuppressWarnings("unchecked")
	public boolean editPoppyUserInfo(PoppyUser poppyuser) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
		
			Query<ActivityPole>activitypoleQuery = session.createQuery("From ActivityPOle Where ActivityPoleLabel = :ACTIVITYPOLE");
			activitypoleQuery.setParameter("ACTIVITYPOLE", poppyuser.getActivityPoleLabel());
			Query<Surveys> surveyQuery = session.createQuery("From Surveys Where Version = :VERSION");
			surveyQuery.setParameter("VERSION", poppyuser.getVersion());
			Query<PoppyVersion> poppyversionQuery = session.createQuery("From PoppyVersion Where Version = :VERSION");
			poppyversionQuery.setParameter("VERS ION",  poppyuser.getVersion1());
			PoppyUser existingPoppyUserInfo = session.get(PoppyUser.class,poppyuser.getId());
	        existingPoppyUserInfo.setName(poppyuser.getName());
			existingPoppyUserInfo.setFirstName(poppyuser.getFirstName());
			existingPoppyUserInfo.setActivityPole(activitypoleQuery.list().get(0));
			existingPoppyUserInfo.setSurveys(surveyQuery.list().get(0));
			existingPoppyUserInfo.setPoppyVersion(poppyversionQuery.list().get(0));
			
			session.update(existingPoppyUserInfo);
			trans.commit();
			isUpdated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	
	public boolean deletePoppyUserInfo(String userID) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(userID);
			Object persistentInstance = session.load(PoppyUser.class, id);
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
