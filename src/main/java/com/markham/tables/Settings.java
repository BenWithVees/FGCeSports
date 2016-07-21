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
	@Column(name = "username")
	private String username;

	@Column(name = "profile_picure")
	private byte[] profilePictue;

	@Column(name = "profilePictureName")
	private String profilePictureName;

	@OneToOne(fetch = FetchType.LAZY)
	private User user;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public byte[] getProfilePictue() {
		return profilePictue;
	}

	public void setProfilePictue(byte[] profilePictue) {
		this.profilePictue = profilePictue;
	}

	public String getProfilePictureName() {
		return profilePictureName;
	}

	public void setProfilePictureName(String profilePictureName) {
		this.profilePictureName = profilePictureName;
	}

}
