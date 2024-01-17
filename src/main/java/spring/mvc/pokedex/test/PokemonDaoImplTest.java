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
		/*
		// 測試查詢所有寶可夢功能
		List<Pokemon> pokemons = pokemonDaoImpl.findAllPokemons();
		System.out.println(pokemons);

		
		// 新增Pokemon
		Pokemon addPokemon = new Pokemon();
		addPokemon.setPokemonId(28);
		addPokemon.setPokemonName("穿山王");
		addPokemon.setImg("0028.png");
		addPokemon.setDescription("爪子和尖刺經常折斷。折斷的爪子和尖刺被人們用來製作成耕作土地的工具。");
		List<Integer> typeIds = List.of(9);
		pokemonDaoImpl.addPokemon(addPokemon,typeIds);
		System.out.println(addPokemon);
		*/
		String pokemonName = "皮卡丘";
		Optional<Pokemon> test1 = pokemonDaoImpl.findPokemonByPokemonName(pokemonName);
		System.out.println(test1);
		
		int pokemonId = 778 ;
		Optional<Pokemon> test2 = pokemonDaoImpl.findPokemonByPokemonId(pokemonId);
		System.out.println(test2);
		
	}
	
}
