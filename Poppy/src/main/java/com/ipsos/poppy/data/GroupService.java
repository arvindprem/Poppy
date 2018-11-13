package com.ipsos.poppy.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.PoppyGroup;
@Service
public class GroupService {
	@Autowired 
	public GroupRepository groupDao;
	public String getAllgroups() {
		return groupDao.getAllGroups();

	}

	public boolean editgroupInfo(PoppyGroup editInfo) {
		return groupDao.editgroupInfo(editInfo);
	}

	public boolean addNewGroup(PoppyGroup groupInfo) {
		return groupDao.addNewGroup(groupInfo);

	}

	public boolean deletegroupInfo(String groupID) {
		return groupDao.deletegroupInfo(groupID);
	}

	public String getFilterResult(PoppyGroup filtered) {
		return groupDao.getFilteredResult(filtered);
	}

}