package com.ipsos.poppy.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.admin.ChangePassword;
import com.ipsos.poppy.entity.Login;

@Service
public class LoginService {
	@Autowired private LoginRepository loginRepository;
	
	public Login validateUser(LoginInfo loginInfo) {
		return loginRepository.validateUser(loginInfo);
	}

	public boolean changePassword(ChangePassword changePassword ) {
		return loginRepository.changePassword(changePassword);
	}
}
