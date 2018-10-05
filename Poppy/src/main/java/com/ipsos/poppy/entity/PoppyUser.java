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

	@ManyToOne
	@JoinColumn(name = "ActivityPoleId")
	private ActivityPole activityPole;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "SurveysId")
	private Surveys surveys;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "VersionId")
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

 

}

