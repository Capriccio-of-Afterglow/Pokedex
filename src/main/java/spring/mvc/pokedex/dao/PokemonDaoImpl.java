package spring.mvc.pokedex.dao;

import java.sql.ResultSet;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.Type;


@Repository
public class PokemonDaoImpl implements PokemonDao {

	@Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<Pokemon> pokemonRowMapper = (ResultSet rs, int rowNum) -> {
        Pokemon pokemon = new Pokemon();
        pokemon.setPokemonId(rs.getInt("pokemonId"));
        pokemon.setPokemonName(rs.getString("pokemonName"));
        pokemon.setImg(rs.getString("img"));
        pokemon.setDescription(rs.getString("description"));
        
        return pokemon;
    };

    @Override
    public List<Pokemon> findAllPokemons() {
        String sql = "SELECT * FROM pokemon";
        List<Pokemon> pokemons = jdbcTemplate.query(sql, pokemonRowMapper);

        for (Pokemon pokemon : pokemons) {
            setPokemonTypes(pokemon);
        }

        return pokemons;
    }

    private void setPokemonTypes(Pokemon pokemon) {
        String sql = "SELECT type.typeId, type.typeName FROM type " +
                     "INNER JOIN pokemon_type ON type.typeId = pokemon_type.type_id " +
                     "WHERE pokemon_type.pokemon_id = ?";
        List<Type> types = jdbcTemplate.query(sql, (rs, rowNum) -> {
            Type type = new Type();
            type.setTypeId(rs.getInt("typeId"));
            type.setTypeName(rs.getString("typeName"));
            return type;
        }, pokemon.getPokemonId());

        pokemon.setTypes(types);
    }


	@Override
	public int addPokemon(Pokemon pokemon, List<Integer> typeIds) {
	    final String sql = "insert into pokemon(pokemonId, pokemonName, img, description) values (?, ?, ?, ?)";
	    
	    // 使用提供的 pokemonId 進行插入
	    int rowsAffected = jdbcTemplate.update(sql, pokemon.getPokemonId(), pokemon.getPokemonName(), pokemon.getImg(), pokemon.getDescription());

	    if (rowsAffected > 0) {
	        // Insert into Pokemon_Type for each typeId
	        final String typeSql = "insert into Pokemon_Type(pokemon_Id, type_Id) values (?, ?)";
	        for (Integer types : typeIds) {
	            jdbcTemplate.update(typeSql, pokemon.getPokemonId(), types);
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
