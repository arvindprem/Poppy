package com.ipsos.poppy.entity;

import java.util.Date;
import java.util.List;
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
public class Society {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SocietyId")
	private long id;

	
	
	@Column(name = "SocietyLabel")
	private String label;

	@Column(name = "Address")
	private String address;

	@Column(name = "Phone")
	private String phone;

	@Column(name = "ResponsibleName")
	private String responsibleName;

	@Column(name = "ResponsibleEmail")
	private String responsibleEmail;

	@Column(name = "NBLicence")
	private String nBLicence;

	@Column(name = "LicExpirationDate")
	private Date licExpirationDate;

	

	@Transient
	private String groupLabel;
	
	


	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "GroupId", referencedColumnName = "GroupId")
	private PoppyGroup poppyGroup;
	
	@JsonIgnore
	@OneToMany(mappedBy = "society")
	private List<ActivityPole> activityPole;

	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	
	
	}
	
	public String getGroupLabel() {
		return groupLabel;
	}

	public void setGroupLabel(String groupLabel) {
		this.groupLabel = groupLabel;
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

	public List<ActivityPole> getActivityPole() {
		return activityPole;
	}

	public void setActivityPole(List<ActivityPole> activityPole) {
		this.activityPole = activityPole;
	}

	public PoppyGroup getPoppyGroup() {
		return poppyGroup;
	}

	public void setPoppyGroup(PoppyGroup poppyGroup) {
		this.poppyGroup = poppyGroup;
	}

	

	@Override
	public String toString() {
		return "Society [id=" + id + ", label=" + label + ", address=" + address
				+ ", phone=" + phone + ", responsibleName=" + responsibleName + ", responsibleEmail=" + responsibleEmail
				+ ", nBLicence=" + nBLicence + ", licExpirationDate=" + licExpirationDate + ", groupLabel=" + groupLabel
				+ ", poppyGroup=" + poppyGroup + ", activityPole=" + activityPole + "]";
	}
	

}
