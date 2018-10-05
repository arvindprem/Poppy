package com.ipsos.poppy.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Continent {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ContinentId")
	private long id;
	
	@Column(name = "ContinentLabel")
	private String label;

	@OneToMany(mappedBy="continent")
	private Set<Country> country;

	public long getId() {
		return id;
	}

	public void setId(long continentId) {
		this.id = continentId;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
