package spring.mvc.pokedex.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.Pokemon;

@Repository
public class PokeballDaoImpl implements PokeballDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	PokemonDao pokemonDao;
	
	RowMapper<Pokeball> rowMapper = (ResultSet rs, int rowNum) -> {
		Pokeball pokeball = new Pokeball();
		pokeball.setPokeballId(rs.getInt("pokeballId"));
		pokeball.setPokemonId(rs.getInt("pokemon_id"));
		pokeball.setUserId(rs.getInt("user_id"));
		pokeball.setCp(rs.getInt("cp"));
		Optional<Pokemon> pokemonOptional = pokemonDao.findPokemonByPokemonId(rs.getInt("pokemon_id"));
		if(pokemonOptional.isPresent()) {
			pokeball.setPokemon(pokemonOptional.get());
		}
		return pokeball;
	};

	@Override
	public List<Pokeball> findAllPokeballs() {
		String sql = "SELECT pokeballId, user_id, pokemon_id, cp FROM pokeball";
		return jdbcTemplate.query(sql, rowMapper);
	}

	@Override
	public List<Pokeball> findUserPokeballsByUserId(int userId) {
		String sql = "SELECT pokeballId, user_id, pokemon_id, cp FROM pokeball where user_id = ? ";
		return jdbcTemplate.query(sql, rowMapper,userId);
	}

	@Override
	public int addPokeball(Pokeball pokeball) {
	    String sql = "insert into pokeball(user_id, pokemon_id, cp) values(?,?,?)";

	    KeyHolder keyHolder = new GeneratedKeyHolder();
	    int rowUpdated = jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	        ps.setInt(1, pokeball.getUserId());
	        ps.setInt(2, pokeball.getPokemonId());
	        ps.setInt(3, pokeball.getCp());
	        return ps;
	    }, keyHolder);
	    pokeball.setPokeballId(keyHolder.getKey().intValue());

	    return rowUpdated;
	}

	@Override
	public int updatePokemonCp(int pokeballId, int newCp) {
		String sql = "UPDATE pokeball set cp=? where pokeballId=?";
		return jdbcTemplate.update(sql, newCp,pokeballId);
	}

	@Override
	public List<Pokeball> findPokeballsByPokemonId(int pokemonId) {
		String sql = "SELECT pokeballId, user_id, pokemon_id, cp FROM pokeball where pokemonId = ? ";
		return jdbcTemplate.query(sql, rowMapper,pokemonId);
	}

	@Override
	public List<Pokeball> findPokeballsByUserIdAndPokemonId(int userId, int pokemonId) {
		String sql = "SELECT pokeballId, user_id, pokemon_id, cp FROM pokeball where user_id=? AND pokemonId = ? ";
		return jdbcTemplate.query(sql, rowMapper,userId,pokemonId);
	}

	@Override
	public Optional<Pokeball> findPokeballById(int pokeballId) {
		String sql = "SELECT pokeballId, user_id, pokemon_id, cp FROM pokeball where pokeballId = ? ";
		try {
			Pokeball pokeball = jdbcTemplate.queryForObject(sql, rowMapper, pokeballId);
			return Optional.ofNullable(pokeball);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	@Override
	public int deletePokeball(int pokeballId) {
		String sql = "Delete pokeball where pokeballId = ? ";
		return jdbcTemplate.update(sql, pokeballId);
	}

}
