package com.ipsos.poppy.poppyversion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.PoppyVersion;

@Service
public class PoppyVersionService {
	@Autowired
	private PoppyVersionRepository poppyversionDao;


	public String getAllPoppyVersions() {
		return poppyversionDao.getAllPoppyVersions();

	}

	public boolean addNewPoppyVersion(PoppyVersion poppyversion) {
		return poppyversionDao.addNewPoppyVersion(poppyversion);

	}
	
	public boolean editPoppyVersionInfo(PoppyVersion poppyversionInfo) {
		return poppyversionDao.editPoppyVersionInfo(poppyversionInfo);
	}
	
	public boolean deletePoppyVersionInfo(String userID) {
		return poppyversionDao.deletePoppyversionInfo(userID);
	}

}
