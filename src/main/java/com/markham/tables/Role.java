package com.markham.tables;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * JPA entity for user_roles table.
 *
 */
@Entity
@Table(name = "user_roles")
public class Role implements Serializable {

	private static final long serialVersionUID = -157480793624021991L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_role_id")
	private int user_rold_id;

	@Column(name = "username")
	private String username;

	@Column(name = "role")
	private String role;

	@ManyToMany(mappedBy = "roles")
	private Collection<User> users;

	public int getUser_rold_id() {
		return user_rold_id;
	}

	public void setUser_rold_id(int user_rold_id) {
		this.user_rold_id = user_rold_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Collection<User> getUsers() {
		return users;
	}

	public void setUsers(Collection<User> users) {
		this.users = users;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + user_rold_id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Role other = (Role) obj;
		if (user_rold_id != other.user_rold_id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Role [user_rold_id=" + user_rold_id + ", username=" + username + ", role=" + role + "]";
	}

}
