package spring.mvc.pokedex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * http://localhost:8080/Pokedex/mvc/logout GET
 */
@Controller
@RequestMapping("/logout")
public class LogoutController {

	@GetMapping
	public String logout(HttpSession session) {
		session.invalidate();
		return "/pokedex/login";
	}
}
