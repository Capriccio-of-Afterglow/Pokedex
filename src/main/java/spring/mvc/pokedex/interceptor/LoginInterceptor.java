package spring.mvc.pokedex.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.pokedex.model.entity.User;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	        throws Exception {
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");

	    // 如果用戶未登入，導向登入頁面
	    if (user == null) {
	        response.sendRedirect(request.getServletContext().getContextPath() + "/mvc/login");
	        return false; // 不放行
	    }

	    return true; // 其他情況放行
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
}