package com.app.core.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.app.bean.TUser;

/**
 * ��½������
 * LoginInterceptor<BR>
 * @version 1.0.0
 */
public class LoginInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		TUser user = (TUser) request.getSession().getAttribute("user");
		String requestType = request.getHeader("X-Requested-With");
		if(user==null){
			//�����ajax�����־λ
			if (requestType != null && requestType.equals("XMLHttpRequest")) {
				//��response�������������
				response.getWriter().print("logout");
			}else{
				//��ͨ���������a���ӳ����window.location.href����ĵ�ַ��ֱ�ӷ��ص���ҳ
				response.sendRedirect(request.getContextPath());//��ҳ�Ӷ�
			}
			return false;
		}else{
			return true;
		}
	}
	
	

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}
