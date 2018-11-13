package com.ipsos.poppy.activitypole;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.ActivityPole;
@Service
public class ActivityPoleService {

	@Autowired
	private ActivityPoleRepository activityPoleDao;


	public String getAllActivityPole() {
		return activityPoleDao.getAllActivityPole();

	}

	public boolean editActivityPoleInfo(ActivityPole  activityPoleInfo) {
		return activityPoleDao.editActivityPoleInfo( activityPoleInfo);
	}

	public boolean addNewActivityPole(ActivityPole activityPole) {
		return activityPoleDao.addNewActivityPole( activityPole);

	}

	public boolean deleteActivityPoleInfo(String userID) {
		return activityPoleDao.deleteActivityPoleInfo(userID);
	}
//
//	public String getFilterResult(Login filtered) {
//		return ActivityPoleDao.getFilteredResult(filtered);
//	}
//
//	public boolean uploadContinent(List<Country> editInfo) {
//		return activityPoleDao.uploadContinent(editInfo);
//	}

}
