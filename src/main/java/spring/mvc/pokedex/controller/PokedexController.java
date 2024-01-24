package spring.mvc.pokedex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
@RequestMapping("/frontend")
public class PokedexController {

	@Autowired
	PokemonDao pokemonDao;
	
	@Autowired
	TypeDao typeDao;
	
	@Autowired
	PokeballDao pokeballDao;
	
	@GetMapping("/main")
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
	@GetMapping("/dex")
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
	
	 @GetMapping("/dex/search")
	    public String searchPokemons(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
	        if (keyword != null && !keyword.isEmpty()) {
	            List<Pokemon> searchResults = pokemonDao.findPokemonByPokemonName(keyword);
	            model.addAttribute("pokemons", searchResults);
	        } else {
	            // 如果關鍵字為空，可以處理成顯示全部的邏輯
	            List<Pokemon> allPokemons = pokemonDao.findAllPokemons();
	            model.addAttribute("pokemons", allPokemons);
	        }
	        return "pokedex/frontend/dex";
	    }
	 
	 
	@GetMapping("/dex/page/{pokemonId}")
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
	
	// 使用ajax
	@PostMapping("/pokeball/{pokemonId}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addToPokeball(@PathVariable("pokemonId") int pokemonId, HttpSession session) {
	    Map<String, Object> response = new HashMap<>();

	    Integer userIdObj = (Integer) session.getAttribute("userId");
	    if (userIdObj != null) {
	        int userId = userIdObj.intValue();

	        // 這裡寫加入 pokeball 的邏輯，使用 session 中的 userId 來連結到該使用者的 pokeball
	        Pokeball pokeball = new Pokeball();
	        pokeball.setUserId(userId);
	        pokeball.setPokemonId(pokemonId);
	        pokeball.setCp(new Random().nextInt(101));

	        pokeballDao.addPokeball(pokeball);

	        response.put("success", true);
	        response.put("message", "成功放入背包！");
	        response.put("addedPokemon", pokeball);

	        return ResponseEntity.ok(response);
	    } else {
	        response.put("success", false);
	        response.put("message", "使用者未登入");
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
	    }
	}

	
}
