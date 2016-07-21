package com.markham.tables;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@NamedQueries({ @NamedQuery(name = "User.findUsers", query = "SELECT u FROM User u WHERE u.username = :username"),
		@NamedQuery(name = "User.findUsersByEmail", query = "SELECT u FROM User u where u.email = :email") })
@Table(name = "users")
public class User {

	@Id
	@Column(name = "user_id")
	private int userId;

	@Column(name = "username", insertable = false, updatable = false)
	private String username;

	@Column(name = "firstname")
	private String firsname;

	@Column(name = "lastname")
	private String lastname;

	@Column(name = "password")
	private String password;

	@Column(name = "password_placeholder")
	private String passwordPlaceholder;

	@Column(name = "email")
	private String email;

	@Column(name = "user_roles", nullable = false)
	private int user_roles;

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "users_roles", joinColumns = {
			@JoinColumn(name = "user_id", referencedColumnName = "user_id") }, inverseJoinColumns = {
					@JoinColumn(name = "user_role_id", referencedColumnName = "user_role_id") })
	private Collection<Role> roles;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "username")
	private Settings settings;

	public User() {
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirsname() {
		return firsname;
	}

	public void setFirsname(String firsname) {
		this.firsname = firsname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordPlaceholder() {
		return passwordPlaceholder;
	}

	public void setPasswordPlaceholder(String passwordPlaceholder) {
		this.passwordPlaceholder = passwordPlaceholder;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUser_roles() {
		return user_roles;
	}

	public void setUser_roles(int user_roles) {
		this.user_roles = user_roles;
	}

	public int getUserId() {
		return userId;
	}

	public int getUserRoles() {
		return user_roles;
	}

	public void setUserRoles(int user_roles) {
		this.user_roles = user_roles;
	}

	public Collection<Role> getRoles() {
		return roles;
	}

	public void setRoles(Collection<Role> roles) {
		this.roles = roles;
	}

	public Settings getSettings() {
		return settings;
	}

	public void setSettings(Settings settings) {
		this.settings = settings;
	}

}
