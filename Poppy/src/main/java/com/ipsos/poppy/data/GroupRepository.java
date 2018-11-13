package com.ipsos.poppy.data;

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
import com.ipsos.poppy.entity.PoppyGroup;
@Repository
public class GroupRepository {
	@Autowired
	private SessionFactory sessionFactory;


	@SuppressWarnings("unchecked")
	public String getAllGroups() {
		String groupJson = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			List<PoppyGroup> jsonList = session.createQuery("From PoppyGroup").list();
			Map<String, Object>  groupDatamap = new HashMap<>();
			groupDatamap.put("data", jsonList);
			groupJson = new ObjectMapper().writeValueAsString(groupDatamap);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return groupJson;

	}

	public boolean editgroupInfo(PoppyGroup editInfo) {
		boolean isUpdated = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			if (checkLabelExist(session, editInfo)) {
				PoppyGroup poppyGroupDbValue = session.get(PoppyGroup.class, editInfo.getId());
				poppyGroupDbValue.setLabel(editInfo.getLabel());
				poppyGroupDbValue.setCountry(editInfo.getCountry());
				poppyGroupDbValue.setNblicence(editInfo.getNblicence());
				
				session.update(poppyGroupDbValue);
				trans.commit();
				isUpdated = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdated;
	}

	

	public boolean addNewGroup(PoppyGroup groupInfo) {
		boolean isAdded = false;
		Transaction trans = null;
		groupInfo. setLicexpirationdate(new Date());
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();

			if (checkLabelExist(session, groupInfo)) {
				session.save(groupInfo);
				trans.commit();
				isAdded = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isAdded;

	}
	
	@SuppressWarnings("unchecked")
	private boolean checkLabelExist(Session session, PoppyGroup groupInfo) {

		String hql = "FROM PoppyGroup WHERE Label = :LABEL";
		if (groupInfo.getId() != 0) {
			hql += " AND GroupId <> :GROUPID ";
		}
		Query<PoppyGroup> query = session.createQuery(hql);
		query.setParameter("LABEL", groupInfo.getLabel());
		if (groupInfo.getId() != 0) {
			query.setParameter("GROUPID", groupInfo.getId());
		}

		List<PoppyGroup> validCredential = query.list();
		return validCredential.isEmpty();
	}

	public boolean deletegroupInfo(String groupID) {
		boolean isDeleted = false;
		Transaction trans = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			Serializable id = Long.valueOf(groupID);
			Object persistentInstance = session.load(PoppyGroup.class, id);
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
	public String getFilteredResult(PoppyGroup filtered) {

		Transaction trans = null;
		String filteredJson = null;
		try (Session session = sessionFactory.openSession()) {
			trans = session.beginTransaction();
			String filterSearchQuery = queryMaker(filtered);

			System.out.println(filterSearchQuery);

			Query<PoppyGroup> query = session.createQuery(filterSearchQuery);

			if (!filtered.getLabel().equals("")) {
				System.out.println(1);
				query.setParameter("LABEL", filtered.getLabel());
			}
			if (!filtered.getCountry().equals("")) {
				System.out.println(3);
				query.setParameter("COUNTRY", filtered.getCountry());
			}
			if (!filtered.getNblicence().equals("")) {
				System.out.println(3);
				query.setParameter("NBLICENCE", filtered.getNblicence());
			}


			List<PoppyGroup> filteredList = query.list();
			Map<String, Object> groupDatamap = new HashMap<>();
			groupDatamap.put("data", filteredList);
			filteredJson = new ObjectMapper().writeValueAsString(groupDatamap);
			trans.commit();

			System.out.println("json " + filteredJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filteredJson;
	}

	private String queryMaker(PoppyGroup filtered) {
		String filterSearchQuery = null;
		StringBuilder sqlQuery = new StringBuilder("FROM PoppyGroup WHERE ");
		if (!filtered.getLabel().equals("")) {
			sqlQuery.append("Label= :LABEL AND ");
		}

		if (!filtered.getCountry().equals("")) {
			sqlQuery.append("country = :COUNTRY AND ");
		}
		if (!filtered.getNblicence().equals("")) {
			sqlQuery.append("NbLicence = :NBLICENECE AND ");
		}

		
		filterSearchQuery = sqlQuery.toString();
		filterSearchQuery = filterSearchQuery.substring(0, filterSearchQuery.lastIndexOf("AND"));
		return filterSearchQuery;
	}
}
