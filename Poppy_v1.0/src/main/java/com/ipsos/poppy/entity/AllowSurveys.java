package com.ipsos.poppy.entity;

import java.util.Date;

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
public class AllowSurveys {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AllowSurveysId")
	private long id;

	@Column(name = "Filter")
	private String filter;

	@Column(name = "ExpirationDate")
	@Temporal(TemporalType.TIMESTAMP)
	private Date expirationDate;

	@Column(name = "Sample")
	private String sample;
	
	@Transient
	private String version;
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "SurveysId" ,referencedColumnName = "SurveysId")
	private Surveys surveys;

	public long getId() {
		return id;
	}
	

	public void setId(long id) {
		this.id = id;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getSample() {
		return sample;
	}
	

	

	public Surveys getSurveys() {
		return surveys;
	}


	public void setSurveys(Surveys surveys) {
		this.surveys = surveys;
	}





	public String getVersion() {
		return version;
	}


	public void setVersion(String version) {
		this.version = version;
	}


	public void setSample(String sample) {
		this.sample = sample;
	}

	@Override
	public String toString() {
		return "AllowSurveys [id=" + id + ", filter=" + filter + ", expirationDate=" + expirationDate + ", sample="
				+ sample + ", version=" + version + ", surveys=" + surveys + "]";
	}
}


