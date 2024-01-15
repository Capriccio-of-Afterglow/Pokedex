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


	}
	
}
