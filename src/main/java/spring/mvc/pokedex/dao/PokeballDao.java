package spring.mvc.pokedex.dao;

import java.util.List;
import java.util.Optional;

import spring.mvc.pokedex.model.entity.Pokeball;

public interface PokeballDao {

	// 1.查詢所有寶可夢球
	List<Pokeball> findAllPokeballs();
	
	// 2.查詢使用者擁有的寶可夢球
	List<Pokeball> findUserPokeballs(int userId);
	
	// 3.新增寶可夢到寶可夢球中
	int addPokeball(Pokeball pokeball);
	
	// 4.修改寶可夢球中的寶可夢的CP值
	void updatePokemonCp(int pokeballId, int newCp);
	
	// 5.根據寶可夢ID查詢寶可夢球
	List<Pokeball> findPokeballsByPokemonId(int pokemonId);
	
	// 6.根據使用者ID及寶可夢ID查詢到寶可夢球(多筆)
    List<Pokeball> findPokeballsByUserIdAndPokemonId(int userId, int pokemonId);
    
    // 7.根據寶可夢球ID找到使用者名稱及寶可夢名稱(單筆)
    Optional<Pokeball> findPokeballById(int pokeballId);
    
    // 8.根據寶可夢球ID刪除寶可夢
    Boolean deletePokeball(int pokeballId);
}
