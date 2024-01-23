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

	    // 如果請求的 URI 包含 /myPokemon 或 /addToPokeball，但用戶未登入，導向登入頁面
	    if ((request.getRequestURI().contains("/myPokemon") || request.getRequestURI().contains("/addToPokeball")) && user == null) {
	        response.sendRedirect(request.getServletContext().getContextPath() + "/mvc/login");
	        return false; // 不放行
	    }

	    // 如果有使用者登入，且請求的 URI 包含 /myPokemon 或 /addToPokeball，但 URL 上的 userID 與 Session 中的 userID 不一致，導向登入頁面
	    if (user != null && (request.getRequestURI().contains("/myPokemon") || request.getRequestURI().contains("/addToPokeball"))) {
	        int urlUserId = extractUserIdFromUrl(request.getRequestURI());
	        if (urlUserId != user.getUserId()) {
	            response.sendRedirect(request.getServletContext().getContextPath() + "/mvc/login");
	            return false; // 不放行
	        }
	    }

	    return true; // 其他情況放行
	}

	// Helper function to extract userID from URL
	private int extractUserIdFromUrl(String uri) {
	    // 實現你的邏輯來從 URL 中提取 userID，例如透過正則表達式或其他方法
	    // 這裡僅作示範
	    String[] parts = uri.split("/");
	    for (int i = 0; i < parts.length; i++) {
	        if ("user".equals(parts[i]) && i + 1 < parts.length) {
	            try {
	                return Integer.parseInt(parts[i + 1]);
	            } catch (NumberFormatException e) {
	                // 轉換失敗，可添加適當的錯誤處理邏輯
	            }
	        }
	    }
	    return -1; // 或者返回一個表示未找到的特殊值
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