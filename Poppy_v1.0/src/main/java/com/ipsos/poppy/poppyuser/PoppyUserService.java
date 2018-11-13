package com.ipsos.poppy.poppyuser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.PoppyUser;

@Service
public class PoppyUserService {
	@Autowired
	private PoppyUserRepository poppyuserDao;


	public String getAllPoppyUsers() {
		return poppyuserDao.getAllPoppyUsers();

	}

	public boolean addNewPoppyUser(PoppyUser poppyuser) {
		return poppyuserDao.addNewPoppyUser(poppyuser);

	}
	public boolean editPoppyUserInfo(PoppyUser poppyuser) {
		return poppyuserDao.editPoppyUserInfo(poppyuser);
	}
	public boolean deletePoppyUserInfo(String userID) {
		return poppyuserDao.deletePoppyUserInfo(userID);
	}


}
