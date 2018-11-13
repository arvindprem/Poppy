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
public class PoppyGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GroupId")
	private long id;

	@Column(name = "GroupLabel", unique = true, nullable = false)
	private String label;

	@Column(name = "NbLicence")
	private String nblicence;

	@Column(name = "LicExpirationDate")
	private Date licexpirationdate;

	@Transient
	private String countryLabel;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "CountryId", referencedColumnName = "CountryId")
	private Country country;

	@JsonIgnore
	@OneToMany(mappedBy = "poppyGroup")
	private List<Society> society;

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

	public String getCountryLabel() {
		return countryLabel;
	}

	public void setCountryLabel(String countryLabel) {
		this.countryLabel = countryLabel;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public List<Society> getSociety() {
		return society;
	}

	public void setSociety(List<Society> society) {
		this.society = society;
	}

	@Override
	public String toString() {
		return "PoppyGroup [id=" + id + ", label=" + label + ", nblicence=" + nblicence + ", licexpirationdate="
				+ licexpirationdate + ", countryLabel=" + countryLabel + ", country=" + country + ", society=" + society
				+ "]";
	}

}
