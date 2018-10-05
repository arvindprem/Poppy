package com.ipsos.poppy.entity;

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
public class Country {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CountryId")
	private long id;

	@Column(name = "CountryLabel")
	private String label;

	@ManyToOne
	@JoinColumn(name = "ContinentId")
	private Continent continent;

	@OneToMany(mappedBy = "country")
	private Set<PoppyGroup> group;

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

	public Set<PoppyGroup> getGroup() {
		return group;
	}

	public void setGroup(Set<PoppyGroup> group) {
		this.group = group;
	}

}
