package com.ipsos.poppy.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class PoppyVersion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "VersionID")
	private long versionId;
	@Column(name = "Version")
	private String version;
    @Column(name = "CreationDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creationDateTime;
	@Column(name = "DownloadPath")
	private String downloadPath;

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getCreationDateTime() {
		SimpleDateFormat formatter= new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		if(creationDateTime !=null ) {
			return formatter.format(creationDateTime);
		} else {
			return formatter.format(new Date());
		}
		
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

	public long getVersionId() {
		return versionId;
	}

	public void setVersionId(long versionId) {
		this.versionId = versionId;
	}

	@Override
	public String toString() {
		return "PoppyVersion [versionId=" + versionId + ", version=" + version + ", creationDateTime="
				+ creationDateTime + ", downloadPath=" + downloadPath + "]";
	}

}
