package com.myself.gecko.web.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String methodStr = request.getParameter("method");
		Class clazz = this.getClass();
		try {
			Method methode = clazz.getMethod(methodStr, HttpServletRequest.class, HttpServletResponse.class);
			String path = (String) methode.invoke(this, request, response);
			if (path != null) {
				request.getRequestDispatcher(path).forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/500.jsp").forward(request, response);
		}
	}
       
	
}
