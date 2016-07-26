package com.markham.tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "settings")
@NamedQuery(name = "Settings.getSettings", query = "SELECT s FROM Settings s WHERE s.username = :username")
@Entity
public class Settings {

	@Id
	@Column(name = "username_fk")
	private String username;

	@Column(name = "profile_picure")
	private byte[] profilePicture;

	@Column(name = "profilePictureName")
	private String profilePictureName;

	public byte[] getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(byte[] profilePicture) {
		this.profilePicture = profilePicture;
	}

	public String getProfilePictureName() {
		return profilePictureName;
	}

	public void setProfilePictureName(String profilePictureName) {
		this.profilePictureName = profilePictureName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
