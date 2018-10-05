package com.ipsos.poppy.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

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
	private String responsableName;

	@Column(name = "ActivityPoleResponsableEmail")
	private String responsableEmail;

	@Column(name = "ActivityPoleNBLicence")
	private String nBLicence;

	@Column(name = "ActivityPoleLicExpirationDate")
	private Date licExpirationDate;

	@ManyToOne
	@JoinColumn(name = "SocietyId")
	private Society society;

	@OneToMany(mappedBy = "activityPole")
	private Set<PoppyUser> poppyUser;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "AllowSurveysId")
	private AllowSurveys allowSurveys;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FeaturesId")
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

	public String getResponsableName() {
		return responsableName;
	}

	public void setResponsableName(String responsableName) {
		this.responsableName = responsableName;
	}

	public String getResponsableEmail() {
		return responsableEmail;
	}

	public void setResponsableEmail(String responsableEmail) {
		this.responsableEmail = responsableEmail;
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

}
