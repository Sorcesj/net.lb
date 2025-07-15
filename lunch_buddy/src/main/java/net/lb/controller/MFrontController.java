package net.lb.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MFrontController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		
		String command=RequestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		Action action=null;
		
		Properties prop=new Properties();
		
		FileInputStream fis=
				new FileInputStream(request.getSession().getServletContext().getRealPath("WEB-INF/classes/daum.properties"));
		
		prop.load(fis);
		fis.close();
		
		String value=prop.getProperty(command);
		
		if(value.substring(0,7).equals("execute")) {
			try {
			   StringTokenizer st=new StringTokenizer(value,"|");
			   
			   String url_1=st.nextToken();
			   String url_2=st.nextToken();
			   Class url=Class.forName(url_2);
			   
			   action=(Action)url.newInstance();
			   
			   try {
				   forward=action.execute(request, response);
				  
			   }catch(Exception e) {
				   e.printStackTrace();
			   }
			}catch(ClassNotFoundException ex) {
				ex.printStackTrace();
			}catch(InstantiationException ex) {
				ex.printStackTrace();
			}catch(IllegalAccessException ex) {
				ex.printStackTrace();
			}
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());				
			}else {
				RequestDispatcher dis=request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
}
}
