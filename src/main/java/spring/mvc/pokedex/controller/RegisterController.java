package spring.mvc.pokedex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.pokedex.dao.UserDao;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	UserDao userDao;
	
	@GetMapping
	public String registerPage() {
		return "/pokedex/register";
	}

}
