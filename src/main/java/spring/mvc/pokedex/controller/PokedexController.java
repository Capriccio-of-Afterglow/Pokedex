package spring.mvc.pokedex.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.pokedex.dao.PokemonDao;
import spring.mvc.pokedex.dao.TypeDao;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.Type;

@Controller
public class PokedexController {

	@Autowired
	PokemonDao pokemonDao;
	
	@Autowired
	TypeDao typeDao;
	
	@GetMapping("/frontend/main")
	public String showPokedex() {
		return "pokedex/frontend/main";
	}
	
	/**
	 * http://localhost:8080/Pokedex/mvc/frontend/dex
	 * http://localhost:8080/Pokedex/mvc/frontend/dex?typeId=1
	 * @param model
	 * @param typeId
	 * @return
	 */
	@GetMapping("/frontend/dex")
	public String showdex(Model model, @RequestParam(name = "typeId", required= false) Integer typeId) {
		
		List<Type> types = typeDao.findAllTypes();
		model.addAttribute("types", types);
		
		List<Pokemon> pokemons;
		if(typeId != null && typeId > 0 && typeId < 19) {
			pokemons = pokemonDao.findAllPokemonsByTypeId(typeId);
		} else {
			pokemons = pokemonDao.findAllPokemons();
		}
		model.addAttribute("pokemons", pokemons);
		
		return "pokedex/frontend/dex";
	}
	
	@GetMapping("/frontend/pokemonPage")
	public String showPokemonPage(@RequestParam("pokemonId") int pokemonId, Model model) {
	    // 根據 pokemonId 查詢寶可夢詳細資訊
	    Optional<Pokemon> pokemon = pokemonDao.findPokemonByPokemonId(pokemonId);

	    if (pokemon.isPresent()) {
	        model.addAttribute("pokemon", pokemon.get());
	        return "pokedex/frontend/pokemonPage";
	    } else {
	        // 處理 Pokemon 不存在的情況，例如轉發到錯誤頁面
	        return "redirect:/error";
	    }
	}
	
	
}
