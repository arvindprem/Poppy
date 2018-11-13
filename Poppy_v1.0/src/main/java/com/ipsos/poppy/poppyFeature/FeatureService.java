package com.ipsos.poppy.poppyFeature;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipsos.poppy.entity.PoppyFeatures;
@Service
public class FeatureService {
	@Autowired
	private FeatureRepository featureDao;


	public String getAllFeatures() {
		return featureDao.getAllFeatures();

	}
	
	public boolean addNewFeature(PoppyFeatures feature) {
		return featureDao.addNewFeature(feature);

	}
	public boolean editFeatureInfo(PoppyFeatures featureInfo) {
		return featureDao.editFeatureInfo(featureInfo);
	}
	public boolean deleteFeatureInfo(String featureId) {
		return featureDao.deleteFeatureInfo(featureId);
	}



}
