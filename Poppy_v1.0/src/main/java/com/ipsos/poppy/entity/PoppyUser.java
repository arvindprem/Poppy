package com.ipsos.poppy.entity;


import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class PoppyUser {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UserId")
	private long id;

	@Column(name = "Name", nullable = false, unique = true)
	private String name;

	@Column(name = "FirstName")
	private String firstName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LicExpirationDate")
	private Date licExpirationDate;
	
	@Transient
	private String activityPoleLabel;
	@Transient
	private String version;
	@Transient
	private String version1;
	
	
	
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ActivityPoleId",referencedColumnName = "ActivityPoleId")
	private ActivityPole activityPole;
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "SurveysId",referencedColumnName ="SurveysId")
	private Surveys surveys;
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "VersionId",referencedColumnName ="VersionId")
	private PoppyVersion poppyVersion;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public Date getLicExpirationDate() {
		return licExpirationDate;
	}

	public void setLicExpirationDate(Date licExpirationDate) {
		this.licExpirationDate = licExpirationDate;
	}

	public ActivityPole getActivityPole() {
		return activityPole;
	}

	public void setActivityPole(ActivityPole activityPole) {
		this.activityPole = activityPole;
	}

	public Surveys getSurveys() {
		return surveys;
	}

	public void setSurveys(Surveys surveys) {
		this.surveys = surveys;
	}

	public PoppyVersion getPoppyVersion() {
		return poppyVersion;
	}

	public void setPoppyVersion(PoppyVersion poppyVersion) {
		this.poppyVersion = poppyVersion;
	}

	

	

	public String getActivityPoleLabel() {
		return activityPoleLabel;
	}

	public void setActivityPoleLabel(String activityPoleLabel) {
		this.activityPoleLabel = activityPoleLabel;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getVersion1() {
		return version1;
	}

	public void setVersion1(String version1) {
		this.version1 = version1;
	}

	@Override
	public String toString() {
		return "PoppyUser [id=" + id + ", name=" + name + ", firstName=" + firstName + ", licExpirationDate="
				+ licExpirationDate + ", activityPoleLabel=" + activityPoleLabel + ", version=" + version
				+ ", version1=" + version1 + ", activityPole=" + activityPole + ", surveys=" + surveys
				+ ", poppyVersion=" + poppyVersion + "]";
	}

}
