package com.markham.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class PlayersController {

	@RequestMapping(value = "/players/{playerName}", method = RequestMethod.GET)
	public ModelAndView playerProfile(@PathVariable String playerName) {
		ModelAndView view = new ModelAndView();
		view.setViewName("playerprofile");
		return view;
	}

}
