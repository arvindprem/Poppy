package com.ipsos.poppy.docs;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ipsos.poppy.entity.Document;

@Repository
public class UserDocumentRepository {
	@Autowired
	private SessionFactory sessionFactory;

	public boolean uploadDoc(Document doc) {
		boolean isAdded = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			session.save(doc);
			trans.commit();
			isAdded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isAdded;
	}

	@SuppressWarnings("unchecked")
	public String getUploadedDoc() {
		String jsonString = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			Query query = session.createQuery("From Document");
			List<Document> docList = query.getResultList();
			trans.commit();
			for (Document document : docList) {
				document.setContent(new byte[0]);
			}
			jsonString = new ObjectMapper().writeValueAsString(docList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonString;
	}

	public boolean deleteFile(String fileId) {
		boolean isDeleted = false;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			Serializable id = Integer.parseInt(fileId);
			Object persistentInstance = session.load(Document.class, id);
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

	public Document downloadFile(String fileId) {
		Document doc = null;
		try (Session session = sessionFactory.openSession()) {
			Transaction trans = session.beginTransaction();
			doc = session.get(Document.class, Integer.parseInt(fileId));
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doc;
	}

}