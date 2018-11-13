package com.ipsos.poppy.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.Login;

@Service
public class UserManagementService {

	@Autowired
	private UserManagementRepository userManagementDao;


	public String getAllusers() {
		return userManagementDao.getAllUsers();

	}

	public boolean edituserInfo(Login editInfo) {
		return userManagementDao.edituserInfo(editInfo);
	}

	public boolean addNewUser(Login userInfo) {
		return userManagementDao.addNewUser(userInfo);

	}

	public boolean deleteUserInfo(String userID) {
		return userManagementDao.deleteUserInfo(userID);
	}

	public String getFilterResult(Login filtered) {
		return userManagementDao.getFilteredResult(filtered);
	}

}
