package spring.mvc.pokedex.dao;

import java.util.List;
import java.util.Optional;

import spring.mvc.pokedex.model.entity.Pokemon;

public class PokemonDaoImpl implements PokemonDao {

	@Override
	public List<Pokemon> getAllPokemons() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addPokemon(Pokemon pokemon) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Optional<Pokemon> findPokemonByPokemonName(String pokemonName) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public Optional<Pokemon> findPokemonByPokemonId(Integer pokemonId) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public List<Pokemon> getPokemonsBytype(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Pokemon> getUserPokemons(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePokemonAttributes(Pokemon pokemon) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePokemon(int pokemonId) {
		// TODO Auto-generated method stub
		
	}

}
