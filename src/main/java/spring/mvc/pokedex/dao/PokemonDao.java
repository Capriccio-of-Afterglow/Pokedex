package spring.mvc.pokedex.dao;
import java.util.List;
import java.util.Optional;

import spring.mvc.pokedex.model.entity.Pokemon;

public interface PokemonDao {

	// 1.查詢所有寶可夢
	List<Pokemon> findAllPokemons();
	
	// 2.新增寶可夢
	int addPokemon(Pokemon pokemon, List<Integer> typeIds);
	
	//3. 根據寶可夢名稱查找寶可夢
	Optional<Pokemon> findPokemonByPokemonName(String pokemonName);
		
	//4. 根據寶可夢ID查找寶可夢(單筆)
	Optional<Pokemon> findPokemonByPokemonId(Integer pokemonId);
	
	// 依照屬性列出寶可夢 (獨立寫到屬性關聯表DAO)
	//List<Pokemon> getPokemonsBytype(String type);
		
	
	// 5.修改寶可夢資料
	void updatePokemonAttributes(Pokemon pokemon);
	
	// 6.根據 ID 刪除寶可夢
	Boolean deletePokemon(int pokemonId);
	
	
	
	
	
	
	
}
