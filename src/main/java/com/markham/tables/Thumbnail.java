package com.markham.tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "thumbnail")
@NamedQuery(name = "Thumbnail.getThumbnail", query = "SELECT t FROM Thumbnail t")
public class Thumbnail {

	@Id
	@Column(name = "id")
	private int id;

	@Column(name = "picture")
	private byte[] picture;

	@Column(name = "name")
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
