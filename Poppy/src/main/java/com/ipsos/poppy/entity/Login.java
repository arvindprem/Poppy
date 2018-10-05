package com.ipsos.poppy.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Login {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UserId")
	private long id;

	@Column(name = "UserName", unique = true, nullable = false)
	private String userName;

	@Column(name = "FirstName", unique = false, nullable = false)
	private String firstName;

	@Column(name = "Level", nullable = false)
	private String level;

	@Column(name = "Password", nullable = false)
	private String watchWord;

	@Column(name = "Country", nullable = false)
	private String country;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CreationDateTime")
	private Date creationDateTime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getWatchWord() {
		return watchWord;
	}

	public void setWatchWord(String watchWord) {
		this.watchWord = watchWord;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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
		return "Login [id=" + id + ", userName=" + userName + ", firstName=" + firstName + ", level=" + level
				+ ", watchWord=" + watchWord + ", country=" + country + ", creationDateTime=" + creationDateTime + "]";
	}

}
