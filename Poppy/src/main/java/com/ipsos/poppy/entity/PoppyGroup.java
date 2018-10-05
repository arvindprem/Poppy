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
public class PoppyGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GroupId")
	private long id;

	@Column(name = "GroupLabel")
	private String label;

	@Column(name = "NbLicence")
	private String nblicence;

	@Column(name = "LicExpirationDate")
	private Date licexpirationdate;

	@ManyToOne
	@JoinColumn(name = "CountryId",referencedColumnName="CountryId")
	private Country country;

	@OneToMany(mappedBy = "poppyGroup")
	private Set<Society> society;

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

	public String getNblicence() {
		return nblicence;
	}

	public void setNblicence(String nblicence) {
		this.nblicence = nblicence;
	}

	public Date getLicexpirationdate() {
		return licexpirationdate;
	}

	public void setLicexpirationdate(Date licexpirationdate) {
		this.licexpirationdate = licexpirationdate;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Set<Society> getSociety() {
		return society;
	}

	public void setSociety(Set<Society> society) {
		this.society = society;
	}

}
