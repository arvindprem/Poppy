package com.ipsos.poppy.entity;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Surveys {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	@Column(name = "SurveysId")
	private long id;

	@Column(name = "Version")
	private String version;

	@Column(name = "CreationDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date creationDateTime;

	
	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "Extension")
	private String extension;

	@Column(name = "type", nullable = false)
	private String type;

	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name = "content", nullable = false, columnDefinition = "mediumblob")
	private byte[] content;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	
	public String getCreationDateTime() {
		SimpleDateFormat formatter= new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		if(creationDateTime !=null ) {
			return formatter.format(creationDateTime);
		} else {
			return formatter.format(new Date());
		}
		
	}

	
	public void setCreationDateTime(Date creationDateTime) {
		this.creationDateTime = creationDateTime;
	}
	



	@Override
	public String toString() {
		return "Surveys [id=" + id + ", version=" + version + ", creationDateTime=" + creationDateTime + ", name="
				+ name + ", description=" + description + ", extension=" + extension + ", type=" + type + ", content="
				+ Arrays.toString(content) + "]";
	}

}

