package spring.mvc.pokedex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring.mvc.pokedex.model.entity.Pokemon;

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
	
	@GetMapping("/frontend/pokemonPage")
	public String showPokemon() {
		return "pokedex/frontend/pokemonPage";
	}
	
	
}
