package spring.mvc.pokedex.dao;

import java.util.List;

import spring.mvc.pokedex.model.entity.Type;

public interface TypeDao {

	List<Type> findAllTypes();
	
	List<Type> findAllTypesByTypeId(Integer typeId);
}
