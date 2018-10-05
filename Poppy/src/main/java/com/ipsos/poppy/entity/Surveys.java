package com.ipsos.poppy.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Surveys {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SurveysId")
	private long id;

	@Column(name = "Version")
	private String version;

	@Column(name = "CreationDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creationDateTime;

	@Column(name = "DownloadPath")
	private String downloadPath;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public Date getCreationDateTime() {
		return creationDateTime;
	}

	public void setCreationDateTime(Date creationDateTime) {
		this.creationDateTime = creationDateTime;
	}

	public String getDownloadPath() {
		return downloadPath;
	}

	public void setDownloadPath(String downloadPath) {
		this.downloadPath = downloadPath;
	}

}
