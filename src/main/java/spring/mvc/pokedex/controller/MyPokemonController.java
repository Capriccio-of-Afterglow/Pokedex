package spring.mvc.pokedex.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.pokedex.dao.PokeballDao;
import spring.mvc.pokedex.dao.PokemonDao;
import spring.mvc.pokedex.dao.TypeDao;
import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.Pokemon;

@Controller
@RequestMapping("/myPokemon")
public class MyPokemonController {
	
	@Autowired
	PokemonDao pokemonDao;
	
	@Autowired
	TypeDao typeDao;
	
	@Autowired
	PokeballDao pokeballDao;

	@GetMapping("/showMyPokemom")
	public String myPokemon(@RequestParam("userId") int userId, Model model) {
		List<Pokeball> pokeball = pokeballDao.findUserPokeballsByUserId(userId);
		model.addAttribute("pokeball", pokeball);
		return "pokedex/frontend/myPokemon";
	}
}
