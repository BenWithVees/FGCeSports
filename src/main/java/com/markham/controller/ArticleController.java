package com.markham.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.markham.DAO.UserDAO;
import com.markham.tables.Articles;
import com.markham.tables.Thumbnail;
import com.markham.tables.Tournaments;

@RestController
public class ArticleController {

	@Autowired
	private UserDAO userDAO;

	@PreAuthorize("hasRole('ROLE_Creater')")
	@RequestMapping(value = "/addarticle", method = RequestMethod.GET)
	public ModelAndView addArticle() {
		ModelAndView view = new ModelAndView();
		Articles articles = new Articles();
		List<Thumbnail> thumbnail = userDAO.getThumbnail();
		List<String> thumbnailName = new ArrayList<String>();
		for (int i = 0; i < thumbnail.size(); i++) {
			thumbnailName.add(thumbnail.get(i).getName());
		}
		view.addObject("thumbnailName", thumbnailName);
		view.addObject("article", articles);
		return view;
	}

	@PreAuthorize("hasRole('ROLE_Creater')")
	@RequestMapping(value = "addarticle", method = RequestMethod.POST)
	public ModelAndView addArticlePost(@ModelAttribute("article") Articles articles) {
		ModelAndView view = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		userDAO.submitArticle(articles, name);
		view.setViewName("redirect:/" + articles.getArticleTitle());
		return view;
	}

	@RequestMapping(value = "/news/{article}", method = RequestMethod.GET)
	public ModelAndView article(@PathVariable String article) {
		ModelAndView view = new ModelAndView();
		Articles articles = userDAO.getSingleArticles(article);
		SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy hh:mm aa");
		String date = sdf.format(articles.getTimestamp().toDate());
		view.addObject("date", date);
		view.addObject("articles", articles);
		view.setViewName("articles");
		return view;
	}

	@RequestMapping(value = "/addtournament", method = RequestMethod.GET)
	public ModelAndView addTournament() {
		ModelAndView view = new ModelAndView();
		Tournaments tournaments = new Tournaments();
		view.addObject("tournaments", tournaments);
		return view;

	}

	@RequestMapping(value = "/addtournament", method = RequestMethod.POST)
	public ModelAndView addTournamentPost(@ModelAttribute("tournaments") Tournaments tournaments) {
		ModelAndView view = new ModelAndView();
		userDAO.submitTournamets(tournaments);
		view.setViewName("redirect:/");
		return view;
	}
}
