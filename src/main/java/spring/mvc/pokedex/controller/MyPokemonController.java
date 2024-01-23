package spring.mvc.pokedex.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.pokedex.dao.PokeballDao;
import spring.mvc.pokedex.dao.PokemonDao;
import spring.mvc.pokedex.dao.TypeDao;
import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.Type;

@Controller
@RequestMapping("/myPokemon")
public class MyPokemonController {
	
	@Autowired
	PokemonDao pokemonDao;
	
	@Autowired
	TypeDao typeDao;
	
	@Autowired
	PokeballDao pokeballDao;
	
	@GetMapping("/")
	@ResponseBody
	public String index() {
		return "Index";
	}
	
	@GetMapping("/{userId}")
	public String myPokemon(@PathVariable("userId") int userId, Model model, HttpSession session) {
	    session.setAttribute("userId", userId);
	    List<Pokeball> pokeballs = pokeballDao.findUserPokeballsByUserId(userId);
	    model.addAttribute("pokeballs", pokeballs);
	    return "pokedex/frontend/myPokemon";
	}
	
}