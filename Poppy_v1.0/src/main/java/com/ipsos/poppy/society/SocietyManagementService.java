package com.ipsos.poppy.society;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.ipsos.poppy.entity.Country;
//import com.ipsos.poppy.entity.Login;
import com.ipsos.poppy.entity.Society;

@Service
public class  SocietyManagementService {

	@Autowired
	private SocietyManagementRepository societyManagementDao;


	public String getAllSociety() {
		return societyManagementDao.getAllSociety();

	}

	public boolean editSocietyInfo(Society societyInfo) {
		return societyManagementDao.editSocietyInfo(societyInfo);
	}

	public boolean addNewSociety(Society society) {
		return societyManagementDao.addNewSociety(society);

	}

	public boolean deleteSocietyInfo(String userID) {
		return societyManagementDao.deleteSocietyInfo(userID);
	}

//	public String getFilterResult(Login filtered) {
//		return societyManagementDao.getFilteredResult(filtered);
//	}
//
//	public boolean uploadContinent(List<Country> editInfo) {
//		return societyManagementDao.uploadContinent(editInfo);
//	}

}
