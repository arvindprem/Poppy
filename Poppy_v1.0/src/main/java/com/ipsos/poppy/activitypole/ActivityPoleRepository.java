package com.ipsos.poppy.activitypole;

import java.io.Serializable;
//import java.io.Serializable;
//import java.util.HashMap;
import java.util.List;
//import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.ActivityPole;
import com.ipsos.poppy.entity.AllowSurveys;
import com.ipsos.poppy.entity.Continent;
import com.ipsos.poppy.entity.Country;
import com.ipsos.poppy.entity.PoppyFeatures;
import com.ipsos.poppy.entity.Society;

@Repository

public class ActivityPoleRepository {
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllActivityPole() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<ActivityPole> jsonList = session.createQuery("From ActivityPole").list();
			
			Query<Society> societyQuery = session.createQuery("From Society Where SocietyId = :SOCIETYID");
			Query<AllowSurveys> allowsurveyQuery = session.createQuery("From AllowSurveys Where AllowSurveysId = :ALLOWSURVEYSID");
			Query<PoppyFeatures> featureQuery = session.createQuery("From PoppyFeatures Where FeaturesId = :FEATURESID");
			for (ActivityPole activitypole : jsonList) {
				societyQuery.setParameter("SOCIETYID", activitypole.getSociety().getId());
				allowsurveyQuery.setParameter("ALLOWSURVEYSID", activitypole.getAllowSurveys().getId());
				featureQuery.setParameter("FEATURESID", activitypole.getPoppyFeatures().getId());
				activitypole.setSocietyLabel(societyQuery.list().get(0).getLabel());
				activitypole.setFeatureLabel(featureQuery.list().get(0).getLabel());
				activitypole.setFilter(allowsurveyQuery.list().get(0).getFilter());
				
			}
			userJson = new ObjectMapper().writeValueAsString(jsonList);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;
	}
	
	@SuppressWarnings("unchecked")
	public boolean editActivityPoleInfo(ActivityPole activityPoleInfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			Query<Society> societyQuery = session.createQuery("From Society Where SocietyLabel = :SOCIETY");
			societyQuery.setParameter("SOCIETY", activityPoleInfo.getSocietyLabel());
			Query<AllowSurveys> allowsurveyQuery = session.createQuery("From AllowSurveys Where Filter = :FILTER");
			allowsurveyQuery.setParameter("FILTER", activityPoleInfo.getFilter());
			Query<PoppyFeatures> featureQuery = session.createQuery("From PoppyFeatures Where FeatureLabel = :FEATURE");
			featureQuery.setParameter("FEATURE", activityPoleInfo.getFeatureLabel());
			ActivityPole existingActivityPoleInfo = session.get(ActivityPole.class,activityPoleInfo.getId());
			existingActivityPoleInfo.setLabel(activityPoleInfo.getLabel());
			existingActivityPoleInfo.setAddress(activityPoleInfo.getAddress());
			existingActivityPoleInfo.setPhone(activityPoleInfo.getPhone());
			existingActivityPoleInfo.setnBLicence(activityPoleInfo.getnBLicence());
			existingActivityPoleInfo.setResponsibleEmail(activityPoleInfo.getResponsibleEmail());
			existingActivityPoleInfo.setResponsibleName(activityPoleInfo.getResponsibleName()); 
			existingActivityPoleInfo.setSociety(societyQuery.list().get(0));
			existingActivityPoleInfo.setAllowSurveys(allowsurveyQuery.list().get(0));
			existingActivityPoleInfo.setPoppyFeatures(featureQuery.list().get(0));
			session.update(existingActivityPoleInfo); 
			trans.commit();
			isUpdated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	@SuppressWarnings("unchecked")
	public boolean addNewActivityPole(ActivityPole activityPole) {
		boolean isAdded = false;
		Transaction trans = null;
		String hql = "From Society Where SocietyLabel = :SOCIETY";
		String hql1 = "From AllowSurveys Where Filter = :FILTER";
		String hql11 = "From PoppyFeatures Where FeatureLabel = :FEATURE";
		try (Session session = sessionFactory.openSession()) {
		trans = session.beginTransaction();
		Query<Society> query = session.createQuery(hql);
		query.setParameter("SOCIETY", activityPole.getSocietyLabel());
		activityPole.setSociety(query.list().get(0));
		Query<AllowSurveys> query1 = session.createQuery(hql1);
		query1.setParameter("FILTER", activityPole.getFilter());
		activityPole.setAllowSurveys(query1.list().get(0));
		Query<PoppyFeatures> query11 = session.createQuery(hql11);
		query11.setParameter("FEATURE", activityPole.getFeatureLabel());
		activityPole.setPoppyFeatures(query11.list().get(0));
		session.save(activityPole);
		trans.commit();
		isAdded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}

//	@SuppressWarnings("unchecked")
//	public boolean checkUserNameExist(Session session, Login userInfo) {
//		String hql = "FROM Login WHERE UserName = :USERNAME";
//		if (userInfo.getId() != 0) {
//			hql += " AND UserId <> :USERID ";
//		}
//		Query<Login> query = session.createQuery(hql);
//		query.setParameter("USERNAME", userInfo.getUserName());
//		if (userInfo.getId() != 0) {
//			query.setParameter("USERID", userInfo.getId());
//		}
//
//		List<Login> validCredential = query.list();
//		return validCredential.isEmpty();
//	}

	public boolean deleteActivityPoleInfo(String userID) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(userID);
			Object persistentInstance = session.load(ActivityPole.class, id);
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

//	@SuppressWarnings("unchecked")
//	public String getFilteredResult(Login filtered) {
//		Transaction trans = null;
//		String filteredJson = null;
//		try (Session session = sessionFactory.openSession()) {
//			trans = session.beginTransaction();
//			String filterSearchQuery = queryMaker(filtered);
//
//			System.out.println(filterSearchQuery);
//
//			Query<Login> query = session.createQuery(filterSearchQuery);
//
//			if (!filtered.getUserName().equals("")) {
//				System.out.println(1);
//				query.setParameter("USERNAME", filtered.getUserName());
//			}
//			if (!filtered.getCountry().equals("")) {
//				System.out.println(3);
//				query.setParameter("COUNTRY", filtered.getCountry());
//			}
//
//			if (!filtered.getLevel().equals("")) {
//				query.setParameter("LEVEL", filtered.getLevel());
//				System.out.println(2);
//			}
//
//			List<Login> filteredList = query.list();
//			Map<String, Object> userDatamap = new HashMap<>();
//			userDatamap.put("data", filteredList);
//			filteredJson = new ObjectMapper().writeValueAsString(userDatamap);
//			trans.commit();
//
//			System.out.println("json " + filteredJson);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return filteredJson;
//	}
//
//	private String queryMaker(Login filtered) {
//
//		String filterSearchQuery = null;
//		StringBuilder sqlQuery = new StringBuilder("FROM Login WHERE ");
//		if (!filtered.getUserName().equals("")) {
//			sqlQuery.append("UserName = :USERNAME AND ");
//		}
//
//		if (!filtered.getCountry().equals("")) {
//			sqlQuery.append("country = :COUNTRY AND ");
//		}
//
//		if (!filtered.getLevel().equals("")) {
//			sqlQuery.append("Level = :LEVEL AND ");
//		}
//		filterSearchQuery = sqlQuery.toString();
//		filterSearchQuery = filterSearchQuery.substring(0, filterSearchQuery.lastIndexOf("AND"));
//		return filterSearchQuery;
//	}

	@SuppressWarnings("unchecked")
	public boolean uploadContinent(List<Country> editInfo) {
		boolean isAdded = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			String hql = "FROM Continent WHERE ContinentLabel = :LABEL";

			trans = session.beginTransaction();
			int i = 0;
			for (Country country : editInfo) {
				if (country.getContinentLabel().equalsIgnoreCase("Africa")
						|| country.getContinentLabel().equalsIgnoreCase("Antarctica")
						|| country.getContinentLabel().equalsIgnoreCase("Asia")
						|| country.getContinentLabel().equalsIgnoreCase("Europe")
						|| country.getContinentLabel().equalsIgnoreCase("NorthAmerica")
						|| country.getContinentLabel().equalsIgnoreCase("Oceania")
						|| country.getContinentLabel().equalsIgnoreCase("SouthAmerica")) {
					Query<Continent> query = session.createQuery(hql);
					query.setParameter("LABEL", country.getContinentLabel());

					System.out.println(country.getContinentLabel());
					List<Continent> asia = query.list();
					Continent asiacontinet = asia.get(0);
					System.out.println(asiacontinet);
					country.setContinent(asiacontinet);
					session.save(country);
					i++;
					if (i % 20 == 0) {
						session.flush();
						session.clear();
					}
				}
			}
			isAdded = true;
			trans.commit();
			System.out.println(i);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isAdded;

	}

}
