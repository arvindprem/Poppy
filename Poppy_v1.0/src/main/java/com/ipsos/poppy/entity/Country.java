package com.ipsos.poppy.entity;

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

@Entity
public class Country {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CountryId")
	private long id;

	@Column(name = "CountryLabel", nullable = false, unique = true)
	private String label;

	@Transient
	private String continentLabel;

	@ManyToOne
	@JoinColumn(name = "ContinentId")
	private Continent continent;

	@OneToMany(mappedBy = "country")
	private List<PoppyGroup> group;

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

	public Continent getContinent() {
		return continent;
	}

	public void setContinent(Continent continent) {
		this.continent = continent;
	}

	public List<PoppyGroup> getGroup() {
		return group;
	}

	public void setGroup(List<PoppyGroup> group) {
		this.group = group;
	}

	public String getContinentLabel() {
		return continentLabel;
	}

	public void setContinentLabel(String continentLabel) {
		this.continentLabel = continentLabel;
	}

	@Override
	public String toString() {
		return "Country [id=" + id + ", label=" + label + ", continentLabel=" + continentLabel + ", continent="
				+ continent + ", group=" + group + "]";
	}
}
