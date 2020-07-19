package com.application.xmlutil;


public class XmlUtil {
	public static String parseXML(String xmlString)
	{
		StringBuffer feeds = new StringBuffer("");
		String[] x = xmlString.split("<description>");
		feeds.append("<ul>");
		for(String i: x)
		{
			
			String y = i.substring(0, i.indexOf("<"));
			if(!y.isEmpty())
			{
				feeds.append("<li>");
				feeds.append(i.substring(0, i.indexOf("<")));
				feeds.append("</li>");
				feeds.append("<br>");
			}
		}
		feeds.append("</ul>");
		return feeds.toString();
	}
}
