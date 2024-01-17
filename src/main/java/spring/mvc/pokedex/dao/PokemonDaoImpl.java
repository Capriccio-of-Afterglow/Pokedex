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
import spring.mvc.pokedex.model.entity.User;


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
		 String sql = "select * from pokemon where pokemonname = ?";
		  try {
		        Pokemon pokemon = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Pokemon.class), pokemonName);
		        return Optional.ofNullable(pokemon);
		    } catch (EmptyResultDataAccessException e) {
		        return Optional.empty();
		    }
		}

	@Override
	public Optional<Pokemon> findPokemonByPokemonId(Integer pokemonId) {
		 String sql = "select * from pokemon where pokemonId = ?";
		  try {
		        Pokemon pokemon = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Pokemon.class), pokemonId);
		        return Optional.ofNullable(pokemon);
		    } catch (EmptyResultDataAccessException e) {
		        return Optional.empty();
		    }
		}

	@Override
	public Boolean updatePokemonAttributes(Pokemon pokemon) {
	    final String updatePokemonSql = "UPDATE pokemon SET pokemonName = ?, img = ?, description = ? WHERE pokemonId = ?";

	    int rowsAffected = jdbcTemplate.update(updatePokemonSql, pokemon.getPokemonName(), pokemon.getImg(), pokemon.getDescription(), pokemon.getPokemonId());

	    return rowsAffected > 0;
	}


	@Override
	public Boolean deletePokemon(int pokemonId) {
	    final String deletePokemonSql = "DELETE FROM pokemon WHERE pokemonId = ?";

	    int rowsAffected = jdbcTemplate.update(deletePokemonSql, pokemonId);

	    return rowsAffected > 0;
	}

}
