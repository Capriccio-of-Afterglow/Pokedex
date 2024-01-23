package spring.mvc.pokedex.controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.pokedex.dao.PokeballDao;
import spring.mvc.pokedex.dao.PokemonDao;
import spring.mvc.pokedex.dao.TypeDao;
import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.Type;

@Controller
public class PokedexController {

	@Autowired
	PokemonDao pokemonDao;
	
	@Autowired
	TypeDao typeDao;
	
	@Autowired
	PokeballDao pokeballDao;
	
	@GetMapping("/frontend/main")
	public String showmain() {
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
	public String showdex(Model model, @RequestParam(name = "typeId", required = false) Integer typeId) {
	    List<Type> types = typeDao.findAllTypes();
	    model.addAttribute("types", types);

	    List<Pokemon> pokemons;
	    if (typeId != null && typeId > 0 && typeId < 19) {
	        pokemons = pokemonDao.findAllPokemonsByTypeId(typeId);
	    } else {
	        pokemons = pokemonDao.findAllPokemons();
	    }
	    model.addAttribute("pokemons", pokemons);

	    return "pokedex/frontend/dex";
	}
	@GetMapping("/frontend/dex/page/{pokemonId}")
	public String showPokemonPage(@PathVariable("pokemonId") int pokemonId, Model model) {
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
	@PostMapping("/addToPokeball")
	public String addToPokeball(@RequestParam("pokemonId") int pokemonId, HttpSession session) {
	    // 這裡寫加入 pokeball 的邏輯，使用 session 中的 userId 來連結到該使用者的 pokeball
	    int userId = (int) session.getAttribute("userId");
	    
	    Pokeball pokeball = new Pokeball();
		pokeball.setUserId(userId);
		pokeball.setPokemonId(pokemonId);
		pokeball.setCp(new Random().nextInt(101));
		
		pokeballDao.addPokeball(pokeball);

	    // 重新導向到原本的寶可夢詳細資訊頁面
	    return "redirect:/pokemon/pokemonPage?pokemonId=" + pokemonId;
	}
	
	
}
