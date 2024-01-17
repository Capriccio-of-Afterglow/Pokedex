package spring.mvc.pokedex.dao;

import java.util.List;

import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.Pokemon;

public interface PokeballDao {

	//查詢所有寶可夢球
	List<Pokeball> findAllPokeballs();
	
	// 查詢使用者擁有的寶可夢球
	List<Pokeball> getUserPokeballs(int userId);
	
	
}
