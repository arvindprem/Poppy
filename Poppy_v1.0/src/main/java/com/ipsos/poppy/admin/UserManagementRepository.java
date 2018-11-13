package com.ipsos.poppy.admin;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.Login;

@Repository
public class UserManagementRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public String getAllUsers() {
		String userJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<Login> jsonList = session.createQuery("From Login").list();
			Map<String, Object> userDatamap = new HashMap<>();
			userDatamap.put("data", jsonList);
			userJson = new ObjectMapper().writeValueAsString(userDatamap);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userJson;

	}

	public boolean edituserInfo(Login editInfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			if (checkUserNameExist(session, editInfo)) {
				Login loginDbValue = session.get(Login.class, editInfo.getId());
				loginDbValue.setUserName(editInfo.getUserName());
				loginDbValue.setCountry(editInfo.getCountry());
				loginDbValue.setLevel(editInfo.getLevel());
				loginDbValue.setFirstName(editInfo.getFirstName());
				loginDbValue.setWatchWord(editInfo.getWatchWord());
				session.update(loginDbValue);
				trans.commit();
				isUpdated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}

	public boolean addNewUser(Login userInfo) {
		boolean isAdded = false;
		Transaction trans = null;
		userInfo.setCreationDateTime(new Date());
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();

			if (checkUserNameExist(session, userInfo)) {
				session.save(userInfo);
				trans.commit();
				isAdded = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}

	@SuppressWarnings("unchecked")
	public boolean checkUserNameExist(Session session, Login userInfo) {
		String hql = "FROM Login WHERE UserName = :USERNAME";
		if (userInfo.getId() != 0) {
			hql += " AND UserId <> :USERID ";
		}
		Query<Login> query = session.createQuery(hql);
		query.setParameter("USERNAME", userInfo.getUserName());
		if (userInfo.getId() != 0) {
			query.setParameter("USERID", userInfo.getId());
		}

		List<Login> validCredential = query.list();
		return validCredential.isEmpty();
	}

	public boolean deleteUserInfo(String userID) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(userID);
			Object persistentInstance = session.load(Login.class, id);
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

	@SuppressWarnings("unchecked")
	public String getFilteredResult(Login filtered) {
		Transaction trans = null;
		String filteredJson = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			String filterSearchQuery = queryMaker(filtered);

			System.out.println(filterSearchQuery);

			Query<Login> query = session.createQuery(filterSearchQuery);

			if (!filtered.getUserName().equals("")) {
				System.out.println(1);
				query.setParameter("USERNAME", filtered.getUserName());
			}
			if (!filtered.getCountry().equals("")) {
				System.out.println(3);
				query.setParameter("COUNTRY", filtered.getCountry());
			}

			if (!filtered.getLevel().equals("")) {
				query.setParameter("LEVEL", filtered.getLevel());
				System.out.println(2);
			}

			List<Login> filteredList = query.list();
			Map<String, Object> userDatamap = new HashMap<>();
			userDatamap.put("data", filteredList);
			filteredJson = new ObjectMapper().writeValueAsString(userDatamap);
			trans.commit();

			System.out.println("json " + filteredJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filteredJson;
	}

	private String queryMaker(Login filtered) {

		String filterSearchQuery = null;
		StringBuilder sqlQuery = new StringBuilder("FROM Login WHERE ");
		if (!filtered.getUserName().equals("")) {
			sqlQuery.append("UserName = :USERNAME AND ");
		}

		if (!filtered.getCountry().equals("")) {
			sqlQuery.append("country = :COUNTRY AND ");
		}

		if (!filtered.getLevel().equals("")) {
			sqlQuery.append("Level = :LEVEL AND ");
		}
		filterSearchQuery = sqlQuery.toString();
		filterSearchQuery = filterSearchQuery.substring(0, filterSearchQuery.lastIndexOf("AND"));
		return filterSearchQuery;
	}

}
