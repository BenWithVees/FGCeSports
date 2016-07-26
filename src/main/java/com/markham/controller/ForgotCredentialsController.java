package com.markham.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.markham.DAO.Email;
import com.markham.DAO.UserDAO;
import com.markham.tables.User;

public class ForgotCredentialsController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private Email email;

	@RequestMapping(value = "/forgotusername", method = RequestMethod.GET)
	public ModelAndView forgotUsername() {
		ModelAndView view = new ModelAndView();
		User user = new User();
		view.addObject("user", user);
		return view;

	}

	@RequestMapping(value = "/forgotusername", method = RequestMethod.POST)
	public ModelAndView forgotUsernamePost(@ModelAttribute("user") User user,
			@RequestParam(value = "error", required = false) String error) {
		ModelAndView view = new ModelAndView();
		try {
			user = userDAO.findByEmail(user.getEmail());
			email.forgotUsername(user);
			view.setViewName("redirect:/login");
		} catch (Exception e) {
			view.addObject("error", "Invalid email address");
		}

		return view;
	}

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public ModelAndView forgotPassword() {
		ModelAndView view = new ModelAndView();
		return view;

	}
}
