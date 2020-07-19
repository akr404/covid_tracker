package com.application.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;

@Service
public class GraphService {

	public String convertTOGraphxs(List<Map<String, Object>> data)
	{
		Gson gsonObj = new Gson();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object> item: data)
		{
			Map<String, Object> indian = new HashMap<>();
			indian.put("y", item.get("Confirmed"));
			indian.put("x", item.get("Date"));
			list.add(indian);
		}

		return gsonObj.toJson(list);
		
	}
	public String convertTOGraphPie(List<Map<String, Object>> data)
	{
		Gson gsonObj = new Gson();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object> item: data)
		{
			Map<String, Object> indian = new HashMap<>();
			indian.put("label", item.get("country"));
			indian.put("y", item.get("cases"));
			list.add(indian);
		}
		System.out.println(gsonObj.toJson(list));
		return gsonObj.toJson(list);
		
	}
}
