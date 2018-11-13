package com.ipsos.poppy.group;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.ipsos.poppy.entity.Country;
//import com.ipsos.poppy.entity.Login;
import com.ipsos.poppy.entity.PoppyGroup;

@Service
public class GroupManagementService {

	@Autowired
	private GroupManagementRepository groupManagementDao;


	public String getAllgroups() {
		return groupManagementDao.getAllgroups();

	}

	public boolean editGroupInfo(PoppyGroup groupInfo) {
		return groupManagementDao.editGroupInfo(groupInfo);
	}

	public boolean addNewGroup(PoppyGroup poppyGroup) {
		return groupManagementDao.addNewGroup(poppyGroup);

	}

	public boolean deleteGroupInfo(String userID) {
		return groupManagementDao.deleteGroupInfo(userID);
	}

//	public String getFilterResult(Login filtered) {
//		return groupManagementDao.getFilteredResult(filtered);
//	}
//
//	public boolean uploadContinent(List<Country> editInfo) {
//		return groupManagementDao.uploadContinent(editInfo);
//	}

}
