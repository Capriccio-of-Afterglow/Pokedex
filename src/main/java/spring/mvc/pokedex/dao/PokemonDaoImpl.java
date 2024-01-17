package spring.mvc.pokedex.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.Type;


@Repository
public class PokemonDaoImpl implements PokemonDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Pokemon> findAllPokemons() {
		String sql = "SELECT pokemonId, pokemonName,img FROM pokemon";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Pokemon.class));
	}

	@Override
	public int addPokemon(Pokemon pokemon, List<Integer> typeIds) {
	    final String Sql = "insert into pokemon(pokemonName, img, description) values (?,?,?) ";

	    int rowsAffected = jdbcTemplate.update(Sql, pokemon.getPokemonName(), pokemon.getImg(), pokemon.getDescription());

	    if (rowsAffected > 0) {
	        // Fetch the generated pokemonId
	        Integer pokemonId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
	        pokemon.setPokemonId(pokemonId);

	        // Insert into Pokemon_Type for each typeId
	        final String TypeSql = "insert into Pokemon_Type(pokemonId, typeId) values (?,?) ";
	        for (Integer typeId : typeIds) {
	            jdbcTemplate.update(TypeSql, pokemon.getPokemonId(), typeId);
	        }
	    }

	    return rowsAffected;
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

//	@Override
//	public List<Pokemon> getPokemonsBytype(String type) {
//		// TODO Auto-generated method stub
//		return null;
//	}


	@Override
	public void updatePokemonAttributes(Pokemon pokemon) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Boolean deletePokemon(int pokemonId) {
		return null;
		// TODO Auto-generated method stub
		
	}

}
