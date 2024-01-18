package spring.mvc.pokedex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPokemon")
public class MyPokemonController {

	@GetMapping
	public String myPokemon() {
		return "pokedex/frontend/myPokemon";
	}
}
