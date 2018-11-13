package com.ipsos.poppy.society;

import java.io.Serializable;
//import java.io.Serializable;
//import java.util.HashMap;
import java.util.List;
//import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
//import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
//import com.ipsos.poppy.entity.Country;
//import com.ipsos.poppy.entity.Continent;
//import com.ipsos.poppy.entity.Country;
//import com.ipsos.poppy.entity.Login;
import com.ipsos.poppy.entity.PoppyGroup;
import com.ipsos.poppy.entity.Society;

@Repository
public class SocietyManagementRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllSociety() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<Society> jsonList = session.createQuery("From Society").list();
			Query<PoppyGroup> poppyGroupQuery = session.createQuery("From PoppyGroup Where GroupId = :GROUPID");
			for (Society  society : jsonList) {
				poppyGroupQuery.setParameter("GROUPID", society.getPoppyGroup().getId());
				society.setGroupLabel(poppyGroupQuery.list().get(0).getLabel());
			}
			userJson = new ObjectMapper().writeValueAsString(jsonList);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;

	}
	@SuppressWarnings("unchecked")
	public boolean editSocietyInfo(Society societyInfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			
			
			
			Query<PoppyGroup> poppyGroupQuery = session.createQuery("From PoppyGroup Where GroupLabel = :POPPYGROUP");
			poppyGroupQuery.setParameter("POPPYGROUP", societyInfo.getGroupLabel());
			  Society existingSocietyInfo = session.get(Society.class, societyInfo.getId());
			 existingSocietyInfo.setLabel(societyInfo.getLabel());
			 existingSocietyInfo.setAddress(societyInfo.getAddress());
			 existingSocietyInfo.setPhone(societyInfo.getPhone());
			 existingSocietyInfo.setnBLicence(societyInfo.getnBLicence());
			 existingSocietyInfo.setResponsibleEmail(societyInfo.getResponsibleEmail());
			 existingSocietyInfo.setResponsibleName(societyInfo.getResponsibleName());
			 existingSocietyInfo.setPoppyGroup(poppyGroupQuery.list().get(0));
			 
			 session.update(existingSocietyInfo); trans.commit();
			 
			isUpdated = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	@SuppressWarnings("unchecked")
	public boolean addNewSociety(Society society) {
		boolean isAdded = false;
		Transaction trans = null;
		String hql = "FROM PoppyGroup WHERE GROUPLABEL = :GROUP";
		

		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			
			Query<PoppyGroup> query = session.createQuery(hql);
			query.setParameter("GROUP", society.getGroupLabel());
			society.setPoppyGroup(query.list().get(0));
			session.save(society);
			
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
//
	public boolean deleteSocietyInfo(String userID) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(userID);
			Object persistentInstance = session.load(Society.class, id);
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
//
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
//
//	@SuppressWarnings("unchecked")
//	public boolean uploadContinent(List<Country> editInfo) {
//		boolean isAdded = false;
//		Transaction trans = null;
//		try (Session session = sessionFactory.openSession()) {
//			String hql = "FROM Continent WHERE ContinentLabel = :LABEL";
//
//			trans = session.beginTransaction();
//			int i = 0;
//			for (Country country : editInfo) {
//				if (country.getContinentLabel().equalsIgnoreCase("Africa")
//						|| country.getContinentLabel().equalsIgnoreCase("Antarctica")
//						|| country.getContinentLabel().equalsIgnoreCase("Asia")
//						|| country.getContinentLabel().equalsIgnoreCase("Europe")
//						|| country.getContinentLabel().equalsIgnoreCase("NorthAmerica")
//						|| country.getContinentLabel().equalsIgnoreCase("Oceania")
//						|| country.getContinentLabel().equalsIgnoreCase("SouthAmerica")) {
//					Query<Continent> query = session.createQuery(hql);
//					query.setParameter("LABEL", country.getContinentLabel());
//
//					System.out.println(country.getContinentLabel());
//					List<Continent> asia = query.list();
//					Continent asiacontinet = asia.get(0);
//					System.out.println(asiacontinet);
//					country.setContinent(asiacontinet);
//					session.save(country);
//					i++;
//					if (i % 20 == 0) {
//						session.flush();
//						session.clear();
//					}
//				}
//			}
//			isAdded = true;
//			trans.commit();
//			System.out.println(i);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return isAdded;
//
//	}

}
