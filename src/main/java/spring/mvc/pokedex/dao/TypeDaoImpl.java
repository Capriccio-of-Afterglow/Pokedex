package spring.mvc.pokedex.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.mvc.pokedex.model.entity.Type;

@Repository
public class TypeDaoImpl implements TypeDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Type> findAllTypes() {
		String sql = "SELECT typeId, typeName FROM type order by 1";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Type.class));
	}

	@Override
	public List<Type> findAllTypesByTypeId(Integer typeId) {
		String sql = "SELECT typeId, typeName FROM type where typeId=? order by 1";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Type.class),typeId);
	}

}
