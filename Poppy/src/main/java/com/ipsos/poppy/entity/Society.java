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

@Entity
public class Society {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SocietyId")
	private long id;

	@Column(name = "Label")
	private String label;

	@Column(name = "Address")
	private String address;

	@Column(name = "Phone")
	private String phone;

	@Column(name = "ResponsableName")
	private String responsableName;

	@Column(name = "responsableEmail")
	private String responsableEmail;

	@Column(name = "NBLicence")
	private String nBLicence;

	@Column(name = "LicExpirationDate")
	private Date licExpirationDate;

	@OneToMany(mappedBy = "society")
	private Set<ActivityPole> activityPole;

	@ManyToOne
	@JoinColumn(name = "GroupId")
	private PoppyGroup poppyGroup;

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

	public Set<ActivityPole> getActivityPole() {
		return activityPole;
	}

	public void setActivityPole(Set<ActivityPole> activityPole) {
		this.activityPole = activityPole;
	}

	public PoppyGroup getPoppyGroup() {
		return poppyGroup;
	}

	public void setPoppyGroup(PoppyGroup poppyGroup) {
		this.poppyGroup = poppyGroup;
	}

	

}
