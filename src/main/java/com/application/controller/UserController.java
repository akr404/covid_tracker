package com.application.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.application.model.Authority;
import com.application.model.User;
import com.application.service.UserService;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	@Autowired
	UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("errorMsg", "Unable to login");

		if (logout != null)
			model.addAttribute("msg", "Logout successful");

		return "login";
	}
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView loginUser() {
		logger.debug("login----");
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ModelAndView modelAndView = new ModelAndView("user");
		String username = user.getUsername();
		List<Authority> role = userService.getUserAuthority(username);
		if(role.get(0).getAuthority().equals("ROLE_ADMIN"))
		{
			modelAndView = new ModelAndView("admin");
			modelAndView.addObject("type", "admin");
		}
		else
		{
			modelAndView = new ModelAndView("user");
			modelAndView.addObject("type", "user");
		}
		  
		String uri = "https://covid-19india-api.herokuapp.com/all";
		RestTemplate restTemplate = new RestTemplate();
		List<Map<String, Object>> result = restTemplate.getForObject(uri, ArrayList.class);
		modelAndView.addObject("summary", Arrays.asList(result));
		
		modelAndView.addObject("name", username);
		return modelAndView;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register(Model model) {
		model.addAttribute("register", new User());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("register"); 
		return modelAndView;
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView addNewUSer(@ModelAttribute("user") User user) {
		logger.debug("register---");
		//encode passwrd
		String pass = user.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String passEncoded = encoder.encode(pass);
		
		String role = user.getRole();
		if(role == null || role.isEmpty()) user.setRole("ROLE_USER");
		else if(role.equals("admin")) user.setRole("ROLE_ADMIN");
		else user.setRole("ROLE_USER");
		
		try
		{
			user.setPassword(passEncoded);
			userService.insertUser(user);
			userService.insertUserAuthority(user);
		}
		catch(Exception e)
		{
			logger.error("unable to resiter:{}", e.toString());
			ModelAndView modelAndView = new ModelAndView("error_reg");
			return modelAndView;
		}
		
		ModelAndView modelAndView = new ModelAndView("reg_success");
		return modelAndView;
	}
	
	@RequestMapping(value = "/reg_success", method = RequestMethod.GET)
	public ModelAndView reg_success(Model model) {
		ModelAndView modelAndView = new ModelAndView("register");
		return modelAndView;
	}

	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView loginSeller() {
		logger.debug("return seller page-----");
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ModelAndView modelAndView = new ModelAndView("user");
		String username = user.getUsername();
		List<Authority> role = userService.getUserAuthority(username);
		if(role.get(0).getAuthority().equals("ROLE_ADMIN"))
		{
			modelAndView = new ModelAndView("admin");
			modelAndView.addObject("type","admin");
		}
		else
		{
			modelAndView = new ModelAndView("user");
			modelAndView.addObject("type", "user");
		}
		modelAndView.addObject("name", username);
		return modelAndView;
	}
	
}
