package spring.mvc.pokedex.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.Pokemon;
import spring.mvc.pokedex.model.entity.Type;

@Repository
public class PokeballDaoImpl implements PokeballDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	PokemonDao pokemonDao;
	
	RowMapper<Pokeball> rowMapper = (ResultSet rs, int rowNum) -> {
		Pokeball pokeball = new Pokeball();
		pokeball.setPokeballId(rs.getInt("pokeballId"));
		pokeball.setPokemonId(rs.getInt("pokemonId"));
		pokeball.setUserId(rs.getInt("userId"));
		pokeball.setCp(rs.getInt("cp"));
		Optional<Pokemon> pokemonOptional = pokemonDao.findPokemonByPokemonId(rs.getInt("pokemonId"));
		if(pokemonOptional.isPresent()) {
			pokeball.setPokemon(pokemonOptional.get());
		}
		return pokeball;
	};

	@Override
	public List<Pokeball> findAllPokeballs() {
		String sql = "SELECT pokeballId, userId, pokemonId, cp FROM pokeball";
		return jdbcTemplate.query(sql, rowMapper);
	}

	@Override
	public List<Pokeball> findUserPokeballsByUserId(int userId) {
		String sql = "SELECT pokeballId, userId, pokemonId, cp FROM pokeball where userId = ? ";
		
		List<Pokeball> pokeballs = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Pokeball.class), userId);
		pokeballs.forEach(this::setPokemonInPokeball);
		return pokeballs;
		
	}

	private void setPokemonTypes(Pokemon pokemon) {
		String sql = "SELECT type.typeId, type.typeName FROM type "
				+ "INNER JOIN pokemon_type ON type.typeId = pokemon_type.typeId "
				+ "WHERE pokemon_type.pokemonId = ?";
		List<Type> types = jdbcTemplate.query(sql, (rs, rowNum) -> {
			Type type = new Type();
			type.setTypeId(rs.getInt("typeId"));
			type.setTypeName(rs.getString("typeName"));
			return type;
		}, pokemon.getPokemonId());

		pokemon.setTypes(types);
	}
	private void setPokemonInPokeball(Pokeball pokeball) {
		
		String sql = "SELECT pokemonId, pokemonName, img, description FROM pokemon where pokemonId = ? ";
		
		Pokemon UsersPokemon = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Pokemon.class),pokeball.getPokemonId());
		setPokemonTypes(UsersPokemon);
		pokeball.setPokemon(UsersPokemon);
	}
	@Override
	public int addPokeball(Pokeball pokeball) {
	    String sql = "insert into pokeball(userId, pokemonId, cp) values(?,?,?)";

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
		String sql = "SELECT pokeballId, userId, pokemonId, cp FROM pokeball where pokemonId = ? ";
		return jdbcTemplate.query(sql, rowMapper,pokemonId);
	}

	@Override
	public List<Pokeball> findPokeballsByUserIdAndPokemonId(int userId, int pokemonId) {
		String sql = "SELECT pokeballId, userId, pokemonId, cp FROM pokeball where userId=? AND pokemonId = ? ";
		return jdbcTemplate.query(sql, rowMapper,userId,pokemonId);
	}

	@Override
	public Optional<Pokeball> findPokeballById(int pokeballId) {
		String sql = "SELECT pokeballId, userId, pokemonId, cp FROM pokeball where pokeballId = ? ";
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
