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

	public void setSample(String sample) {
		this.sample = sample;
	}
}
