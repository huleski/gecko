package com.myself.gecko.web.filter;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		
		final HttpServletRequest request = (HttpServletRequest) servletRequest;
		
		HttpServletRequest proxyInstance = (HttpServletRequest) Proxy.newProxyInstance(
				servletRequest.getClass().getClassLoader(), servletRequest.getClass().getInterfaces(),
				new InvocationHandler() {
					@Override
					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if ("getParameter".equals(method.getName())) {
							if ("get".equalsIgnoreCase(request.getMethod())) {
								String value = (String) method.invoke(request, args);
								if(value == null) {
									return null;
								} else {
									return new String(value.getBytes("ISO8859-1"), "UTF-8");
								}
								
							} else if ("post".equalsIgnoreCase(request.getMethod())) {
								request.setCharacterEncoding("UTF-8");
								return method.invoke(request, args);
							}
						}
						return method.invoke(request, args);
					}
				});

		filterChain.doFilter(proxyInstance, servletResponse);
	}

	@Override
	public void destroy() {

	}

}
