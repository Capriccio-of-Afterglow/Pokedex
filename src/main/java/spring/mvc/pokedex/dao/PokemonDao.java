package spring.mvc.pokedex.dao;
import java.util.List;
import java.util.Optional;

import spring.mvc.pokedex.model.entity.Pokemon;

public interface PokemonDao {

	// 查詢所有寶可夢
	List<Pokemon> getAllPokemons();
	
	// 新增寶可夢
	void addPokemon(Pokemon pokemon);
	
	//4. 根據寶可夢名稱查找寶可夢
	Optional<Pokemon> findPokemonByPokemonName(String pokemonName);
		
	//5. 根據寶可夢ID查找寶可夢(單筆)
	Optional<Pokemon> findPokemonByPokemonId(Integer pokemonId);
	
	// 依照屬性列出寶可夢
	List<Pokemon> getPokemonsBytype(String type);
		
	// 查詢使用者擁有的寶可夢
	List<Pokemon> getUserPokemons(int userId);
	
	// 修改寶可夢資料
	void updatePokemonAttributes(Pokemon pokemon);
	
	// 根據 ID 刪除寶可夢
	void deletePokemon(int pokemonId);
	
	
	
	
	
	
	
}
