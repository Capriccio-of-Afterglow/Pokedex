package spring.mvc.pokedex.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.pokedex.dao.UserDao;
import spring.mvc.pokedex.model.entity.User;

/**
 * http://localhost:8080/Pokedex/mvc/login GET
 * http://localhost:8080/Pokedex/mvc/login POST
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	UserDao userDao;
	
	@GetMapping
	public String loginPage() {
		return "/pokedex/login";
	}
	
	@PostMapping
	public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model, HttpSession session) {
		
		// 驗證帳密
		Optional<User> userOpt = userDao.findUserByUsername(username);
		if(userOpt.isEmpty()) {
			model.addAttribute("error", "帳號或密碼輸入錯誤");
			return "/pokedex/login";
		}
		
		// 加密檢查
		User user = userOpt.get();
		if(!username.equals(user.getUsername()) || ! BCrypt.checkpw(password, user.getPassword()) ) {
			model.addAttribute("error", "帳號或密碼輸入錯誤");
			return "/pokedex/login";
		}
		
		session.setAttribute("user", user);
		
		return "redirect:/mvc/frontend/main";
	}
}
