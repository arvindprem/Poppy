package com.ipsos.poppy.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ActivityPole {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ActivityPoleId")
	private long id;

	@Column(name = "ActivityPoleLabel")
	private String label;

	@Column(name = "ActivityPoleAddress")
	private String address;

	@Column(name = "ActivityPolePhone")
	private String phone;

	@Column(name = "ActivityPoleResponsableName")
	private String responsibleName;

	@Column(name = "ActivityPoleResponsableEmail")
	private String responsibleEmail;

	@Column(name = "ActivityPoleNBLicence")
	private String nBLicence;

	@Column(name = "ActivityPoleLicExpirationDate")
	private Date licExpirationDate;
	
	@Transient
	private String societyLabel;
	@Transient
	private String filter;
	
	@Transient
	private String featureLabel;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "SocietyId" ,referencedColumnName = "SocietyId")
	private Society society;
	@JsonIgnore
	@OneToMany(mappedBy = "activityPole")
	private Set<PoppyUser> poppyUser;
	
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "AllowSurveysId" ,referencedColumnName = "AllowSurveysId")
	private AllowSurveys allowSurveys;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "FeaturesId",referencedColumnName = "FeaturesId")
	private PoppyFeatures poppyFeatures;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getResponsibleName() {
		return responsibleName;
	}

	public void setResponsibleName(String responsibleName) {
		this.responsibleName = responsibleName;
	}

	public String getResponsibleEmail() {
		return responsibleEmail;
	}

	public void setResponsibleEmail(String responsibleEmail) {
		this.responsibleEmail = responsibleEmail;
	}

	public String getnBLicence() {
		return nBLicence;
	}

	public void setnBLicence(String nBLicence) {
		this.nBLicence = nBLicence;
	}

	public Date getLicExpirationDate() {
		return licExpirationDate;
	}

	public void setLicExpirationDate(Date licExpirationDate) {
		this.licExpirationDate = licExpirationDate;
	}	



	public String getSocietyLabel() {
		return societyLabel;
	}

	public void setSocietyLabel(String societyLabel) {
		this.societyLabel = societyLabel;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getFeatureLabel() {
		return featureLabel;
	}

	public void setFeatureLabel(String featureLabel) {
		this.featureLabel = featureLabel;
	}

	public Society getSociety() {
		return society;
	}

	public void setSociety(Society society) {
		this.society = society;
	}

	public Set<PoppyUser> getPoppyUser() {
		return poppyUser;
	}

	public void setPoppyUser(Set<PoppyUser> poppyUser) {
		this.poppyUser = poppyUser;
	}

	public AllowSurveys getAllowSurveys() {
		return allowSurveys;
	}

	public void setAllowSurveys(AllowSurveys allowSurveys) {
		this.allowSurveys = allowSurveys;
	}

	public PoppyFeatures getPoppyFeatures() {
		return poppyFeatures;
	}

	public void setPoppyFeatures(PoppyFeatures poppyFeatures) {
		this.poppyFeatures = poppyFeatures;
	}

	@Override
	public String toString() {
		return "ActivityPole [id=" + id + ", label=" + label + ", address=" + address + ", phone=" + phone
				+ ", responsibleName=" + responsibleName + ", responsibleEmail=" + responsibleEmail + ", nBLicence="
				+ nBLicence + ", licExpirationDate=" + licExpirationDate + ", societyLabel=" + societyLabel
				+ ", filter=" + filter + ", featureLabel=" + featureLabel + ", society=" + society + ", poppyUser="
				+ poppyUser + ", allowSurveys=" + allowSurveys + ", poppyFeatures=" + poppyFeatures + "]";
	}

}
