package com.markham.tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name = "settings")
@Entity
public class Settings {

	@Id
	@Column(name = "username_fk")
	private String username;

	@Column(name = "profile_picure")
	private byte[] profilePicture;

	@Column(name = "profilePictureName")
	private String profilePictureName;

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "settings")
	private User user;

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
