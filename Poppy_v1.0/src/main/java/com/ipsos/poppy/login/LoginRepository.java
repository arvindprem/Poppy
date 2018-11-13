package com.ipsos.poppy.login;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ipsos.poppy.admin.ChangePassword;
import com.ipsos.poppy.entity.Login;

@Repository
public class LoginRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public Login validateUser(LoginInfo loginInfo) {
		Login validUser = null;
		try (Session session = sessionFactory.openSession()) {
			String hql = "FROM Login  WHERE UserName = :USERNAME AND Password= :PASSWORD";
			Query<Login> query = session.createQuery(hql);
			query.setParameter("USERNAME", loginInfo.getUserName());
			query.setParameter("PASSWORD", loginInfo.getWatchWord());
			List<Login> validCredential = query.list();
			if (!validCredential.isEmpty()) {
				validUser = validCredential.get(0);
				System.out.println(validUser);
			} else {
				validUser = new Login();
				validUser.setUserName("");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return validUser;
	}

	@SuppressWarnings("unchecked")
	public boolean changePassword(ChangePassword changePassword) {
		boolean isChanged = false;
		Login changeUser = null;
		try (Session session = sessionFactory.openSession()) {
			String hql = "FROM Login WHERE UserName = :USERNAME AND Password= :PASSWORD";
			Query<Login> query = session.createQuery(hql);
			System.out.println(122);
			query.setParameter("USERNAME", changePassword.getUserName());
			query.setParameter("PASSWORD", changePassword.getCurrentWatchWord());
			List<Login> validCredential = query.list();
			if (!validCredential.isEmpty()) {
				Transaction transcation= session.beginTransaction();
				changeUser = validCredential.get(0);
				changeUser.setWatchWord(changePassword.getNewWatchWord());
				session.update(changeUser);
				transcation.commit();
				isChanged=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isChanged;
	}

}
