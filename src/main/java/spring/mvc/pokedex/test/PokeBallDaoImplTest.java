package spring.mvc.pokedex.test;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.mvc.pokedex.dao.PokeballDaoImpl;
import spring.mvc.pokedex.dao.PokemonDaoImpl;
import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.User;

public class PokeBallDaoImplTest {
public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		PokeballDaoImpl pokeballDaoImpl= ctx.getBean("pokeballDaoImpl",PokeballDaoImpl.class);
		
		//List<Pokeball> pokeballs = pokeballDaoImpl.findAllPokeballs();
		//System.out.println(pokeballs);
		
//		List<Pokeball> pokeballs = pokeballDaoImpl.findUserPokeballsByUserId(1);
//		System.out.println(pokeballs);
//		
		Pokeball pokeball = new Pokeball();
		pokeball.setUserId(1);
		pokeball.setPokemonId(25);
		pokeball.setCp(new Random().nextInt(101));
		int updatedRow = pokeballDaoImpl.addPokeball(pokeball);
		System.out.printf("Updated Row=%d,Pokeball Id=%d%n",updatedRow,pokeball.getPokeballId());
	}
	
}
