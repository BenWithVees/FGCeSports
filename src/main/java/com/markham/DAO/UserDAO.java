package com.markham.DAO;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.markham.tables.Role;
import com.markham.tables.User;

@Component
@Transactional
public class UserDAO {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION, unitName = "samsung")
	@Qualifier(value = "entityManagerFactory")
	private EntityManager em;

	public User save(User user) {

		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(user.getPassword());

		user.setPassword(hashedPassword);

		Role role = new Role();
		role.setUsername(user.getUsername());
		role.setRole("ROLE_USER");

		Collection<Role> roles = new ArrayList<Role>();
		roles.add(role);
		user.setRoles(roles);

		user.setUserRoles(roles.size());
		em.persist(user);

		return user;
	}

	public void addUniqueRole(User user) {
		Role role = new Role();
		role.setRole("ROLE_" + user.getUsername());
		role.setUsername(user.getUsername());
		em.persist(role);
	}

	public User find(String username) {
		TypedQuery<User> query = em.createNamedQuery("User.findUsers", User.class);
		query.setParameter("username", username);
		User user = query.getSingleResult();
		return user;
	}

	public boolean findBool(String username) {
		TypedQuery<User> query = em.createNamedQuery("User.findUsers", User.class);
		query.setParameter("username", username);
		boolean found = true;
		try {
			query.getSingleResult();
		} catch (Exception e) {
			found = false;
		}
		return found;
	}

	public void resetPassword(User user) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(hashedPassword);
		em.merge(user);
	}

}
