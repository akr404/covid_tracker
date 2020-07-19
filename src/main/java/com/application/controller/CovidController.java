package com.application.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;

import java.io.IOException;
import java.time.*;

import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.application.model.Authority;
import com.application.service.GraphService;
import com.application.service.UserService;
import com.application.xmlutil.XmlUtil;
import com.google.gson.Gson;

@Controller
public class CovidController {
	@Autowired
	UserService userService;
	
	@Autowired
	GraphService graphService;

    private static final Logger logger = LoggerFactory.getLogger(CovidController.class);
	
	@RequestMapping(value = "/state", method = RequestMethod.GET)
	public ModelAndView loginUser() {
		
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ModelAndView modelAndView = new ModelAndView("user");
		final String uri = "https://covid-19india-api.herokuapp.com/all";

	    RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject(uri, String.class);

		modelAndView.addObject("name", user.getUsername());
		modelAndView.addObject("summary", result);
		return modelAndView;
	}
	
	@RequestMapping(value = "/graphs_india", method = RequestMethod.GET)
	public ModelAndView graphs_india(Model model) {
		ModelAndView modelAndView = new ModelAndView("graphs_india");
		logger.debug("return graph page-----");
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		List<Authority> role = userService.getUserAuthority(username);
		if(role.get(0).getAuthority().equals("ROLE_ADMIN"))
		{
			modelAndView.addObject("type","admin");
		}
		else
		{
			modelAndView.addObject("type", "user");
		}
		//India graph
		String uri = "https://api.covid19api.com/country/india?from=2020-03-01T00:00:00Z&to="+ LocalDate.now()+"T00:00:00Z";
	    RestTemplate restTemplate = new RestTemplate();
	    List<Map<String, Object>> result = restTemplate.getForObject(uri, ArrayList.class);
	    modelAndView.addObject("timeline", graphService.convertTOGraphxs(result));
	    
	    //India graph
	    CloseableHttpClient httpClient = HttpClients.custom().setSSLHostnameVerifier(new NoopHostnameVerifier()).build();
	    HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
	    requestFactory.setHttpClient(httpClient);
	    restTemplate = new RestTemplate(requestFactory);
  		uri = "https://corona.lmao.ninja/v2/countries?yesterday&sort";
  	    result = restTemplate.getForObject(uri, ArrayList.class);
  	    modelAndView.addObject("dataPie", graphService.convertTOGraphPie(result));
  	    
  	    
  	    
		modelAndView.addObject("name", user.getUsername());
		return modelAndView;
	}
	
	@RequestMapping(value = "/maps_india", method = RequestMethod.GET)
	public ModelAndView maps_india(Model model) {
		ModelAndView modelAndView = new ModelAndView("maps_india");
		logger.debug("return map page-----");
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		List<Authority> role = userService.getUserAuthority(username);
		if(role.get(0).getAuthority().equals("ROLE_ADMIN"))
		{
			modelAndView.addObject("type","admin");
		}
		else
		{
			modelAndView.addObject("type", "user");
		}
		modelAndView.addObject("name", user.getUsername());
		return modelAndView;
	}
	@RequestMapping(value = "/rss_feed", method = RequestMethod.GET)
	public ModelAndView rss_feed(Model model) {
		ModelAndView modelAndView = new ModelAndView("rss_feed");
		logger.debug("return map page-----");
		UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		List<Authority> role = userService.getUserAuthority(username);
		if(role.get(0).getAuthority().equals("ROLE_ADMIN"))
		{
			modelAndView.addObject("type","admin");
		}
		else
		{
			modelAndView.addObject("type", "user");
		}
		modelAndView.addObject("name", user.getUsername());
		
		//Rss_feed
		String uri = "https://tools.cdc.gov/api/v2/resources/media/404952.rss";
	    RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject(uri, String.class);

	    String message = null;
		message = XmlUtil.parseXML(result);
	    modelAndView.addObject("feed", message);
		return modelAndView;
	}	
}
