package spring.mvc.pokedex.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.mvc.pokedex.dao.PokemonDaoImpl;
import spring.mvc.pokedex.model.entity.Pokemon;

public class PokemonDaoImplTest {
public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		PokemonDaoImpl pokemonDaoImpl= ctx.getBean("pokemonDaoImpl",PokemonDaoImpl.class);
		
		// 測試查詢所有寶可夢功能
		List<Pokemon> pokemons = pokemonDaoImpl.findAllPokemons();
		System.out.println(pokemons);

		
		// 新增Pokemon
		Pokemon addPokemon = new Pokemon();
		addPokemon.setPokemonId(93);
		addPokemon.setPokemonName("鬼斯通");
		addPokemon.setImg("0093.png");
		addPokemon.setDescription("喜歡躲在黑暗中伸出氣體構成的手去拍人的肩膀。一旦被接觸到，身體便會抖個不停。");
		List<Integer> typeIds = List.of(14,8);
		pokemonDaoImpl.addPokemon(addPokemon,typeIds);
		System.out.println(addPokemon);

	}
	
}
