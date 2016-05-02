package com.board.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ControllerAction extends HttpServlet{
	
	private Map commandMap =  new HashMap();
	
	public void init(ServletConfig config) throws ServletException {
		//common properties
		loadProperties("com/board/properties/Command");
	}
	
	//properties 설정
	private void loadProperties(String path){
		
		ResourceBundle rbHome = ResourceBundle.getBundle(path); //누구지를 실행할지를 rb에 저장.
		
		Enumeration<String> actionEnumHome = rbHome.getKeys();
		
		while (actionEnumHome.hasMoreElements()) {
			String command = actionEnumHome.nextElement();
			
			String className = rbHome.getString(command);
			
			
		}
		
	}
	
}
