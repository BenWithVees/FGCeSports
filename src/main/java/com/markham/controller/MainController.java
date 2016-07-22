package com.markham.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.markham.DAO.Email;
import com.markham.DAO.UserDAO;
import com.markham.tables.Settings;
import com.markham.tables.User;

@RestController
public class MainController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private Email email;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView();
		view.setViewName("index");
		return view;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView view = new ModelAndView();
		if (error != null) {
			view.addObject("error", "Invalid username and password!");
		}
		return view;
	}

	@RequestMapping(value = "players", method = RequestMethod.GET)
	public ModelAndView players() {
		ModelAndView view = new ModelAndView();
		return view;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView view = new ModelAndView();
		User user = new User();
		view.addObject("user", user);
		return view;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerPost(@ModelAttribute("user") User user, BindingResult result, Model model) {
		ModelAndView view = new ModelAndView();
		try {
			userDAO.find(user.getUsername());
			view.addObject("error", "That username already exists. Please pick another.");
			userDAO.findByEmail(user.getEmail());
			view.addObject("errorEmail", "That email has already been reigstered.");
		} catch (Exception e) {
			System.out.println(e);
			try {
				email.placeOrder(user);
				userDAO.save(user);
				userDAO.addUniqueRole(user);
				view.setViewName("redirect:/login");
			} catch (MailSendException f) {
				System.err.println(f);
				view.addObject("emailError", "That's an invalid email address.");
			}

		}
		return view;
	}

	@RequestMapping(value = "/games", method = RequestMethod.GET)
	public ModelAndView games() {
		ModelAndView view = new ModelAndView();
		return view;

	}

	@RequestMapping(value = "/{userName}", method = RequestMethod.GET)
	public ModelAndView userProfile(@PathVariable String userName) {
		ModelAndView view = new ModelAndView();
		Settings settings = new Settings();
		try {
			userDAO.find(userName);
		} catch (Exception e) {
			System.err.println(e);
			return new ModelAndView("redirect:/404");
		}
		view.addObject("userName", userName);
		view.addObject("settings", settings);
		view.setViewName("userpage");
		return view;
	}

	@RequestMapping(value = "/{userName}", method = RequestMethod.POST)
	public @ResponseBody String userProfilePost(@PathVariable String userName,
			@RequestParam("file") MultipartFile file) {
		String fileName = null;
		if (!file.isEmpty()) {
			try {
				fileName = file.getOriginalFilename();
				byte[] bytes = file.getBytes();
				BufferedOutputStream buffStream = new BufferedOutputStream(
						new FileOutputStream(new File("/Users/ben/Desktop/" + fileName)));
				buffStream.write(bytes);
				buffStream.close();
				return "You have successfully uploaded " + fileName;
			} catch (Exception e) {
				return "You failed to upload " + fileName + ": " + e.getMessage();
			}
		} else {
			return "Unable to upload. File is empty.";
		}

	}

	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public ModelAndView notFound() {
		ModelAndView view = new ModelAndView();
		return view;
	}

	@RequestMapping(value = "/newpassword", method = RequestMethod.GET)
	public ModelAndView newPassword() {
		ModelAndView view = new ModelAndView();
		User user = new User();
		view.addObject("user", user);
		return view;
	}

	@RequestMapping(value = "/newpassword", method = RequestMethod.POST)
	public ModelAndView newPasswordPost(@ModelAttribute("user") User user,
			@RequestParam(value = "error", required = false) String error) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // get logged in username
		User compareUser = userDAO.find(name);
		ModelAndView view = new ModelAndView();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if (!(passwordEncoder.matches(user.getPassword(), compareUser.getPassword()))) {
			view.addObject("error", "Your old password doesn't match");
		} else {
			compareUser.setPassword(user.getPasswordPlaceholder());
			userDAO.resetPassword(compareUser);
			view.setViewName("redirect:/");
		}

		return view;
	}

	@RequestMapping(value = "/forgotusername", method = RequestMethod.GET)
	public ModelAndView forgotPassword() {
		ModelAndView view = new ModelAndView();
		User user = new User();
		view.addObject("user", user);
		return view;

	}

	@RequestMapping(value = "/forgotusername", method = RequestMethod.POST)
	public ModelAndView forgotPasswordPost(@ModelAttribute("user") User user,
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

	@RequestMapping(value = "/streams", method = RequestMethod.GET)
	public ModelAndView streams() {
		ModelAndView view = new ModelAndView();
		return view;
	}

}
