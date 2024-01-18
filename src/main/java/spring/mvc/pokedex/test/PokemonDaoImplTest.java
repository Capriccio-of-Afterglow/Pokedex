package spring.mvc.pokedex.test;

import java.util.List;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.mvc.pokedex.dao.PokemonDaoImpl;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.User;

public class PokemonDaoImplTest {
public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		PokemonDaoImpl pokemonDaoImpl= ctx.getBean("pokemonDaoImpl",PokemonDaoImpl.class);

		// 測試查詢所有寶可夢功能
//		List<Pokemon> pokemons = pokemonDaoImpl.findAllPokemons();
//		System.out.println(pokemons);
		
		
//		// 新增Pokemon
//		Pokemon addPokemon = new Pokemon();
//		addPokemon.setPokemonId(27);
//		addPokemon.setPokemonName("雷");
//		addPokemon.setImg("0027.png");
//		addPokemon.setDescription("呵呵。");
//		List<Integer> typeIds = List.of(5);
//		pokemonDaoImpl.addPokemon(addPokemon,typeIds);
//		System.out.println(addPokemon);
//		
//		// 測試透過名稱查詢
//		String pokemonName = "皮卡丘";
//		Optional<Pokemon> test1 = pokemonDaoImpl.findPokemonByPokemonName(pokemonName);
//		System.out.println(test1);
//		
//		// 測試透過ID查詢
//		int pokemonId = 778 ;
//		Optional<Pokemon> test2 = pokemonDaoImpl.findPokemonByPokemonId(pokemonId);
//		System.out.println(test2);
//		
//		// 測試修改
//		Pokemon upPokemon = new Pokemon();
//		upPokemon.setPokemonId(25);
//		upPokemon.setPokemonName("皮卡丘");
//		upPokemon.setImg("0025.png");
//		upPokemon.setDescription("阿反正借我測試一下");
//		pokemonDaoImpl.updatePokemonAttributes(upPokemon);
//	
//		
//		// 測試透過名稱查詢
//		String pokemonName = "皮卡丘";
//		Optional<Pokemon> test1 = pokemonDaoImpl.findPokemonByPokemonName(pokemonName);
//		System.out.println(test1);
				
		// 測試刪除
		Integer pokemonId = 778;
		pokemonDaoImpl.deletePokemon(pokemonId);
		
	}
	
}
