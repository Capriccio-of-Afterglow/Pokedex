package spring.mvc.pokedex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PokedexController {

	
	@GetMapping("/frontend/main")
	public String showPokedex() {
		return "pokedex/frontend/main";
	}
	
	@GetMapping("/frontend/dex")
	public String showdex() {
		return "pokedex/frontend/dex";
	}
	
}
